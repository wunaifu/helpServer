package com.helpserver.controller;

import com.helpserver.service.UserService;
import com.helpserver.utils.ResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by wunaifu on 2018/1/13.
 */
@Controller
public class PageController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/{page}")
    public String getUserByUserId(@PathVariable String page) throws Exception {
        return page;
    }

    @RequestMapping("/")
    public String showIndex1() {
        return "login";
    }

    @RequestMapping("/manager/index")
    public String showIndex11() {
        return "index";
    }

    /**
     * 管理员登录接口，返回登录信息，
     * 1.login_success
     * 2.password_error
     * 3.phone_error
     * @param request
     */
    @RequestMapping(value = "/manager/dologin/{phone}/{password}")
    public void dologin(@PathVariable("phone") String phone, @PathVariable("password") String password,
                        HttpServletRequest request, HttpServletResponse response) {
        String result = userService.managerLoginByPhoneAndPsw(phone, password);
        ResponseUtils.renderJson(response,result);
    }
}
