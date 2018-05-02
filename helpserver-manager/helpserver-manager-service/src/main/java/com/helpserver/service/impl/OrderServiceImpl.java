package com.helpserver.service.impl;

import com.helpserver.dao.*;
import com.helpserver.pojo.*;
import com.helpserver.service.MoneyService;
import com.helpserver.service.OrderService;
import com.helpserver.utils.CommonsUtil;
import com.helpserver.utils.MyThrowException;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/3/06.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    UserDao userDao;
    @Autowired
    OrderinfoDao orderDao;
    @Autowired
    BigtypeDao bigtypeDao;
    @Autowired
    OrdertypeDao orderTypeDao;
    @Autowired
    AcceptorderDao acceptOrderDao;
    @Autowired
    MoneyService moneyService;
    @Autowired
    MoneyDao moneyDao;
    @Autowired
    MoneyhistoryDao moneyHistoryDao;

    /**
     * 添加资源服务
     * 1、添加资源
     * 2、扣除余额保障金
     * 3、添加收支历史
     * @param order
     * @return
     */
    @Transactional
    @Override
    public String insertOrder(Orderinfo order) {
        try {
            //1、添加资源
            if (orderDao.insertSelective(order) == 1) {
                //2、减少余额基本表的余额总数
                Money money = moneyService.getMoney(order.getSenderid());
                Money moneyInfoAdd = new Money();
                moneyInfoAdd.setId(money.getId());
                moneyInfoAdd.setAmount(money.getAmount() - CommonsUtil.sendOrderPutMoney);
                if (moneyDao.updateByPrimaryKeySelective(moneyInfoAdd) == 1) {
                    //3、添加收支历史
                    Moneyhistory moneyhistory = new Moneyhistory();
                    moneyhistory.setUserid(order.getSenderid());
                    moneyhistory.setInfo(CommonsUtil.moneyOrderMoney);
                    moneyhistory.setAmount(CommonsUtil.sendOrderPutMoney);
                    moneyhistory.setTime(order.getSendtime());
                    moneyhistory.setState(0);
                    if (moneyHistoryDao.insertSelective(moneyhistory) == 1) {
                        return "insert_success";
                    } else {
                        throw new MyThrowException("add_failure");
                    }
                } else {
                    //抛出异常
                    throw new MyThrowException("update_failure");
                }
            } else {
                //抛出异常
                throw new MyThrowException("add_failure");
            }
        } catch (MyThrowException e) {
            System.out.println("e========================" + e.getMessage());
            throw e;
        }
    }

    /**
     * 同意抢单
     * state==1时
     * 1、更新订单表，修改已出借数量
     * 2、更新抢单表，修改同意时间、状态
     * state==0时
     * 1、只更新抢单表，修改拒绝时间、状态
     * @param acceptorder
     * @param orderinfo
     * @return
     */
    @Transactional
    @Override
    public String updateAgreeAcceptAndOrder(Acceptorder acceptorder, Orderinfo orderinfo) {
//        Acceptorder acceptorder = acceptOrderDao.selectByPrimaryKey(acceptId);
//        Orderinfo orderinfo = orderDao.selectByPrimaryKey(acceptorder.getOrderid());
        try {
            //1、更新订单表，修改已出借数量
            Orderinfo orderinfoUpdate = new Orderinfo();
            orderinfoUpdate.setId(orderinfo.getId());
            orderinfoUpdate.setOutamount(orderinfo.getOutamount() + acceptorder.getNumber());
            if (orderDao.updateByPrimaryKeySelective(orderinfoUpdate) == 1) {
                //2、更新抢单表，修改同意时间、状态
                Acceptorder acceptorderUpdate = new Acceptorder();
                acceptorderUpdate.setId(acceptorder.getId());
                acceptorderUpdate.setSuretime(TimeUtil.dateToString(new Date()));
                acceptorderUpdate.setAcceptstate(2);
                if (acceptOrderDao.updateByPrimaryKeySelective(acceptorderUpdate) == 1) {
                    return "agree_success";
                } else {
                    //抛出异常
                    throw new MyThrowException("update_failure");
                }
            } else {
                //抛出异常
                throw new MyThrowException("update_failure");
            }
        } catch (MyThrowException e) {
            System.out.println("e========================" + e.getMessage());
            throw e;
        }
    }

    /**不同意抢单
     * state==0时
     * 1、抢单表，修改拒绝时间、状态
     * 2、归还押金，修改余额表、收支历史表
     * @param acceptorder
     * @param orderinfo
     * @return
     */
    @Transactional
    @Override
    public String updateDisagreeAccept(Acceptorder acceptorder, Orderinfo orderinfo) {
//        Acceptorder acceptorder = acceptOrderDao.selectByPrimaryKey(acceptId);
//        Orderinfo orderinfo = orderDao.selectByPrimaryKey(acceptorder.getOrderid());
        String date = TimeUtil.dateToString(new Date());
        int userId = acceptorder.getAccepterid();
        int amount = orderinfo.getMoneyamount();
        try {
            //1、更新抢单表
            Acceptorder acceptorderUpdate = new Acceptorder();
            acceptorderUpdate.setId(acceptorder.getId());
            acceptorderUpdate.setBacktime(date);
            acceptorderUpdate.setAcceptstate(-1);
            if (acceptOrderDao.updateByPrimaryKeySelective(acceptorderUpdate) == 1) {
                //2、增加余额基本表的余额总数，归还押金
                Money money = moneyService.getMoney(userId);
                Money moneyInfoAdd = new Money();
                moneyInfoAdd.setId(money.getId());
                moneyInfoAdd.setAmount(money.getAmount() + amount);
                if (moneyDao.updateByPrimaryKeySelective(moneyInfoAdd) == 1) {
                    //3、添加收支历史
                    Moneyhistory moneyhistory = new Moneyhistory();
                    moneyhistory.setUserid(userId);
                    moneyhistory.setInfo(CommonsUtil.moneyOrderPermissionMoneyBack);
                    moneyhistory.setAmount(amount);
                    moneyhistory.setTime(date);
                    moneyhistory.setState(1);
                    if (moneyHistoryDao.insertSelective(moneyhistory) == 1) {
                        return "disagree_success";
                    } else {
                        throw new MyThrowException("add_failure");
                    }
                } else {
                    //抛出异常
                    throw new MyThrowException("update_failure");
                }
            } else {
                //抛出异常
                throw new MyThrowException("update_failure");
            }
        } catch (MyThrowException e) {
            System.out.println("e========================" + e.getMessage());
            throw e;
        }
    }

    /**
     * 归还物品
     * 1、更新抢单表状态及时间
     * 2、更新订单表库存
     * 3、订单者获取租用费用
     * @param acceptId
     * @return
     */
    @Transactional
    @Override
    public String updateReturnGoods(int acceptId) {
        String date = TimeUtil.dateToString(new Date());
        Acceptorder acceptorder = acceptOrderDao.selectByPrimaryKey(acceptId);
        Orderinfo orderinfo = orderDao.selectByPrimaryKey(acceptorder.getOrderid());
        try {
            //1、更新抢单表
            Acceptorder acceptorderUpdate = new Acceptorder();
            acceptorderUpdate.setId(acceptorder.getId());
            acceptorderUpdate.setFinishtime(date);
            acceptorderUpdate.setAcceptstate(4);
            if (acceptOrderDao.updateByPrimaryKeySelective(acceptorderUpdate) == 1) {
                //2、更新订单表库存
                Orderinfo orderinfoUpdate = new Orderinfo();
                orderinfoUpdate.setId(orderinfo.getId());
                orderinfoUpdate.setOutamount(orderinfo.getOutamount() - acceptorder.getNumber());
                if (orderDao.updateByPrimaryKeySelective(orderinfoUpdate) == 1) {
                    return "update_success";
                } else {
                    //抛出异常
                    throw new MyThrowException("update_failure");
                }
            } else {
                //抛出异常
                throw new MyThrowException("update_failure");
            }
        } catch (MyThrowException e) {
            System.out.println("e========================" + e.getMessage());
            throw e;
        }
    }

    /**
     * 付款
     * 1、获取订单表、抢单表
     * 2、更新抢单表状态、付款时间
     * 3、计算归还押金、扣除租金费用、超期费用
     * 4、更新抢单者余额表
     * 5、更新抢单者收支历史表
     * 6、更新订单者余额表
     * 7、更新订单者收支历史表
     * @param acceptId
     * @return
     */
    @Transactional
    @Override
    public String updateOrderPutMoney(int acceptId) {
        String date = TimeUtil.dateToString(new Date());
        //1、获取订单表、抢单表
        Acceptorder acceptorder = acceptOrderDao.selectByPrimaryKey(acceptId);
        Orderinfo orderinfo = orderDao.selectByPrimaryKey(acceptorder.getOrderid());
        try {
            //2、更新抢单表
            Acceptorder acceptorderUpdate = new Acceptorder();
            acceptorderUpdate.setId(acceptorder.getId());
            acceptorderUpdate.setBacktime(date);
            acceptorderUpdate.setAcceptstate(5);
            if (acceptOrderDao.updateByPrimaryKeySelective(acceptorderUpdate) == 1) {
                //3、计算归还押金、扣除租金费用、超期费用
                int money = orderinfo.getMoneyamount();//押金
                Date startTime = TimeUtil.stringToDate(acceptorder.getUpdatetime());
                Date nowTime = new Date();
                int daysNumber = TimeUtil.getDatePoor(nowTime, startTime);
                System.out.println("daysNumber======" + daysNumber);
                int needMoney = 0;//租金
                if (acceptorder.getMoneytype() == 0) {
                    //日租  租金=数量*日租金*天数
                    needMoney = acceptorder.getNumber() * acceptorder.getMoney() * daysNumber;
                    if (daysNumber > (acceptorder.getGettype() + 5)) {
                        //超期5天以上的需要扣除超期的余额，每天*1
                        //加上超期的
                        needMoney += daysNumber-acceptorder.getGettype();
                    }
                } else {
                    //月租 租金=数量*月租金*月数
                    needMoney = acceptorder.getNumber() * acceptorder.getMoney() * acceptorder.getGettype();
                    if (daysNumber > (acceptorder.getGettype() * 30 + 5)) {
                        //超期5天以上的需要扣除超期的余额，每天*1
                        //加上超期的
                        needMoney += daysNumber - acceptorder.getGettype() * 30;
                    }
                }

                //4、更新抢单者余额表

                //5、更新抢单者收支历史表

                //6、更新订单者余额表

                //7、更新订单者收支历史表

                return "update_success";
            } else {
                //抛出异常
                throw new MyThrowException("update_failure");
            }
        } catch (MyThrowException e) {
            System.out.println("e========================" + e.getMessage());
            throw e;
        }
    }

    @Override
    public String deleteOrderById(int id) {
        if (orderDao.deleteByPrimaryKey(id) == 1) {
            return "del_success";
        }
        return "del_failure";
    }

    @Override
    public Orderinfo getOrderById(int id) {
        return orderDao.selectByPrimaryKey(id);
    }

    /**
     * 两种状态的订单列表
     * @param state1
     * @param state2
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoList(int state1,int state2) {
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andOrderstateBetween(state1,state2);
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
        System.out.println(orderList.toString());
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }
    /**
     * 一种状态的订单列表
     * @param state
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListByState(int state) {
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andOrderstateEqualTo(state);
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
        System.out.println(orderList.toString());
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }

    /**
     * 通过城市和状态获取资源服务订单
     * @param state
     * @param city
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListByStateAndCity(int state, String city) {
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andOrderstateEqualTo(state);
        criteria.andCityLike("%"+city+"%");
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
        if (orderList == null) {
            return null;
        }
        System.out.println("orderList="+orderList.toString());
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }

    /**
     * 通过关键字和状态搜索资源服务订单
     * @param state
     * @param search
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListByStateAndSearch(int state, String search) {
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andOrderstateEqualTo(state);
        criteria.andFoodnameLike("%"+search+"%");
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
        if (orderList == null) {
            return null;
        }
        System.out.println("orderList="+orderList.toString());
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }

    /**
     * 通过orderList获取所有订单的详情列表
     * @param orderList
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListByOrderList(List<Orderinfo> orderList) {
        List<OrderUserDto> orderUserDtoList = new ArrayList<>();
        if (orderList.size() > 0) {
            for (Orderinfo order : orderList) {
                OrderUserDto orderUserDto = new OrderUserDto();
                User user = userDao.selectByPrimaryKey(order.getSenderid());
//                User accepter = userDao.selectByPrimaryKey(order.getAccepterid());
                Ordertype ordertype = orderTypeDao.selectByPrimaryKey(order.getTypeid());
                Bigtype bigtype = bigtypeDao.selectByPrimaryKey(ordertype.getBigtypeid());
                orderUserDto.setOrder(order);
                if (user != null) {
                    orderUserDto.setSenderName(user.getName());
                    orderUserDto.setSenderIcon(user.getHeadicon());
                }
//                if (accepter != null) {
//                    orderUserDto.setAccepterName(accepter.getName());
//                }
                if (ordertype != null) {
                    orderUserDto.setOrderTypeName(ordertype.getTypename());
                }
                if (bigtype != null) {
                    orderUserDto.setBigTypeName(bigtype.getTypename());
                }
                orderUserDtoList.add(orderUserDto);
            }
        }
        return orderUserDtoList;
    }

    /**
     * 通过order获取订单的详情
     * @param order
     * @return
     */
    @Override
    public OrderUserDto getOrderUserDtoByOrder(Orderinfo order) {
        OrderUserDto orderUserDto = new OrderUserDto();
        User user = userDao.selectByPrimaryKey(order.getSenderid());
//        User accepter = userDao.selectByPrimaryKey(order.getAccepterid());
        Ordertype ordertype = orderTypeDao.selectByPrimaryKey(order.getTypeid());
        Bigtype bigtype = bigtypeDao.selectByPrimaryKey(ordertype.getBigtypeid());
        orderUserDto.setOrder(order);
        if (user != null) {
            orderUserDto.setSenderName(user.getName());
            orderUserDto.setSenderIcon(user.getHeadicon());
        }
//        if (accepter != null) {
//            orderUserDto.setAccepterName(accepter.getName());
//        }
        if (ordertype != null) {
            orderUserDto.setOrderTypeName(ordertype.getTypename());
        }
        if (bigtype != null) {
            orderUserDto.setBigTypeName(bigtype.getTypename());
        }
        return orderUserDto;
    }

    /**
     * 通过orderId获取订单详情
     * @param orderId
     * @return
     */
    @Override
    public OrderUserDto getOrderUserDtoByOrderId(int orderId) {
        Orderinfo orderinfo = orderDao.selectByPrimaryKey(orderId);
        return this.getOrderUserDtoByOrder(orderinfo);
    }

    /**
     * 通过orderId获取抢单列表详情
     * @param orderinfo
     * @return
     */
    @Override
    public List<AcceptOrderUserDto> getAcceptOrderUserDtoListByOrderId(Orderinfo orderinfo) {
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andOrderidEqualTo(orderinfo.getId());
        List<Acceptorder> acceptorderList = acceptOrderDao.selectByExample(acceptorderExample);
        List<AcceptOrderUserDto> acceptOrderUserDtoList = new ArrayList<>();
        for (Acceptorder acceptOrder : acceptorderList) {
            AcceptOrderUserDto aOUD = new AcceptOrderUserDto();
            aOUD.setAcceptorder(acceptOrder);
            User acceptUser = userDao.selectByPrimaryKey(acceptOrder.getAccepterid());
            User sendUser = userDao.selectByPrimaryKey(orderinfo.getSenderid());
            if (acceptUser != null) {
                aOUD.setAcceptUserName(acceptUser.getName());
            }
            if (sendUser != null) {
                aOUD.setSendUserName(sendUser.getName());
            }
            aOUD.setOrderGoodsName(orderinfo.getFoodname());
            acceptOrderUserDtoList.add(aOUD);
        }
        return acceptOrderUserDtoList;
    }

    /**
     * 通过发布状态和发布者id获取资源订单情况
     * @param state
     * @param userId
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListByStateAndSendUserId(int state, int userId) {
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andOrderstateEqualTo(state);
        criteria.andSenderidEqualTo(userId);
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
        if (orderList == null) {
            return null;
        }
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }

    /**
     * 通过发布者id获取资源订单情况
     * @param userId
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListBySendUserId(int userId) {
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andSenderidEqualTo(userId);
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
        if (orderList == null) {
            return null;
        }
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }

    /**
     * 通过发布者id和关键字获取资源订单情况
     * @param userId
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListBySendUserIdAndSearch(int userId, String search) {
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andSenderidEqualTo(userId);
        criteria.andFoodnameLike("%"+search+"%");
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
        if (orderList == null) {
            return null;
        }
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }
}
