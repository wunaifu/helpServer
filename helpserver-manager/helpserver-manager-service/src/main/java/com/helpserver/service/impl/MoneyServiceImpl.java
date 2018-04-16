package com.helpserver.service.impl;

import com.helpserver.dao.MoneyDao;
import com.helpserver.dao.MoneyaddDao;
import com.helpserver.dao.MoneyhistoryDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.*;
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
 * Created by wunaifu on 2018/1/11.
 */
@Service
public class MoneyServiceImpl implements MoneyService {

    @Autowired
    MoneyDao moneyDao;
    @Autowired
    MoneyhistoryDao moneyHistoryDao;
    @Autowired
    MoneyaddDao moneyAddDao;
    @Autowired
    UserDao userDao;

    @Override
    public boolean insertMoney(int userId) {
        return false;
    }

    @Override
    public String updateMoneySignIn(int userId) {
        return null;
    }

    @Override
    public String addPayMoneyByMoneyAddId(int moneyAddId) {
        return null;
    }

    /**
     * 提交充值账户余额请求
     * @param moneyadd
     * @return
     */
    @Override
    public String addMoneyadd(Moneyadd moneyadd) {
        if (moneyAddDao.insertSelective(moneyadd) == 1) {
            return "paymoney_success";
        }
        return "paymoney_error";
    }

    /**
     * 获取用户的余额基本信息
     * @param userId
     * @return
     */
    @Override
    public Money getMoney(int userId) {
        MoneyExample moneyExample = new MoneyExample();
        MoneyExample.Criteria criteria = moneyExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Money> moneyList = moneyDao.selectByExample(moneyExample);
        if (moneyList != null && moneyList.size() > 0) {
            return moneyList.get(0);
        }
        return null;
    }

    /**
     * 获取我的余额充值申请历史情况
     *  未充值成功
     * @param userId
     * @return
     */
    @Override
    public List<Moneyadd> getMoneyAddingListByUserId(int userId) {
        MoneyaddExample moneyaddExample = new MoneyaddExample();
        MoneyaddExample.Criteria criteria = moneyaddExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        criteria.andGettimeIsNull();
        List<Moneyadd> moneyaddList = moneyAddDao.selectByExample(moneyaddExample);
        return moneyaddList;
    }

    /**
     * 获取我的余额已充值历史情况
     * 已充值成功
     * @param userId
     * @return
     */
    @Override
    public List<Moneyadd> getMoneyAddedListByUserId(int userId) {
        MoneyaddExample moneyaddExample = new MoneyaddExample();
        MoneyaddExample.Criteria criteria = moneyaddExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        criteria.andGettimeIsNotNull();
        List<Moneyadd> moneyaddedList = moneyAddDao.selectByExample(moneyaddExample);
        return moneyaddedList;
    }

    /**
     * 获取余额历史情况
     *
     * @param userId
     * @return
     */
    @Override
    public List<Moneyhistory> getMoneyHistoryListByUserId(int userId) {
        MoneyhistoryExample moneyhistoryExample = new MoneyhistoryExample();
        MoneyhistoryExample.Criteria criteria = moneyhistoryExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Moneyhistory> moneyhistoryList = moneyHistoryDao.selectByExample(moneyhistoryExample);
        return moneyhistoryList;
    }
}
