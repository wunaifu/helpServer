package com.helpserver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
public class PageController {

    @RequestMapping(value = "/{page}")
    public String getUserByUserId(@PathVariable String page) throws Exception {
        return page;
    }

    @RequestMapping("/")
    public String showIndex1() {
        return "index";
    }

    @RequestMapping("/userinfo")
    public String showIndex11() {
        return "userinfo";
    }
}
