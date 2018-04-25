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


}
