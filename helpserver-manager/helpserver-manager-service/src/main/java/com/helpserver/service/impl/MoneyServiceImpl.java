package com.helpserver.service.impl;

import com.helpserver.dao.*;
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
    MoneygetDao moneyGetDao;
    @Autowired
    UserDao userDao;
    @Autowired
    BackdataDao backdataDao;

    @Override
    public boolean insertMoney(int userId) {
        return false;
    }

    @Override
    public int insertMoneyHistory(Moneyhistory moneyhistory) {
        return moneyHistoryDao.insertSelective(moneyhistory);
    }

    @Override
    public int updateMoneyByPrimaryKey(Money money) {
        return moneyDao.updateByPrimaryKey(money);
    }

    /**
     * 用户申请提现余额到支付宝
     * 1、添加提现申请
     * 2、扣除余额基本表余额
     * @param moneyget
     * @return
     */
    @Transactional
    @Override
    public String addMoneyGet(Moneyget moneyget) {
        try {
            //1、添加提现申请
            if (moneyGetDao.insertSelective(moneyget) == 1) {
                //2、减少余额基本表的余额总数
                Money money = this.getMoney(moneyget.getUserid());
                Money moneyInfoAdd = new Money();
                moneyInfoAdd.setId(money.getId());
                moneyInfoAdd.setGetamount(money.getGetamount() + moneyget.getAmount());
                moneyInfoAdd.setAmount(money.getAmount() - moneyget.getAmount());
                if (moneyDao.updateByPrimaryKeySelective(moneyInfoAdd) == 1) {
                    return "pay_success";
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
     * 通过提现余额
     * 1、获取提现信息，添加审核时间，更新提现表
     * 2、更新余额收支历史
     * @param moneyGetId
     * @return
     */
    @Transactional
    @Override
    public String addMoneyGetByMoneyGetId(int moneyGetId) {
        String date = TimeUtil.dateToString(new Date());
        //1、获取提现信息，添加审核时间，更新提现表
        Moneyget moneyget = moneyGetDao.selectByPrimaryKey(moneyGetId);
        try {
            //更新提现表
            Moneyget moneygetUpdate = new Moneyget();
            moneygetUpdate.setId(moneyGetId);
            moneygetUpdate.setGettime(date);
            if (moneyGetDao.updateByPrimaryKeySelective(moneygetUpdate) == 1) {
                //2、添加余额收支历史
                Moneyhistory moneyhistory = new Moneyhistory();
                moneyhistory.setUserid(moneyget.getUserid());
                moneyhistory.setInfo(CommonsUtil.moneyToMoney);
                moneyhistory.setAmount(moneyget.getAmount());
                moneyhistory.setTime(date);
                moneyhistory.setState(0);
                if (moneyHistoryDao.insertSelective(moneyhistory) == 1) {
                    return "pay_success";
                } else {
                    throw new MyThrowException("addmoneyinfo_failure");
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
     * 获取我的余额充值所有历史情况
     *  未审核和已审核
     * @param userId
     * @return
     */
    @Override
    public List<Moneyadd> getMoneyAddListByUserId(int userId) {
        MoneyaddExample moneyaddExample = new MoneyaddExample();
        MoneyaddExample.Criteria criteria = moneyaddExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Moneyadd> moneyaddList = moneyAddDao.selectByExample(moneyaddExample);
        return moneyaddList;
    }

    /**
     * 获取我的余额提现申请历史情况
     *  未充值成功
     * @param userId
     * @return
     */
    @Override
    public List<Moneyget> getMoneygetingListByUserId(int userId) {
        MoneygetExample moneygetExample = new MoneygetExample();
        MoneygetExample.Criteria criteria = moneygetExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        criteria.andGettimeIsNull();
        List<Moneyget> moneygetList = moneyGetDao.selectByExample(moneygetExample);
        return moneygetList;
    }

    /**
     * 获取我的余额提现所有历史情况
     *  未审核和已审核的
     * @param userId
     * @return
     */
    @Override
    public List<Moneyget> getMoneygetListByUserId(int userId) {
        MoneygetExample moneygetExample = new MoneygetExample();
        MoneygetExample.Criteria criteria = moneygetExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Moneyget> moneygetList = moneyGetDao.selectByExample(moneygetExample);
        return moneygetList;
    }

    /**
     * 获取我的余额已提现历史情况
     * 已提现成功
     * @param userId
     * @return
     */
    @Override
    public List<Moneyget> getMoneygetedListByUserId(int userId) {
        MoneygetExample moneygetExample = new MoneygetExample();
        MoneygetExample.Criteria criteria = moneygetExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        criteria.andGettimeIsNotNull();
        List<Moneyget> moneygetedList = moneyGetDao.selectByExample(moneygetExample);
        return moneygetedList;
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
     * 获取余额提现历史，已审核或者未审核
     *
     * @param getTimeState
     * @return
     */
    @Override
    public List<MoneyGetDto> getMoneyGetDtoListByGetTime(int getTimeState) {
        MoneygetExample moneygetExample = new MoneygetExample();
        MoneygetExample.Criteria criteria = moneygetExample.createCriteria();
        if (getTimeState == 0) {
            criteria.andGettimeIsNull();
        } else {
            criteria.andGettimeIsNotNull();
        }
        List<Moneyget> moneygetList = moneyGetDao.selectByExample(moneygetExample);
        System.out.println("MoneygetList============" + moneygetList.toString());
        List<MoneyGetDto> moneygetDtoList = new ArrayList<>();
        int moneyListSize = moneygetList.size();
        if (moneygetList != null && moneyListSize > 0) {
            for (int i = 0; i < moneyListSize; i++) {
                MoneyGetDto moneygetDto = new MoneyGetDto();
                User user = userDao.selectByPrimaryKey(moneygetList.get(i).getUserid());
                moneygetDto.setMoneyget(moneygetList.get(i));
                moneygetDto.setUser(user);
                moneygetDtoList.add(moneygetDto);
            }
        }
        return moneygetDtoList;
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

    /**
     * 管理员统计平台为用户提供使用时所获得的服务费用
     * @return
     */
    @Override
    public int getManagerGetMoney() {
        MoneyhistoryExample moneyhistoryExample = new MoneyhistoryExample();
        MoneyhistoryExample.Criteria criteria = moneyhistoryExample.createCriteria();
        criteria.andInfoEqualTo(CommonsUtil.moneySystemGetMoney);
        List<Moneyhistory> moneyhistoryList = moneyHistoryDao.selectByExample(moneyhistoryExample);
        int allmoney = 0;
        for (Moneyhistory m : moneyhistoryList) {
            allmoney += m.getAmount();
            long longstr1 = Long.valueOf(m.getTime().replaceAll("[-\\s:]",""));
            System.out.println(longstr1);
        }
        return allmoney;
    }

    /**
     * 获取后台统计数据
     * @return
     */
    @Override
    public List<Backdata> getBackDataList() {
        Date date = new Date();
        int year = 2018;
        BackdataExample backdataExample = new BackdataExample();
        BackdataExample.Criteria criteria = backdataExample.createCriteria();
        criteria.andYearEqualTo(year);
        backdataExample.setOrderByClause("year desc");
        backdataExample.setOrderByClause("month desc");
        List<Backdata> backdataList = backdataDao.selectByExample(backdataExample);
        System.out.println("year="+date.getYear()+" backDataList="+backdataList);
        return backdataList;
    }
}
