package com.helpserver.service.impl;

import com.helpserver.dao.*;
import com.helpserver.pojo.*;
import com.helpserver.service.GoldService;
import com.helpserver.service.PayAccountService;
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
public class GoldServiceImpl implements GoldService {

    @Autowired
    GoldDao goldDao;
    @Autowired
    GoldhistoryDao goldhistoryDao;
    @Autowired
    GoldaddDao goldAddDao;
    @Autowired
    UserDao userDao;

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
     * 充值金币
     * 1、获取充值信息
     * 2、添加审核时间
     * 3、增加金币基本表的金币总数
     * 4、添加金币收支历史
     * @param goldAddId
     * @return
     */
    @Transactional
    @Override
    public String addPayGoldByGoldAddId(int goldAddId) {
        //1、获取充值信息
        Goldadd goldadd = goldAddDao.selectByPrimaryKey(goldAddId);
        int payAmount=goldadd.getAddamount()*10;
        try {
            //2、添加审核时间
            Goldadd goldaddADD = new Goldadd();
            goldaddADD.setId(goldAddId);
            goldaddADD.setGettime(TimeUtil.dateToString(new Date()));
            if (goldAddDao.updateByPrimaryKeySelective(goldaddADD) == 1) {
                //3、增加金币基本表的金币总数
                Gold gold = this.getGold(goldadd.getUserid());
                Gold goldInfoAdd = new Gold();
                goldInfoAdd.setId(gold.getId());
                goldInfoAdd.setPayamount(gold.getPayamount()+payAmount);
                goldInfoAdd.setGoldamount(gold.getGoldamount() + payAmount);
                if (goldDao.updateByPrimaryKeySelective(goldInfoAdd) == 1) {
                    //4、添加金币收支历史
                    Goldhistory goldhistory = new Goldhistory();
                    goldhistory.setUserid(goldadd.getUserid());
                    goldhistory.setInfo(CommonsUtil.goldInfoPayGold);
                    goldhistory.setAmount(payAmount);
                    goldhistory.setTime(goldaddADD.getGettime());
                    goldhistory.setState(1);
                    if (goldhistoryDao.insertSelective(goldhistory) == 1) {
                        return "pay_success";
                    } else {
                        throw new MyThrowException("addgoldinfo_failure");
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
     * 每日0点充值签到状态为0
     * 更新签到状态
     *
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
                System.out.println("重置 " + (i + 1) + " gold=" + gold.toString());
            }
        }
        return true;
    }

    /**
     * 每日签到
     * 更新金币数量+1
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
                gold.setGoldamount(gold.getGoldamount() + 1);
                if (goldDao.updateByPrimaryKey(gold) == 1) {
                    //添加goldhistory
                    Goldhistory goldhistory = new Goldhistory();
                    goldhistory.setUserid(userId);
                    goldhistory.setInfo(CommonsUtil.goldInfoSignIN);
                    goldhistory.setAmount(1);
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
     * 获取我的金币充值历史情况
     *
     * @param userId
     * @return
     */
    @Override
    public List<Goldadd> getGoldaddListByUserId(int userId) {
        GoldaddExample goldaddExample = new GoldaddExample();
        GoldaddExample.Criteria criteria = goldaddExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        criteria.andGettimeIsNotNull();
        List<Goldadd> goldaddList = goldAddDao.selectByExample(goldaddExample);
        return goldaddList;
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

    /**
     * 获取用户金币列表信息
     * @return
     */
    @Override
    public List<GoldUserDto> getGoldUserDtoList() {
        GoldExample goldExample = new GoldExample();
        GoldExample.Criteria criteria = goldExample.createCriteria();
        criteria.andIdIsNotNull();
        goldExample.setOrderByClause("time desc");
        List<Gold> goldList = goldDao.selectByExample(goldExample);
        List<GoldUserDto> goldUserDtoList = new ArrayList<>();
        if (goldList != null && goldList.size() > 0) {
            for (int i = 0; i < goldList.size(); i++) {
                GoldUserDto goldUserDto = new GoldUserDto();
                User user = userDao.selectByPrimaryKey(goldList.get(i).getUserid());
                goldUserDto.setGold(goldList.get(i));
                goldUserDto.setUser(user);
                goldUserDtoList.add(goldUserDto);
            }
        }
        return goldUserDtoList;
    }

    /**
     * 获取金币充值历史，已审核或者未审核
     *
     * @param getTimeState
     * @return
     */
    @Override
    public List<GoldAddDto> getGoldAddDtoListByGetTime(int getTimeState) {
        GoldaddExample goldaddExample = new GoldaddExample();
        GoldaddExample.Criteria criteria = goldaddExample.createCriteria();
        if (getTimeState == 0) {
            criteria.andGettimeIsNull();
            goldaddExample.setOrderByClause("addTime desc");
        } else {
            criteria.andGettimeIsNotNull();
            goldaddExample.setOrderByClause("getTime desc");
        }
        List<Goldadd> goldaddList = goldAddDao.selectByExample(goldaddExample);
        System.out.println("goldaddList============" + goldaddList.toString());
        List<GoldAddDto> goldAddDtoList = new ArrayList<>();
        if (goldaddList != null && goldaddList.size() > 0) {
            for (int i = 0; i < goldaddList.size(); i++) {
                GoldAddDto goldAddDto = new GoldAddDto();
                User user = userDao.selectByPrimaryKey(goldaddList.get(i).getUserid());
                goldAddDto.setGoldadd(goldaddList.get(i));
                goldAddDto.setUser(user);
                goldAddDtoList.add(goldAddDto);
            }
        }
        return goldAddDtoList;
    }

    /**
     * 通过用户id查看充值详情
     *
     * @param addId
     * @return
     */
    @Override
    public GoldAddDto getGoldAddDtoByGoldAddId(int addId) {
        Goldadd goldadd = goldAddDao.selectByPrimaryKey(addId);
        GoldAddDto goldAddDto = new GoldAddDto();
        if (goldadd != null) {
            User user = userDao.selectByPrimaryKey(goldadd.getUserid());
            goldAddDto.setGoldadd(goldadd);
            goldAddDto.setUser(user);
        }
        return goldAddDto;
    }

    /**
     * 充值金币
     *
     * @param goldadd
     * @return
     */
    @Override
    public String addGoldadd(Goldadd goldadd) {
        if (goldAddDao.insertSelective(goldadd) == 1) {
            return "paygold_success";
        }
        return "paygold_error";
    }
}
