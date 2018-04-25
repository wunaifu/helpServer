package com.helpserver.service.impl;

import com.helpserver.dao.*;
import com.helpserver.pojo.*;
import com.helpserver.service.MoneyService;
import com.helpserver.service.OrderService;
import com.helpserver.utils.CommonsUtil;
import com.helpserver.utils.MyThrowException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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

}
