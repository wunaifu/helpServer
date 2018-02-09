package com.helpserver.service.impl;

import com.helpserver.dao.GoldDao;
import com.helpserver.dao.GoldaddDao;
import com.helpserver.dao.GoldhistoryDao;
import com.helpserver.dao.PayaccountDao;
import com.helpserver.pojo.*;
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
    @Autowired
    GoldhistoryDao goldhistoryDao;

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

    /**
     * 获取用户当前金币情况
     * @param userId
     * @return
     */
    @Override
    public Gold getGold(int userId) {
        GoldExample goldExample = new GoldExample();
        GoldExample.Criteria criteria = goldExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Gold> goldList = goldDao.selectByExample(goldExample);
        if (goldList != null && goldList.size()>0) {
            return goldList.get(0);
        }
        return null;
    }
}
