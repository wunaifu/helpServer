package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.*;
import com.helpserver.service.MoneyService;
import com.helpserver.service.OrderService;
import com.helpserver.service.OrderTypeService;
import com.helpserver.service.UserService;
import com.helpserver.util.UserSessionSetUtils;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by wunaifu on 2018-03-06.
 */
@Controller
@RequestMapping("/accept")
public class AcceptOrderController {

    @Autowired
    OrderTypeService orderTypeService;
    @Autowired
    OrderService orderService;
    @Autowired
    MoneyService moneyService;
    @Autowired
    UserService userService;

    /**
     * 去往添加资源服务页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/doadd")
    public String addAcceptServer(HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        String orderId = request.getParameter("orderId");
        String type = request.getParameter("type");
        String amount = request.getParameter("amount");
        String useTime = request.getParameter("useTime");
        System.out.println("type=="+type);
        System.out.println("amount=="+amount);
        System.out.println("useTime=="+useTime);
        return "redirect:/index";
    }

}
