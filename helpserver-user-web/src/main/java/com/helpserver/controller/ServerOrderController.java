package com.helpserver.controller;

import com.alibaba.fastjson.JSON;
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
@RequestMapping("/server")
public class ServerOrderController {

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
        model.addAttribute("nowTime", TimeUtil.dateToStrNoTime(new Date()));
        return "server_add";
    }

    /**
     * 确认添加资源服务
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/doadd")
    public String doAddServer(@RequestParam(value = "file", required = false)
                                          MultipartFile file[], HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        String sendTime = TimeUtil.dateToString(new Date());

        Orderinfo orderinfo = new Orderinfo();
        orderinfo.setSenderid(nowUser.getUserid());
        orderinfo.setTypeid(Integer.parseInt(request.getParameter("ordertype")));
        orderinfo.setCity(request.getParameter("city"));
        orderinfo.setFoodname(request.getParameter("name"));
        orderinfo.setAmount(Integer.parseInt(request.getParameter("amount")));
        orderinfo.setAddress(request.getParameter("address"));
        orderinfo.setLng(nowUser.getGoodsLng());
        orderinfo.setLat(nowUser.getGoodsLat());
        orderinfo.setMoneyamount(Integer.parseInt(request.getParameter("money")));
        orderinfo.setDaymoney(Integer.parseInt(request.getParameter("dayMoney")));
        orderinfo.setDaynumber(Integer.parseInt(request.getParameter("dayNumber")));
        orderinfo.setMonthmoney(Integer.parseInt(request.getParameter("monthMoney")));
        orderinfo.setMonthnumber(Integer.parseInt(request.getParameter("monthNumber")));
        orderinfo.setOrderdetail(request.getParameter("detail"));
        orderinfo.setSendtime(sendTime);
        orderinfo.setCallname(request.getParameter("username"));
        orderinfo.setCallphone(request.getParameter("userphone"));
        orderinfo.setOrderstate(1);
        orderinfo.setPointinfo(nowUser.getGoodsLocation());
        String fileName1 = "";
        String fileName2 = "";
        String fileName3 = "";
        try {
            if (file != null) {
                String picture1 = file[0].getOriginalFilename();
                String picture2 = file[1].getOriginalFilename();
                String picture3 = file[2].getOriginalFilename();
                String filePath = request.getSession().getServletContext().getRealPath("/") + "resources/img/" + nowUser.getUserid() + "/";
                if (picture1.equals("")) {
                    orderinfo.setPicture("goodsphoto.png");
                }else {// 保存
                    fileName1 = UUID.randomUUID() + picture1.substring(picture1.lastIndexOf("."));
                    File targetFile1 = new File(filePath, fileName1); // 新建文件
                    if (!targetFile1.exists()) { // 判断文件的路径是否存在
                        targetFile1.mkdirs(); // 如果文件不存在 在目录中创建文件夹 这里要注意mkdir()和mkdirs()的区别
                    }
                    file[0].transferTo(targetFile1); // 传送 失败就抛异常
                    // 执行更新图片在服务器的地址
                    fileName1 = nowUser.getUserid() + "/" + fileName1;
                    orderinfo.setPicture(fileName1);
                }
                if (picture2.equals("")) {
                    orderinfo.setInfopicture1("tw6.jpg");
                }else {// 保存
                    fileName2 = UUID.randomUUID() + picture1.substring(picture1.lastIndexOf("."));
                    File targetFile2 = new File(filePath, fileName2); // 新建文件
                    if (!targetFile2.exists()) { // 判断文件的路径是否存在
                        targetFile2.mkdirs(); // 如果文件不存在 在目录中创建文件夹 这里要注意mkdir()和mkdirs()的区别
                    }
                    file[1].transferTo(targetFile2); // 传送 失败就抛异常
                    // 执行更新图片在服务器的地址
                    fileName2 = nowUser.getUserid() + "/" + fileName2;
                    orderinfo.setInfopicture1(fileName2);
                }
                if (picture3.equals("")) {
                    orderinfo.setInfopicture2("tw6.jpg");
                } else {// 保存
                    fileName3 = UUID.randomUUID() + picture1.substring(picture1.lastIndexOf("."));
                    File targetFile3 = new File(filePath, fileName3); // 新建文件
                    if (!targetFile3.exists()) { // 判断文件的路径是否存在
                        targetFile3.mkdirs(); // 如果文件不存在 在目录中创建文件夹 这里要注意mkdir()和mkdirs()的区别
                    }
                    file[2].transferTo(targetFile3); // 传送 失败就抛异常
                    // 执行更新图片在服务器的地址
                    fileName3 = nowUser.getUserid() + "/" + fileName3;
                    orderinfo.setInfopicture2(fileName3);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "传送失败，请重试！");
            return "page_400";
        }
        String result = orderService.insertOrder(orderinfo);
        if (result.equals("insert_success")) {
            model.addAttribute("message","发布资源服务成功！");
            return "pageuser_success";
        }
        model.addAttribute("message","发布资源服务失败，请稍后再试");
        return "page_400";
    }

    /**
     * 资源服务详情
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/{orderId}/detail")
    public String serverDetail(@PathVariable("orderId") int orderId,HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        OrderUserDto orderUserDto = orderService.getOrderUserDtoByOrderId(orderId);
//        if (orderUserDto.getOrder().getAccepterid() == nowUser.getUserid()) {
//            orderUserDto.getOrder().setAccepterid(-1);
//        }
        Money money = moneyService.getMoney(nowUser.getUserid());
        List<AcceptOrderUserDto> acceptOrderUserDtoList = acceptOrderService.getAcceptOrderUserDtoListByOrderId(orderId);
        model.addAttribute("orderUserDto", orderUserDto);
        model.addAttribute("acceptOrderUserDtoList", acceptOrderUserDtoList);
        model.addAttribute("mymoney",money.getAmount());
        model.addAttribute("nowUser",nowUser);
        return "server_detail";
    }

    /**
     * 资源服务详情，资源位置地图
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/detail/{orderId}/map")
    public String serverDetailmap(@PathVariable("orderId") int orderId,
            HttpServletRequest request,Model model) throws Exception {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        Orderinfo orderinfo = orderService.getOrderById(orderId);
        String mylng = orderinfo.getLng();
        String mylat = orderinfo.getLat();
        if (mylng == null||mylat == null) {
            mylng = "113.090708";
            mylat = "22.599186";
        }
        if ("".equals(mylng)||"".equals(mylat)) {
            mylng = "113.090708";
            mylat = "22.599186";
        }
        String address = orderinfo.getAddress();
        System.out.println(mylng+","+mylat);
        model.addAttribute("mylng", mylng);
        model.addAttribute("mylat", mylat);
        model.addAttribute("address", address);
        return "server_detailmap";
    }

    /**
     * 资源服务搜索
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/search")
    public String serverSearch(HttpServletRequest request, ModelMap model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        String search = request.getParameter("search");
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
//        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderTypeDto> orderTypeDtoList = orderTypeService.getOrderTypeDtoList(1);
        List<OrderUserDto> orderUserDtoList = new ArrayList<>();
        orderUserDtoList = orderService.getOrderUserDtoListByStateAndSearch(1, search);
//        if (orderUserDtoList.size()<1) {
//            orderUserDtoList = orderService.getOrderUserDtoListByState(1);
//        }
        Pager<OrderUserDto> pager = new Pager<>(pageNum, 10, orderUserDtoList);
        System.out.println("pager============="+pager.toString());
        model.addAttribute("orderTypeDtoList", orderTypeDtoList);
        model.addAttribute("pagerList", pager);
        model.addAttribute("search", search);
        return "server_search";
    }

    /**
     * 查看用户的信息
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/{userId}/userinfo")
    public String serverUserInfo(@PathVariable("userId") int userId, HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        User user = userService.selectByPrimaryKey(userId);
        model.addAttribute("user", user);
        return "server_userinfo";
    }

    /**
     * 资源位置精细定位
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/map")
    public String getUserByUserId(HttpServletRequest request) throws Exception {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "server_goods_map";
    }

    /**
     * 完成资源位置精细定位
     * @param request
     * @return
     */
    @RequestMapping("/dogoodsmap")
    public void doGoodsMap(HttpServletRequest request, HttpServletResponse response) {

        String mylng = request.getParameter("mylng");
        String mylat = request.getParameter("mylat");
        String location = request.getParameter("location");
        try {
            location = URLDecoder.decode(location, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        NowUser nowUser= UserSessionSetUtils.getNowUser(request);
        request.getSession().removeAttribute("nowUser");
        nowUser.setGoodsLocation(location);
        nowUser.setGoodsLng(mylng);
        nowUser.setGoodsLat(mylat);
        request.getSession().setAttribute("nowUser", nowUser);
        ResponseUtils.renderJson(response,"success");
    }


    /**
     * 我发布的资源服务
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/list")
    public String serverMySend(HttpServletRequest request, ModelMap model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderUserDto> orderUserDtoList = new ArrayList<>();
        orderUserDtoList = orderService.getOrderUserDtoListBySendUserId(nowUser.getUserid());
        model.addAttribute("orderUserDtoList", orderUserDtoList);
        return "server_mysend_list";
    }

    /**
     * 我抢的资源服务
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/myaccept/list")
    public String serverMyAccept(HttpServletRequest request, ModelMap model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderAcceptDto> orderAcceptDtoList = acceptOrderService.getOrderAcceptDtoListByUserId(nowUser.getUserid());

        model.addAttribute("orderAcceptDtoList", orderAcceptDtoList);
        return "server_myaccept_list";
    }


    @RequestMapping(value = "/searchjson")
    public void serverSearchListJson(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        try {
            search = URLDecoder.decode(search, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println("search============="+search);
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        List<OrderUserDto> orderUserDtoList = new ArrayList<>();
        orderUserDtoList = orderService.getOrderUserDtoListByStateAndSearch(1, search);
        Pager<OrderUserDto> pager = new Pager<>(pageNum, 10, orderUserDtoList);
        System.out.println("pager============="+pager.toString());
        String result = JSON.toJSONString(pager);
        ResponseUtils.renderJson(response,result);
    }

}
