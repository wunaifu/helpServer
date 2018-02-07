package com.helpserver.service;

import com.helpserver.pojo.Feedback;
import com.helpserver.pojo.FeedbackDto;
import com.helpserver.pojo.Payaccount;

import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
public interface PayAccountService {

    String insertPayAccount(Payaccount payAccount);

    String updatePayAccount(Payaccount payAccount);

    Payaccount getPayAccoun();

}
