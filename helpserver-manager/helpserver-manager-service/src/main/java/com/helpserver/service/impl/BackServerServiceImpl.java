package com.helpserver.service.impl;

import com.helpserver.service.BackServerService;
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

    @Scheduled(cron="0/30 * * * * ?")
    public void backServerOne() {
        System.out.println("当前时间："+ TimeUtil.dateToString(new Date()));
    }
}
