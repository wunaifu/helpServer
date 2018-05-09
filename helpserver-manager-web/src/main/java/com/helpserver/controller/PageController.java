package com.helpserver.controller;

import com.alibaba.fastjson.JSON;
import com.helpserver.pojo.Backdata;
import com.helpserver.pojo.User;
import com.helpserver.service.MoneyService;
import com.helpserver.service.OrderService;
import com.helpserver.service.UserService;
import com.helpserver.util.ManagerSessionSetUtils;
import com.helpserver.util.MyData;
import com.helpserver.utils.MyThrowException;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/13.
 */
@Controller
public class PageController {

    @Autowired
    UserService userService;
    @Autowired
    OrderService orderService;
    @Autowired
    MoneyService moneyService;

//    @RequestMapping(value = "/{page}")
//    public String getUserByUserId(@PathVariable String page,HttpServletRequest request) throws Exception {
//        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
//            return "page_403";
//        }
//        return page;
//    }

    @RequestMapping("/")
    public String showIndex1() {
        return "login";
    }

    @RequestMapping("/login")
    public String login1() {
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("phone");
        return "login";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int year = Integer.parseInt(TimeUtil.getYear(new Date()));
        int month = Integer.parseInt(TimeUtil.getMonth(new Date()));
        if (request.getParameter("year") != null) {
            year = Integer.parseInt(request.getParameter("year"));
        }
        if (year != Integer.parseInt(TimeUtil.getYear(new Date()))) {
            month = 12;
        }
        List<Backdata> backdataList = moneyService.getBackDataList(year);
        List<Integer> yearList = moneyService.getBackDataYearList();
        //yearList.add(2019);yearList.add(2020);yearList.add(2021);yearList.add(2021);yearList.add(2022);
        model.addAttribute("backdataList", backdataList);
        model.addAttribute("yearList", yearList);
        model.addAttribute("year", year);
        model.addAttribute("yearNow", Integer.parseInt(TimeUtil.getYear(new Date())));
        model.addAttribute("monthNow", Integer.parseInt(TimeUtil.getMonth(new Date())));
        model.addAttribute("month", month);
        return "index";
    }

    @RequestMapping("/index/backdata")
    public void indexBackData(HttpServletRequest request,HttpServletResponse response) {
        int year = Integer.parseInt(request.getParameter("year"));
        List<Backdata> backdataList = moneyService.getBackDataList(year);
        //MyData<Backdata> backdataMyData = new MyData<>(1, backdataList);
        String result = JSON.toJSONString(backdataList);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 管理员登录接口，返回登录信息，
     * 1.login_success,设置session
     * 2.password_error
     * 3.phone_error
     * @param request
     */
    @RequestMapping(value = "/manager/dologin/{phone}/{password}")
    public void dologin(@PathVariable("phone") String phone, @PathVariable("password") String password,
                        HttpServletRequest request, HttpServletResponse response) {
        String result = userService.managerLoginByPhoneAndPsw(phone, password);
        if (result.equals("login_success")) {
            request.getSession().setAttribute("phone", phone);
        }
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 管理员查看自己信息
     * @param request
     */
    @RequestMapping(value = "/manager/myinfo")
    public String myinfo(HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        String phone= (String) request.getSession().getAttribute("phone");
        User user= userService.getUserByPhone(phone);
        model.addAttribute("userinfo", user);
        return "myinfo";
    }

    @RequestMapping("/page_400")
    public String page_400() {
        return "page_400";
    }

    @RequestMapping("/page_403")
    public String page_403() {
        return "page_403";
    }

    @RequestMapping("/page_404")
    public String page_404() {
        return "page_404";
    }

    @RequestMapping("/page_500")
    public String page_500() {
        return "page_500";
    }

    /**
     * 添加管理员接口
     * @param request
     */
    @RequestMapping(value = "/addAdmin")
    public void addAdmin(//@PathVariable("phone") String phone,
                           HttpServletRequest request, HttpServletResponse response) {
        String result = "error";
        try {
            result = userService.addAdmin("13531097736", "123456");
            ResponseUtils.renderJson(response, result);
        } catch (MyThrowException e) {
            e.printStackTrace();
        }
    }
}
