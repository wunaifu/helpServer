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

    @Override
    public String addMoneyadd(Moneyadd moneyadd) {
        return null;
    }

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

    @Override
    public List<Moneyadd> getMoneyaddListByUserId(int userId) {
        return null;
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
