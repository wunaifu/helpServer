package com.helpserver.controller;

import com.helpserver.pojo.*;
import com.helpserver.service.*;
import com.helpserver.util.ManagerSessionSetUtils;
import com.helpserver.utils.MyThrowException;
import com.helpserver.utils.ResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    OrderTypeService orderTypeService;
    @Autowired
    PayAccountService payAccountService;
    @Autowired
    UserService userService;

    /**
     * 订单进行中列表
     * 1抢单进行中
     * @param request
     * @return
     */
    @RequestMapping("/listing")
    public String orderListing(HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListByState(1);
        model.addAttribute("orderUserDtoList", orderUserDtoList);
        return "order_going_list";
    }

    /**
     * 订单已结束列表
     * 2已结束
     * @param request
     * @return
     */
    @RequestMapping("/finishlist")
    public String orderListfinish(HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoList(0,2);
        model.addAttribute("orderUserDtoList", orderUserDtoList);
        return "order_finish_list";
    }

    /**
     * 订单被禁止列表
     * -1管理员禁止该订单
     * @param request
     * @return
     */
    @RequestMapping("/banlist")
    public String orderListban(HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int state = -1;
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListByState(state);
        model.addAttribute("orderUserDtoList", orderUserDtoList);
        return "order_ban_list";
    }

    /**
     * 管理员查看某资源服务的详细信息
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{orderId}/detail")
    public String orderDetail(@PathVariable("orderId") int orderId,
                                 HttpServletRequest request,Model model) throws Exception {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        OrderUserDto orderUserDto = orderService.getOrderUserDtoByOrderId(orderId);
        model.addAttribute("orderUserDto", orderUserDto);
        return "order_detail";
    }

    /**
     * 管理员查看某资源服务的抢单详情
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{orderId}/asklist")
    public String orderAskList(@PathVariable("orderId") int orderId,
                                 HttpServletRequest request,Model model) throws Exception {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        Orderinfo order = orderService.getOrderById(orderId);
        List<AcceptOrderUserDto> acceptOrderUserDtoList = orderService.getAcceptOrderUserDtoListByOrderId(order);
        model.addAttribute("order", order);
        model.addAttribute("acceptOrderUserDtoList", acceptOrderUserDtoList);
        return "order_asklist";
    }

}
