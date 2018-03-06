package com.helpserver.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2018-03-06.
 */
@Controller
public class HelpServerController {

    @RequestMapping("/server/add")
    public String addServer(HttpServletRequest request, Model model) {
        return "server_add";
    }

}
