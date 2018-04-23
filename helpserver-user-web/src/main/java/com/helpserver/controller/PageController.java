package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.*;
import com.helpserver.service.*;
import com.helpserver.util.UserSessionSetUtils;
import com.helpserver.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
public class PageController {

    @Autowired
    UserService userService;
    @Autowired
    GoldService goldService;
    @Autowired
    NewsService newsService;
    @Autowired
    OrderTypeService orderTypeService;
    @Autowired
    MoneyService moneyService;
    @Autowired
    OrderService orderService;

//    @RequestMapping(value = "/{page}")
//    public String getUserByUserId(@PathVariable String page,HttpServletRequest request) throws Exception {
//        return page;
//    }

    /**
     * 前往修改当前城市
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/map")
    public String getUserByUserId(HttpServletRequest request) throws Exception {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "index_map";
    }
    @RequestMapping("/")
    public String showIndex1() {
        return "login";
    }

    @RequestMapping("/login")
    public String login1() {
        return "login";
    }

    @RequestMapping("/forgetpsw")
    public String forgetpsw() {
        return "login_forgetpsw";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("nowUser");
        return "login";
    }

    @RequestMapping("/finishmap")
    public String finishMap(HttpServletRequest request) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        String location = request.getParameter("locationmap");
        NowUser nowUser= (NowUser) request.getSession().getAttribute("nowUser");
        request.getSession().removeAttribute("nowUser");
        nowUser.setLocation(location);
        request.getSession().setAttribute("nowUser", nowUser);
        return "redirect:/index";
    }

    /**
     * 获取订单数据、数据类型跳转到首页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String showIndex11(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        String city = nowUser.getLocation();
        List<News> newsList = newsService.getNewsList();
        List<OrderTypeDto> orderTypeDtoList = orderTypeService.getOrderTypeDtoList(1);
        List<OrderUserDto> orderUserDtoList = new ArrayList<>();
        orderUserDtoList = orderService.getOrderUserDtoListByStateAndCity(1, city);
        System.out.println("orderUserDtoList1="+orderUserDtoList.toString());
        if (orderUserDtoList.size()<1) {
            orderUserDtoList = orderService.getOrderUserDtoListByState(1);
        }
        System.out.println("orderUserDtoList2="+orderUserDtoList.toString());
        model.addAttribute("newsList", newsList);
        model.addAttribute("orderTypeDtoList", orderTypeDtoList);
        model.addAttribute("orderUserDtoList", orderUserDtoList);
        return "index";
    }

    @RequestMapping("/index_type")
    public String index_type(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        List<OrderTypeDto> orderTypeDtoList = orderTypeService.getOrderTypeDtoList(1);
        model.addAttribute("orderTypeDtoList", orderTypeDtoList);
        return "index_type";
    }

    @RequestMapping("/index_user")
    public String index_user(HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        User user = userService.selectByPrimaryKey(nowUser.getUserid());
        Gold gold = goldService.getGold(nowUser.getUserid());
        Money money = moneyService.getMoney(nowUser.getUserid());
        user.setPassword("******");
        List<News> newsList = newsService.getNewsList();
        Pager<News> pager = new Pager<>(1, 6, newsList);
        model.addAttribute("newsList", pager.getDataList());
        model.addAttribute("userinfo", user);
        model.addAttribute("gold", gold);
        model.addAttribute("money", money);
        return "index_user";
    }

    @RequestMapping("/index_myorder")
    public String index_myorder(HttpServletRequest request) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "index_myorder";
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

    @RequestMapping("/pageuser_success")
    public String page_success() {
        return "pageuser_success";
    }
}
