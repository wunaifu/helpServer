package com.helpserver.service.impl;

import com.helpserver.service.BackServerService;
import com.helpserver.service.GoldService;
import com.helpserver.service.UserService;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by wunaifu on 2018-02-07.
 */
@Component
public class BackServerServiceImpl implements BackServerService{

    @Autowired
    UserService userService;
    @Autowired
    GoldService goldService;

    /**
     * 每天0点10秒时执行该方法，进行一些数据处理
     *
     * 1、重置所有已签到的状态为未签到，即状态置为0
     *
     */
    @Scheduled(cron="10 0 0 * * ?")
    public void backServerOne() {
        System.out.println("0:00:10已到，系统要开始装逼了。。。。。。");
        System.out.println("当前时间："+ TimeUtil.dateToString(new Date())+"开始重置签到状态！");
        //重置所有已签到的状态为未签到
        goldService.updateAllUserGoldState();
        System.out.println("当前时间："+ TimeUtil.dateToString(new Date())+"重置签到状态成功！");
    }
}
