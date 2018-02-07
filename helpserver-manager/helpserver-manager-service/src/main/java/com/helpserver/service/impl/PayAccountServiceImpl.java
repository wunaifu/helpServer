package com.helpserver.service.impl;

import com.helpserver.dao.FeedbackDao;
import com.helpserver.dao.PayaccountDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.*;
import com.helpserver.service.FeedbackService;
import com.helpserver.service.PayAccountService;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
@Service
public class PayAccountServiceImpl implements PayAccountService {

    @Autowired
    PayaccountDao payaccountDao;

    @Override
    public String insertPayAccount(Payaccount payAccount) {
        if (payaccountDao.insertSelective(payAccount) == 1) {
            return "update_success";
        }
        return "update_error";
    }

    @Override
    public String updatePayAccount(Payaccount payAccount) {
        if (payaccountDao.updateByPrimaryKey(payAccount) == 1) {
            return "update_success";
        }
        return "update_error";
    }

    @Override
    public Payaccount getPayAccoun() {
        PayaccountExample payaccountExample = new PayaccountExample();
        PayaccountExample.Criteria criteria = payaccountExample.createCriteria();
        criteria.andIdIsNotNull();
        List<Payaccount> payaccounts = payaccountDao.selectByExample(payaccountExample);
        if (payaccounts != null && payaccounts.size() > 0) {
            return payaccounts.get(0);
        }
        Payaccount payaccount = new Payaccount();
        payaccount.setId(0);
        payaccount.setTime("没有收款码");
        return payaccount;
    }



}
