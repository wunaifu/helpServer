package com.helpserver.controller;

import com.helpserver.pojo.User;
import com.helpserver.service.UserService;
import com.helpserver.utils.SessionSetUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
public class PageController {

//    @RequestMapping(value = "/{page}")
//    public String getUserByUserId(@PathVariable String page) throws Exception {
//        return page;
//    }
    @Autowired
    UserService userService;

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
        request.getSession().removeAttribute("user");
        return "login";
    }

    @RequestMapping("/index")
    public String showIndex11(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "index";
    }

    @RequestMapping("/user_index")
    public String userindex(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_index";
    }

    @RequestMapping(value = "/register")
    public String register(){
        return "register";
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
}
