package com.helpserver.controller;

import com.helpserver.pojo.User;
import com.helpserver.service.UserService;
import com.helpserver.utils.JsonUtils;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.SessionSetUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
     * 个人信息页面
     * @param request
     * @return
     */
    @RequestMapping("/info")
    public String userInfo(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_info";
    }

    /**
     * 安全设置页面
     * @param request
     * @return
     */
    @RequestMapping("/safety")
    public String userSafety(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_safety";
    }

    /**
     * 修改密码页面
     * @param request
     * @return
     */
    @RequestMapping("/resetpsw")
    public String userResetPsw(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_resetpsw";
    }

    /**
     * 修改密码页面
     * @param request
     * @return
     */
    @RequestMapping("/bindphone")
    public String userBindPhone(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_bindphone";
    }

    /**
     * 身份验证页面
     * @param request
     * @return
     */
    @RequestMapping("/idcard")
    public String userIDcard(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_idcard";
    }

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
        String result = userService.loginByPhoneAndPsw(phone, password);
        //登录成功，session保存当前用户数据
        if (result.equals("login_success")) {
            request.getSession().setAttribute("user", userService.getUserByPhone(phone));
        }
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 注册接口，返回注册信息
     * 1、user_exist
     * 2、register_success
     * 3、register_failure
     * @param request
     */
    @RequestMapping(value = "/doregister/{phone}/{password}")
    public void doregister(@PathVariable("phone") String phone,@PathVariable("password") String password,
            HttpServletRequest request,HttpServletResponse response) {
        String result = userService.registerByPhoneAndPsw(phone, password);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 查看自己信息
     * @param request
     */
    @RequestMapping(value = "/myinfo")
    public String myinfo(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        User user1= (User) request.getSession().getAttribute("user");
        User user= userService.getUserByPhone(user1.getPhone());
        model.addAttribute("userinfo", user);
        return "myinfo";
    }
}

