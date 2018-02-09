package com.helpserver.service.impl;

import com.helpserver.dao.GoldDao;
import com.helpserver.dao.PayaccountDao;
import com.helpserver.pojo.Gold;
import com.helpserver.pojo.Payaccount;
import com.helpserver.pojo.PayaccountExample;
import com.helpserver.service.GoldService;
import com.helpserver.service.PayAccountService;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
@Service
public class GoldServiceImpl implements GoldService {

    @Autowired
    GoldDao goldDao;

    /**
     * 注册时初始化用户金币数为10
     * @param userId
     * @return
     */
    @Override
    public boolean insertGold(int userId) {
        Gold gold = new Gold();
        gold.setUserid(userId);
        gold.setTime(TimeUtil.dateToString(new Date()));
        gold.setGoldamount(10);
        gold.setState(0);

        if (goldDao.insertSelective(gold)==1) {
            return true;
        }
        return false;
    }

    @Override
    public String updateGold(Gold gold) {
        return null;
    }

    @Override
    public Gold getGold() {
        return null;
    }
}
