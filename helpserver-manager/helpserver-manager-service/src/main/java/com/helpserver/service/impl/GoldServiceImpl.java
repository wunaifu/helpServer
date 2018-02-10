package com.helpserver.service.impl;

import com.helpserver.dao.GoldDao;
import com.helpserver.dao.GoldaddDao;
import com.helpserver.dao.GoldhistoryDao;
import com.helpserver.dao.PayaccountDao;
import com.helpserver.pojo.*;
import com.helpserver.service.GoldService;
import com.helpserver.service.PayAccountService;
import com.helpserver.utils.CommonsUtil;
import com.helpserver.utils.MyThrowException;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
     *
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

        if (goldDao.insertSelective(gold) == 1) {
            return true;
        }
        return false;
    }

    /**
     * 每日0点充值签到状态为0
     * 更新签到状态
     * @return
     */
    @Override
    public boolean updateAllUserGoldState() {
        GoldExample goldExample = new GoldExample();
        GoldExample.Criteria criteria = goldExample.createCriteria();
        criteria.andStateEqualTo(1);
        //获取到所有已签到的goldList
        List<Gold> goldList = goldDao.selectByExample(goldExample);
        if (goldList != null && goldList.size() > 0) {
            for (int i = 0; i < goldList.size(); i++) {
                //更新每个已签到的goldList的state，置为0
                Gold gold = new Gold();
                gold.setId(goldList.get(i).getId());
                gold.setState(0);
                goldDao.updateByPrimaryKeySelective(gold);
            }
        }
        return true;
    }

    /**
     * 每日签到
     * 更新金币数量+5
     *
     * @param userId
     * @return
     */
    @Transactional
    @Override
    public String updateGoldSignIn(int userId) {
        Gold gold = this.getGold(userId);
        if (gold.getState() == 0) {
            //今日还未签到，开始签到
            //更新gold.amount+5
            //更新gold.state=1
            try {
                gold.setState(1);
                gold.setGoldamount(gold.getGoldamount() + 5);
                if (goldDao.updateByPrimaryKey(gold) == 1) {
                    //添加goldhistory
                    Goldhistory goldhistory = new Goldhistory();
                    goldhistory.setUserid(userId);
                    goldhistory.setInfo(CommonsUtil.goldInfoSignIN);
                    goldhistory.setAmount(5);
                    goldhistory.setTime(TimeUtil.dateToString(new Date()));
                    goldhistory.setState(1);
                    if (goldhistoryDao.insertSelective(goldhistory) == 1) {
                        return "signin_success";
                    } else {
                        throw new MyThrowException("signin_failure");
                    }
                } else {
                    //抛出异常
                    throw new MyThrowException("signin_failure");
                }
            } catch (MyThrowException e) {
                System.out.println("e========================" + e.getMessage());
                throw e;
            }
        } else {
            //今日已签到，返回
            return "signin_haved";
        }
    }

    /**
     * 通过用户id获取用户当前金币基本情况
     *
     * @param userId
     * @return
     */
    @Override
    public Gold getGold(int userId) {
        GoldExample goldExample = new GoldExample();
        GoldExample.Criteria criteria = goldExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Gold> goldList = goldDao.selectByExample(goldExample);
        if (goldList != null && goldList.size() > 0) {
            return goldList.get(0);
        }
        return null;
    }

    /**
     * 获取金币历史情况
     *
     * @param userId
     * @return
     */
    @Override
    public List<Goldhistory> getGoldHistoryListByUserId(int userId) {
        GoldhistoryExample goldhistoryExample = new GoldhistoryExample();
        GoldhistoryExample.Criteria criteria = goldhistoryExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Goldhistory> goldhistoryList = goldhistoryDao.selectByExample(goldhistoryExample);
        return goldhistoryList;
    }
}
