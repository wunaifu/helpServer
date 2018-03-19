package com.helpserver.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wunaifu on 2018-03-06.
 */
@Controller
public class ServerOrderController {

    @RequestMapping("/server/add")
    public String addServer(HttpServletRequest request, Model model) {
        return "server_add";
    }

    @RequestMapping("/server/detail")
    public String serverDetail(HttpServletRequest request, Model model) {
        return "server_detail";
    }

    @RequestMapping("/server/info")
    public String serverInfo(HttpServletRequest request, Model model) {
        return "server_info";
    }

    @RequestMapping("/server/search")
    public String serverSearch(HttpServletRequest request, Model model) {
        return "server_search";
    }

    @RequestMapping("/server/userinfo")
    public String serverUserInfo(HttpServletRequest request, Model model) {
        return "server_userinfo";
    }

}
