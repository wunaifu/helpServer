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

    /**
     * 充值余额
     * 1、获取充值信息
     * 2、添加审核时间
     * 3、增加余额基本表的金币总数
     * 4、添加余额收支历史
     * @param moneyAddId
     * @return
     */
    @Transactional
    @Override
    public String addPayMoneyByMoneyAddId(int moneyAddId) {
        //1、获取充值信息
        Moneyadd moneyadd = moneyAddDao.selectByPrimaryKey(moneyAddId);
        int payAmount=moneyadd.getAddamount();
        try {
            //2、添加审核时间
            Moneyadd moneyaddADD = new Moneyadd();
            moneyaddADD.setId(moneyAddId);
            moneyaddADD.setGettime(TimeUtil.dateToString(new Date()));
            if (moneyAddDao.updateByPrimaryKeySelective(moneyaddADD) == 1) {
                //3、增加余额基本表的余额总数
                Money money = this.getMoney(moneyadd.getUserid());
                Money moneyInfoAdd = new Money();
                moneyInfoAdd.setId(money.getId());
                moneyInfoAdd.setPayamount(money.getPayamount()+payAmount);
                moneyInfoAdd.setAmount(money.getAmount() + payAmount);
                if (moneyDao.updateByPrimaryKeySelective(moneyInfoAdd) == 1) {
                    //4、添加余额收支历史
                    Moneyhistory moneyhistory = new Moneyhistory();
                    moneyhistory.setUserid(moneyadd.getUserid());
                    moneyhistory.setInfo(CommonsUtil.moneyInfoPayMoney);
                    moneyhistory.setAmount(payAmount);
                    moneyhistory.setTime(moneyaddADD.getGettime());
                    moneyhistory.setState(1);
                    if (moneyHistoryDao.insertSelective(moneyhistory) == 1) {
                        return "pay_success";
                    } else {
                        throw new MyThrowException("addmoneyinfo_failure");
                    }
                } else {
                    //抛出异常
                    throw new MyThrowException("updategettime_failure");
                }
            } else {
                //抛出异常
                throw new MyThrowException("updategettime_failure");
            }
        } catch (MyThrowException e) {
            System.out.println("e========================" + e.getMessage());
            throw e;
        }
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

    /**
     * 获取用户基本余额列表
     * @return
     */
    @Override
    public List<MoneyUserDto> getMoneyUserDtoList() {
        MoneyExample moneyExample = new MoneyExample();
        MoneyExample.Criteria criteria = moneyExample.createCriteria();
        criteria.andIdIsNotNull();
        moneyExample.setOrderByClause("time desc");
        List<Money> moneyList = moneyDao.selectByExample(moneyExample);
        List<MoneyUserDto> moneyUserDtoList = new ArrayList<>();
        int moneyListSize = moneyList.size();
        if (moneyList != null && moneyListSize > 0) {
            for (int i = 0; i < moneyListSize; i++) {
                MoneyUserDto moneyUserDto = new MoneyUserDto();
                User user = userDao.selectByPrimaryKey(moneyList.get(i).getUserid());
                moneyUserDto.setMoney(moneyList.get(i));
                moneyUserDto.setUser(user);
                moneyUserDtoList.add(moneyUserDto);
            }
        }
        return moneyUserDtoList;
    }

    /**
     * 获取余额充值历史，已审核或者未审核
     *
     * @param getTimeState
     * @return
     */
    @Override
    public List<MoneyAddDto> getMoneyAddDtoListByGetTime(int getTimeState) {
        MoneyaddExample moneyaddExample = new MoneyaddExample();
        MoneyaddExample.Criteria criteria = moneyaddExample.createCriteria();
        if (getTimeState == 0) {
            criteria.andGettimeIsNull();
            moneyaddExample.setOrderByClause("addTime desc");
        } else {
            criteria.andGettimeIsNotNull();
            moneyaddExample.setOrderByClause("getTime desc");
        }
        List<Moneyadd> moneyaddList = moneyAddDao.selectByExample(moneyaddExample);
        System.out.println("MoneyaddList============" + moneyaddList.toString());
        List<MoneyAddDto> moneyAddDtoList = new ArrayList<>();
        int moneyListSize = moneyaddList.size();
        if (moneyaddList != null && moneyListSize > 0) {
            for (int i = 0; i < moneyListSize; i++) {
                MoneyAddDto moneyAddDto = new MoneyAddDto();
                User user = userDao.selectByPrimaryKey(moneyaddList.get(i).getUserid());
                moneyAddDto.setMoneyadd(moneyaddList.get(i));
                moneyAddDto.setUser(user);
                moneyAddDtoList.add(moneyAddDto);
            }
        }
        return moneyAddDtoList;
    }

    /**
     * 通过用户id查看余额充值详情
     *
     * @param addId
     * @return
     */
    @Override
    public MoneyAddDto getMoneyAddDtoByMoneyAddId(int addId) {
        Moneyadd moneyadd = moneyAddDao.selectByPrimaryKey(addId);
        MoneyAddDto moneyAddDto = new MoneyAddDto();
        if (moneyadd != null) {
            User user = userDao.selectByPrimaryKey(moneyadd.getUserid());
            moneyAddDto.setMoneyadd(moneyadd);
            moneyAddDto.setUser(user);
        }
        return moneyAddDto;
    }

}
