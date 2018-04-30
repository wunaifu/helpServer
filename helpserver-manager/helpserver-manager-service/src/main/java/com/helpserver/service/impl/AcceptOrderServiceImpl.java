package com.helpserver.service.impl;

import com.helpserver.dao.*;
import com.helpserver.pojo.*;
import com.helpserver.service.AcceptOrderService;
import com.helpserver.service.MoneyService;
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
            }
            orderAcceptDto.setAcceptorder(acceptOrder);
            orderAcceptDtoList.add(orderAcceptDto);
        }
        return orderAcceptDtoList;
    }
}
