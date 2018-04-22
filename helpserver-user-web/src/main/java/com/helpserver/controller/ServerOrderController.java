package com.helpserver.controller;

import com.helpserver.pojo.Ordertype;
import com.helpserver.service.OrderService;
import com.helpserver.service.OrderTypeService;
import com.helpserver.util.UserSessionSetUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wunaifu on 2018-03-06.
 */
@Controller
@RequestMapping("/server")
public class ServerOrderController {

    @Autowired
    OrderTypeService orderTypeService;
    @Autowired
    OrderService orderService;

    /**
     * 去往添加资源服务页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String addServer(HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        List<Ordertype> orderTypeList = orderTypeService.getOrdertypeListByState(1);
        model.addAttribute("orderTypeList", orderTypeList);
        return "server_add";
    }

    @RequestMapping("/detail")
    public String serverDetail(HttpServletRequest request, Model model) {
        return "server_detail";
    }

    @RequestMapping("/info")
    public String serverInfo(HttpServletRequest request, Model model) {
        return "server_info";
    }

    @RequestMapping("/search")
    public String serverSearch(HttpServletRequest request, Model model) {
        return "server_search";
    }

    @RequestMapping("/userinfo")
    public String serverUserInfo(HttpServletRequest request, Model model) {
        return "server_userinfo";
    }

    @RequestMapping(value = "/map")
    public String getUserByUserId(HttpServletRequest request) throws Exception {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "server_goods_map";
    }

}
