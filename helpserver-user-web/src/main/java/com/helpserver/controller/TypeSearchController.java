package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.*;
import com.helpserver.service.*;
import com.helpserver.util.UserSessionSetUtils;
import com.helpserver.utils.Pager;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018-03-06.
 */
@Controller
@RequestMapping("/type")
public class TypeSearchController {

    @Autowired
    OrderTypeService orderTypeService;
    @Autowired
    OrderService orderService;
    @Autowired
    MoneyService moneyService;
    @Autowired
    UserService userService;
    @Autowired
    AcceptOrderService acceptOrderService;

    /**
     * 去往类型搜索结果页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/server/{typeId}/search")
    public String toTypeSearch(@PathVariable("typeId") int typeId,HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        int pageNum=1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        Ordertype ordertype = orderTypeService.getOrderTypeById(typeId);
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListByTypeId(typeId);
        Pager<OrderUserDto> pagerList = new Pager<>(pageNum, 10, orderUserDtoList);
        model.addAttribute("pagerList", pagerList);
        model.addAttribute("ordertype", ordertype);
        List<OrderTypeDto> orderTypeDtoList = orderTypeService.getOrderTypeDtoList(1);
        model.addAttribute("orderTypeDtoList", orderTypeDtoList);
        return "server_typesearch";
    }



}
