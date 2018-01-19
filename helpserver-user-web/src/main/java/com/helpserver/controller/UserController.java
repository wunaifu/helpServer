package com.helpserver.controller;

import com.helpserver.pojo.User;
import com.helpserver.service.UserService;
import com.helpserver.utils.JsonUtils;
import com.helpserver.utils.ResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

/**
 * Created by wunaifu on 2018/1/11.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     *
     * @param request
     */
    @RequestMapping(value = "/dologin")
    public void dologin(HttpServletRequest request,HttpServletResponse response) {
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        //获取phone和psw的验证情况
        String result = userService.loginByPhoneAndPsw(phone, password);
        User user = new User();
        user.setUserid(1);
        user.setAddress("iuiji");
        user.setAge(12);
        System.out.println("ddddddd" + JsonUtils.objectToJson(user));
        ResponseUtils.renderJson(response,JsonUtils.objectToJson(user));
    }
}

