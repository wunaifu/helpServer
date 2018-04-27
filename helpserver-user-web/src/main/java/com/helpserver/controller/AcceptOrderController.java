package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.*;
import com.helpserver.service.*;
import com.helpserver.util.UserSessionSetUtils;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by wunaifu on 2018-03-06.
 */
@Controller
@RequestMapping("/accept")
public class AcceptOrderController {

    @Autowired
    OrderTypeService orderTypeService;
    @Autowired
    OrderService orderService;
    @Autowired
    MoneyService moneyService;
    @Autowired
    UserService userService;
    @Autowired
    AcceptOrderService acceptOrderService;

    /**
     * 去往添加资源服务页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/doadd")
    public String addAcceptServer(HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Orderinfo orderinfo = orderService.getOrderById(orderId);
        int userId = nowUser.getUserid();
        if (userId == orderinfo.getSenderid()) {
            model.addAttribute("message", "用户不能抢自己发布的资源服务");
            return "page_400";
        }
        int type = Integer.parseInt(request.getParameter("type"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        int useTime = Integer.parseInt(request.getParameter("useTime"));
        Acceptorder acceptorder = new Acceptorder();
        acceptorder.setAccepterid(userId);
        acceptorder.setOrderid(orderId);
        if (type == 1) {
            //日租
            acceptorder.setMoneytype(0);
            acceptorder.setMoney(orderinfo.getDaymoney());
        }else {
            //月租
            acceptorder.setMoneytype(1);
            acceptorder.setMoney(orderinfo.getMonthmoney());
        }
        acceptorder.setNumber(amount);
        acceptorder.setGettype(useTime);//租用时间
        acceptorder.setAcceptstate(1);
        String date = TimeUtil.dateToString(new Date());
        acceptorder.setAccepttime(date);
        acceptorder.setDatestate(orderinfo.getMoneyamount());//暂时存放押金
        String result = acceptOrderService.insertAcceptOrder(acceptorder);
        if (result.equals("insert_success")) {
            model.addAttribute("message", "资源服务订单预抢成功，等待对方确认。");
            return "pageaccept_success";
        }
        model.addAttribute("message", "资源服务订单预抢失败，请稍后再试！");
        return "page_400";
    }



}
