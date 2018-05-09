package com.helpserver.service.impl;

import com.helpserver.pojo.Orderinfo;
import com.helpserver.service.*;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018-02-07.
 */
@Component
public class BackServerServiceImpl implements BackServerService{

    @Autowired
    UserService userService;
    @Autowired
    GoldService goldService;
    @Autowired
    OrderService orderService;
    @Autowired
    AcceptOrderService acceptOrderService;
    @Autowired
    MoneyService moneyService;

    /**
     * 每天0点10秒时执行该方法，进行一些数据处理
     *
     * 1、重置所有已签到的状态为未签到，即状态置为0
     *
     */
    @Scheduled(cron="10 0 0 * * ?")
    public void backServerOne() {
        System.out.println("0:00:10已到，系统要开始装逼了。。。。。。");
        //系统操作1、-------------------------------------------------
        //重置所有已签到的状态为未签到
        Date date = new Date();
        System.out.println("当前时间："+ TimeUtil.dateToString(date)+"开始重置签到状态！");
        goldService.updateAllUserGoldState();
        Date date1 = new Date();
        System.out.println("当前时间："+ TimeUtil.dateToString(date1)+"重置签到状态成功！");

        //检查进行中的抢单是否已经超期
        //开始检查
        System.out.println("当前时间："+ TimeUtil.dateToString(new Date())+"开始是否检查超期！");
        acceptOrderService.updateDateStateAcceptList();
        System.out.println("当前时间："+ TimeUtil.dateToString(new Date())+"检查超期并处理完成！");
    }

    /**
     * 1月1号0点时执行该方法，进行一些数据处理
     *
     * 添加默认的12个月的平台数据总结
     *
     */
    @Scheduled(cron="10 0 0 1 1 ?")
    public void backServerTwo() {
        //系统操作1、-------------------------------------------------
        //重置所有已签到的状态为未签到
        Date date = new Date();
        System.out.println("当前时间："+ TimeUtil.dateToString(date)+"开始添加今年的初始总结！");
        //当年年份
        int year = Integer.parseInt(TimeUtil.getYear(date));
        moneyService.addYearBackData(year);
        System.out.println("当前时间："+ TimeUtil.dateToString(date)+"添加今年的总结初始成功！");

    }

    /**
     * 每月1号4点时执行该方法，进行一些数据处理
     *
     * 总结上个月的数据
     *
     */
    @Scheduled(cron="0 0 4 1 * ?")
    public void backServerThree() {
        //系统操作1、-------------------------------------------------
        //重置所有已签到的状态为未签到
        Date date = new Date();
        System.out.println("当前时间："+ TimeUtil.dateToString(date)+"开始更新上个月总结！");
        moneyService.updateMonthBackData(date);
        System.out.println("当前时间："+ TimeUtil.dateToString(date)+"更新上个月总结成功！");

    }
}
