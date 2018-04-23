package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.Money;
import com.helpserver.pojo.Orderinfo;
import com.helpserver.pojo.Ordertype;
import com.helpserver.service.MoneyService;
import com.helpserver.service.OrderService;
import com.helpserver.service.OrderTypeService;
import com.helpserver.util.UserSessionSetUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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
    @Autowired
    MoneyService moneyService;

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
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<Ordertype> orderTypeList = orderTypeService.getOrdertypeListByState(1);
        Money money = moneyService.getMoney(nowUser.getUserid());
        model.addAttribute("orderTypeList", orderTypeList);
        model.addAttribute("moneyInfo", money.getAmount());
        return "server_add";
    }

    /**
     * 确认添加资源服务
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/doadd")
    public String doAddServer(HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        String sendTime = TimeUtil.dateToString(new Date());
        String startTime = TimeUtil.dateToStrNoS(TimeUtil.stringToDate(request.getParameter("startTime")));
        String endTime = TimeUtil.dateToStrNoS(TimeUtil.stringToDate(request.getParameter("endTime")));

        Orderinfo orderinfo = new Orderinfo();
        orderinfo.setSenderid(nowUser.getUserid());
        orderinfo.setAccepterid(0);
        orderinfo.setAcceptorderid(0);
        orderinfo.setTypeid(Integer.parseInt(request.getParameter("ordertype")));
        orderinfo.setFoodname(request.getParameter("name"));
        orderinfo.setOrderdetail(request.getParameter("detail"));
        orderinfo.setMoneyamount(Integer.parseInt(request.getParameter("money")));
        orderinfo.setAddress(request.getParameter("address"));
        orderinfo.setCity(request.getParameter("city"));
        orderinfo.setPointinfo("");
        orderinfo.setSendtime(sendTime);
        orderinfo.setStarttime(startTime);
        orderinfo.setEndtime(endTime);
        orderinfo.setCallname(request.getParameter("username"));
        orderinfo.setCallphone(request.getParameter("userphone"));

        String result = orderService.insertOrder(orderinfo);
        if (result.equals("insert_success")) {
            model.addAttribute("message","发布资源服务成功！");
            return "pageuser_success";
        }
        model.addAttribute("message","发布资源服务失败，请稍后再试");
        return "page_400";
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
