package com.helpserver.controller;

import com.helpserver.pojo.User;
import com.helpserver.service.UserService;
import com.helpserver.utils.JsonUtils;
import com.helpserver.utils.ResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
     * 登录接口，返回登录信息，
     * 1.login_success
     * 2.password_error
     * 3.phone_error
     * @param request
     */
    @RequestMapping(value = "/dologin/{phone}/{password}")
    public void dologin(@PathVariable("phone") String phone,@PathVariable("password") String password,
            HttpServletRequest request,HttpServletResponse response) {
//        String phone = "";
//        String password = "";
//        if (request.getParameter("phone") == null || request.getParameter("password") == null) {
//            ResponseUtils.renderJson(response,"not_param");
//        }
//        phone = request.getParameter("phone");
//        password = request.getParameter("password");
        //获取phone和psw的验证情况
        String result = userService.loginByPhoneAndPsw(phone, password);
        ResponseUtils.renderJson(response,result);
//        ResponseUtils.renderJson(response,JsonUtils.objectToJson(user));
    }

    /**
     * 注册接口，返回注册信息
     * 1、user_exist
     * 2、register_success
     * 3、register_failure
     * @param request
     */
    @RequestMapping(value = "/doregister/{phone}/{password}")
    public void register(@PathVariable("phone") String phone,@PathVariable("password") String password,
            HttpServletRequest request,HttpServletResponse response) {
//        String phone = "";
//        String password = "";
//        if (request.getParameter("phone") == null || request.getParameter("password") == null) {
//            ResponseUtils.renderJson(response,"not_param");
//        }
        phone = request.getParameter("phone");
        password = request.getParameter("password");
        //获取phone和psw的验证情况
        String result = userService.registerByPhoneAndPsw(phone, password);
        ResponseUtils.renderJson(response,result);
    }
}

