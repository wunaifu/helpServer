package com.helpserver.controller;

import com.helpserver.pojo.User;
import com.helpserver.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

/**
 * Created by wunaifu on 2018/1/11.
 * 你好啊冲突
 * ninsdfakajsdf
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查看已被禁用用户列表
     * 1、可以查看用户详情
     * 2、可以取消禁用
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/user/banlist")
    public String fineAllBanUser(Model model) throws Exception {
        List<User> userList = userService.getUserListByPermission(2);
//        System.out.println("userList===" + userList.toString());
        model.addAttribute("userList", userList);
        return "user_beban_list";
    }

    /**
     * 查看已被禁用用户列表
     * 1、可以查看用户详情
     * 2、重置密码
     * 3、禁用
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/user/uselist")
    public String fineAllUsingUser(Model model) throws Exception {
        List<User> userList = userService.getAllUseingUserList();
//        System.out.println("userList===" + userList.toString());
        model.addAttribute("userList", userList);
        return "user_using_list";
    }


    @RequestMapping(value = "/user/{userId}/detail")
    public String getUserByUserId(@PathVariable("userId") int userId,Model model) throws Exception {
        User user = userService.selectByPrimaryKey(userId);
        System.out.println("user===" + user.getName());
        System.out.println("userList===" + user.toString());
//        String pageStr = "";
//        if (permission == 2) {
//            pageStr = "banlist";
//        } else {
//            pageStr = "uselist";
//        }
        model.addAttribute("userinfo", user);
//        model.addAttribute("pageinfo", pageStr);
        return "user_info";
    }





}