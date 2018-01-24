package com.helpserver.controller;

import com.helpserver.pojo.User;
import com.helpserver.service.UserService;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.SessionSetUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by wunaifu on 2018/1/13.
 */
@Controller
public class PageController {

    @Autowired
    UserService userService;

//    @RequestMapping(value = "/{page}")
//    public String getUserByUserId(@PathVariable String page,HttpServletRequest request) throws Exception {
//        if (!SessionSetUtils.isManagerLogin(request)) {
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

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {

        System.out.println("phone==" + request.getSession().getAttribute("phone"));
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        return "index";
    }

    @RequestMapping("/manager/index")
    public String showIndex11(HttpServletRequest request) {

        System.out.println("phone=="+request.getSession().getAttribute("phone"));
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        return "index";
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
}
