package com.helpserver.service.impl;

import com.helpserver.dao.*;
import com.helpserver.pojo.*;
import com.helpserver.service.AcceptOrderService;
import com.helpserver.service.MoneyService;
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
public class AcceptOrderServiceImpl implements AcceptOrderService {

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
    @Autowired
    OrdercommentDao ordercommentDao;

    @Override
    public Acceptorder getAcceptorderById(int acceptId) {
        return acceptOrderDao.selectByPrimaryKey(acceptId);
    }

    @Override
    public String updateAcceptOrderStateUpdateTime(Acceptorder acceptorder) {
        Acceptorder acceptorderUpdate = new Acceptorder();
        acceptorderUpdate.setId(acceptorder.getId());
        acceptorderUpdate.setAcceptstate(3);
        acceptorderUpdate.setUpdatetime(TimeUtil.dateToString(new Date()));
        if (acceptOrderDao.updateByPrimaryKeySelective(acceptorderUpdate) == 1) {
            return "update_success";
        }
        return "update_failure";
    }

    /**
     * 添加资源服务
     * 1、添加抢单表
     * 2、扣除余额押金
     * 3、添加收支历史
     * @param acceptorder
     * @return
     */
    @Transactional
    @Override
    public String insertAcceptOrder(Acceptorder acceptorder) {
        int permissionMoney=acceptorder.getDatestate();//服务押金
        int userId = acceptorder.getAccepterid();
        acceptorder.setDatestate(null);
        try {
            //1、添加抢单表
            if (acceptOrderDao.insertSelective(acceptorder) == 1) {
                //2、减少余额基本表的余额总数
                Money money = moneyService.getMoney(userId);
                Money moneyInfoAdd = new Money();
                moneyInfoAdd.setId(money.getId());
                moneyInfoAdd.setAmount(money.getAmount() - permissionMoney);
                if (moneyDao.updateByPrimaryKeySelective(moneyInfoAdd) == 1) {
                    //3、添加收支历史
                    Moneyhistory moneyhistory = new Moneyhistory();
                    moneyhistory.setUserid(userId);
                    moneyhistory.setInfo(CommonsUtil.moneyOrderPermissionMoney);
                    moneyhistory.setAmount(permissionMoney);
                    moneyhistory.setTime(acceptorder.getAccepttime());
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
     * 通过订单id获取预抢单
     * @param orderId
     * @return
     */
    @Override
    public List<AcceptOrderUserDto> getAcceptOrderUserDtoListByOrderId(int orderId) {
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andOrderidEqualTo(orderId);
        acceptorderExample.setOrderByClause("acceptTime desc");
        Orderinfo orderinfo = orderDao.selectByPrimaryKey(orderId);
        List<Acceptorder> acceptorderList = acceptOrderDao.selectByExample(acceptorderExample);
        List<AcceptOrderUserDto> acceptOrderUserDtoList = new ArrayList<>();
        for (Acceptorder acceptOrder : acceptorderList) {
            AcceptOrderUserDto acceptOrderUserDto = new AcceptOrderUserDto();
            User accepter = userDao.selectByPrimaryKey(acceptOrder.getAccepterid());
            if (accepter != null) {
                acceptOrderUserDto.setAcceptUserName(accepter.getName());
                acceptOrderUserDto.setAcceptUserIcon(accepter.getHeadicon());
                acceptOrderUserDto.setAcceptUserCredit(accepter.getCredit());
            }
            acceptOrderUserDto.setIsOrNotComment(this.checkIsOrNotComment(acceptOrder.getId(),orderinfo.getSenderid()));
            acceptOrderUserDto.setAcceptorder(acceptOrder);
            acceptOrderUserDtoList.add(acceptOrderUserDto);
        }
        return acceptOrderUserDtoList;
    }

    /**
     * 通过userId获取已抢订单
     * @param userId
     * @return
     */
    @Override
    public List<OrderAcceptDto> getOrderAcceptDtoListByUserId(int userId) {
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andAccepteridEqualTo(userId);
        acceptorderExample.setOrderByClause("acceptTime desc");
        List<Acceptorder> acceptorderList = acceptOrderDao.selectByExample(acceptorderExample);
        List<OrderAcceptDto> orderAcceptDtoList = this.getOrderAcceptDtoListByAcceptOrderList(acceptorderList);
        return orderAcceptDtoList;
    }

    /**
     * 获取用户的进行中的抢单表
     * @param userId
     * @param state
     * @return
     */
    @Override
    public List<OrderAcceptDto> getOrderAcceptDtoIngListByUserIdAndState(int userId, int state) {
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andAccepteridEqualTo(userId);
        criteria.andAcceptstateNotEqualTo(state);//不是已完成 状态6，状态是已经评价完，已结束
        acceptorderExample.setOrderByClause("acceptTime desc");
        List<Acceptorder> acceptorderList = acceptOrderDao.selectByExample(acceptorderExample);
        List<OrderAcceptDto> orderAcceptDtoList = this.getOrderAcceptDtoListByAcceptOrderList(acceptorderList);
        return orderAcceptDtoList;
    }

    /**
     * 获取用户的已完成的抢单表
     * @param userId
     * @param state
     * @return
     */
    @Override
    public List<OrderAcceptDto> getOrderAcceptDtoFinishListByUserIdAndState(int userId, int state) {
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andAccepteridEqualTo(userId);
        criteria.andAcceptstateEqualTo(state);//已完成 状态6，状态是已经评价完，已结束
        acceptorderExample.setOrderByClause("acceptTime desc");
        List<Acceptorder> acceptorderList = acceptOrderDao.selectByExample(acceptorderExample);
        List<OrderAcceptDto> orderAcceptDtoList = this.getOrderAcceptDtoListByAcceptOrderList(acceptorderList);
        return orderAcceptDtoList;
    }

    /**
     * 通过orderId获取已抢订单
     * @param orderId
     * @return
     */
    @Override
    public List<OrderAcceptDto> getOrderAcceptDtoListByOrderId(int orderId) {
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andOrderidEqualTo(orderId);
        acceptorderExample.setOrderByClause("acceptTime desc");
        List<Acceptorder> acceptorderList = acceptOrderDao.selectByExample(acceptorderExample);
        List<OrderAcceptDto> orderAcceptDtoList = this.getOrderAcceptDtoListByAcceptOrderList(acceptorderList);
        return orderAcceptDtoList;
    }

    /**
     * 通过userId和关键字获取已抢订单
     * @param userId
     * @param search
     * @return
     */
    @Override
    public List<OrderAcceptDto> getOrderAcceptDtoListByUserIdAndSearch(int userId, String search) {
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andAccepteridEqualTo(userId);
        acceptorderExample.setOrderByClause("acceptTime desc");
        List<Acceptorder> acceptorderList = acceptOrderDao.selectByExample(acceptorderExample);
        List<OrderAcceptDto> orderAcceptDtoList = this.getOrderAcceptDtoListByAcceptOrderList(acceptorderList);
        return orderAcceptDtoList;
    }

    /**
     * 通过接单列表获取接单列表及其他有关信息
     * @param acceptOrderList
     * @return
     */
    @Override
    public List<OrderAcceptDto> getOrderAcceptDtoListByAcceptOrderList(List<Acceptorder> acceptOrderList) {
        List<OrderAcceptDto> orderAcceptDtoList = new ArrayList<>();
        for (Acceptorder acceptOrder : acceptOrderList) {
            OrderAcceptDto orderAcceptDto = new OrderAcceptDto();
            User accepter = userDao.selectByPrimaryKey(acceptOrder.getAccepterid());
            if (accepter != null) {
                orderAcceptDto.setAcceptUserName(accepter.getName());
                orderAcceptDto.setAcceptUserIcon(accepter.getHeadicon());
                orderAcceptDto.setAcceptUserCredit(accepter.getCredit());
            }
            Orderinfo orderinfo = orderDao.selectByPrimaryKey(acceptOrder.getOrderid());
            User sender = userDao.selectByPrimaryKey(orderinfo.getSenderid());
            if (sender != null) {
                orderAcceptDto.setSenderId(sender.getUserid());
                orderAcceptDto.setSendUserName(sender.getName());
                orderAcceptDto.setSendUserIcon(sender.getHeadicon());
                orderAcceptDto.setSendUserCredit(sender.getCredit());
            }
            if (orderinfo != null) {
                orderAcceptDto.setOrderId(orderinfo.getId());
                orderAcceptDto.setFoodname(orderinfo.getFoodname());
                orderAcceptDto.setOrderdetail(orderinfo.getOrderdetail());
                orderAcceptDto.setCity(orderinfo.getCity());
                orderAcceptDto.setAddress(orderinfo.getAddress());
                orderAcceptDto.setAmount(orderinfo.getAmount());
                orderAcceptDto.setOutamount(orderinfo.getOutamount());
                orderAcceptDto.setMoneyamount(orderinfo.getMoneyamount());
                orderAcceptDto.setRepealtime(orderinfo.getRepealtime());
                if (orderinfo.getOrderstate() == 1) {
                    orderAcceptDto.setOrderState("发布中");
                } else if (orderinfo.getOrderstate() == 2) {
                    orderAcceptDto.setOrderState("已下架");
                } else {
                    orderAcceptDto.setOrderState("已禁用");
                }
            }
            orderAcceptDto.setIsOrNotComment(this.checkIsOrNotComment(acceptOrder.getId(),accepter.getUserid()));
            orderAcceptDto.setAcceptorder(acceptOrder);
            orderAcceptDtoList.add(orderAcceptDto);
        }
        return orderAcceptDtoList;
    }

    /**
     * 查看是否已评价
     * @param acceptId
     * @param userId
     * @return
     */
    @Override
    public int checkIsOrNotComment(int acceptId, int userId) {
        OrdercommentExample ordercommentExample1 = new OrdercommentExample();
        OrdercommentExample.Criteria criteria1 = ordercommentExample1.createCriteria();
        criteria1.andMyidEqualTo(userId);
        criteria1.andAcceptidEqualTo(acceptId);
        List<Ordercomment> ordercommentList1 = ordercommentDao.selectByExample(ordercommentExample1);
        if (ordercommentList1.size() > 0) {
            return 1;
        }
        return 0;
    }

    @Override
    public int updateDateStateByAcceptId(Acceptorder acceptorder) {
        return acceptOrderDao.updateByPrimaryKeySelective(acceptorder);
    }

    @Override
    public String updateDateStateAcceptList() {
        Date date = new Date();
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andDatestateEqualTo(3);//获取租用进行中的订单
        acceptorderExample.setOrderByClause("acceptTime desc");
        List<Acceptorder> acceptorderList = acceptOrderDao.selectByExample(acceptorderExample);

        for (Acceptorder accept : acceptorderList) {
            int days = TimeUtil.getDatePoor(TimeUtil.stringToDate(accept.getSuretime()), date);
            Acceptorder acceptUpdate = new Acceptorder();
            acceptUpdate.setId(accept.getId());
            if (accept.getMoneytype() == 0) {
                if (days > accept.getGettype()) {
                    //日租方式，超期，修改dataState为0
                    if (accept.getDatestate() != 0) {
                        acceptUpdate.setDatestate(0);
                        this.updateDateStateByAcceptId(acceptUpdate);
                    }
                } else {
                    //未超期，修改dataState为1
                    if (accept.getDatestate() != 1) {
                        acceptUpdate.setDatestate(1);
                        this.updateDateStateByAcceptId(acceptUpdate);
                    }
                }
            } else {
                //月租方式，按30天算
                int months = days / 30;
                if (days % 30 != 0) {
                    months++;
                }
                if (months > accept.getGettype()) {
                    //月租方式，超期，修改dataState为0
                    if (accept.getDatestate() != 0) {
                        acceptUpdate.setDatestate(0);
                        this.updateDateStateByAcceptId(acceptUpdate);
                    }
                } else {
                    //未超期，修改dataState为1
                    if (accept.getDatestate() != 1) {
                        acceptUpdate.setDatestate(1);
                        this.updateDateStateByAcceptId(acceptUpdate);
                    }
                }
            }
        }
        return "finish";
    }

    /**
     * 获取已完成的抢单表，已付款,或已评价
     * @param state
     * @return
     */
    @Override
    public int getacceptOrderFinishListByState(int state) {
        AcceptorderExample acceptorderExample = new AcceptorderExample();
        AcceptorderExample.Criteria criteria = acceptorderExample.createCriteria();
        criteria.andAcceptstateEqualTo(state);//已付款5，已评价6
        acceptorderExample.setOrderByClause("acceptTime desc");
        return acceptOrderDao.countByExample(acceptorderExample);
    }
}
