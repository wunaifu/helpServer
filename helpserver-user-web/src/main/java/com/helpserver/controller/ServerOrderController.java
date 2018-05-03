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
     * 去往修改资源服务页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/{orderId}/update")
    public String updateServer(@PathVariable("orderId") int orderId,HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser= UserSessionSetUtils.getNowUser(request);
        request.getSession().removeAttribute("nowUser");
        nowUser.setGoodsLocation("");
        nowUser.setGoodsLng("");
        nowUser.setGoodsLat("");
        request.getSession().setAttribute("nowUser", nowUser);
        OrderUserDto orderUserDto = orderService.getOrderUserDtoByOrderId(orderId);
        //List<Ordertype> orderTypeList = orderTypeService.getOrdertypeListByState(1);
        //Money money = moneyService.getMoney(nowUser.getUserid());
        //model.addAttribute("orderTypeList", orderTypeList);
        //model.addAttribute("nowTime", TimeUtil.dateToStrNoTime(new Date()));
        model.addAttribute("orderUserDto",orderUserDto);
        return "server_update";
    }

    /**
     * 确认修改资源服务
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/doupdate")
    public String doUpdateServer(@RequestParam(value = "file", required = false)
                                      MultipartFile file[], HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        String sendTime = TimeUtil.dateToString(new Date());

        Orderinfo orderinfo = new Orderinfo();
        orderinfo.setId(Integer.parseInt(request.getParameter("orderId")));
        orderinfo.setCity(request.getParameter("city"));
        orderinfo.setFoodname(request.getParameter("name"));
        orderinfo.setAmount(Integer.parseInt(request.getParameter("amount")));
        orderinfo.setAddress(request.getParameter("address"));
        orderinfo.setMoneyamount(Integer.parseInt(request.getParameter("money")));
        orderinfo.setDaymoney(Integer.parseInt(request.getParameter("dayMoney")));
        orderinfo.setDaynumber(Integer.parseInt(request.getParameter("dayNumber")));
        orderinfo.setMonthmoney(Integer.parseInt(request.getParameter("monthMoney")));
        orderinfo.setMonthnumber(Integer.parseInt(request.getParameter("monthNumber")));
        orderinfo.setOrderdetail(request.getParameter("detail"));
        orderinfo.setUpdatetime(sendTime);
        orderinfo.setCallname(request.getParameter("username"));
        orderinfo.setCallphone(request.getParameter("userphone"));
        if ("".equals(nowUser.getGoodsLat())) {

        } else {
            orderinfo.setLng(nowUser.getGoodsLng());
            orderinfo.setLat(nowUser.getGoodsLat());
            orderinfo.setPointinfo(nowUser.getGoodsLocation());
        }

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
        String result = orderService.updateOrder(orderinfo);
        if (result.equals("update_success")) {
            model.addAttribute("message","更新资源服务成功！");
            return "pageuser_success";
        }
        model.addAttribute("message","更新资源服务失败，请稍后再试");
        return "page_400";
    }

    /**
     * 下架资源
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/{orderId}/download")
    public String downloadServer(@PathVariable("orderId") int orderId,HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        Orderinfo orderinfo = new Orderinfo();
        orderinfo.setId(orderId);
        orderinfo.setOrderstate(2);
        orderinfo.setRepealtime(TimeUtil.dateToString(new Date()));
        String result = orderService.updateDownloadOrder(orderinfo);
        if (result.equals("update_success")) {
            model.addAttribute("message","下架资源服务成功！");
            return "pageuser_success";
        }
        model.addAttribute("message","下架资源服务失败，请稍后再试");
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
        Pager<AcceptOrderUserDto> pagerAccept = new Pager<>(1, 10, acceptOrderUserDtoList);

        List<Ordercomment> ordercommentList = orderService.getOrderCommentListByOrderId(orderId);
        Pager<Ordercomment> pagerComment = new Pager<>(1, 10, ordercommentList);
        model.addAttribute("orderUserDto", orderUserDto);
        model.addAttribute("pagerAccept", pagerAccept);
        model.addAttribute("pagerComment", pagerComment);
        model.addAttribute("mymoney",money.getAmount());
        model.addAttribute("nowUser",nowUser);
        return "server_detail";
    }

    /**
     * 资源服务详情评论列表分页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/commentlist")
    public void serverCommentListDetail(HttpServletRequest request, HttpServletResponse response) {
        int orderId=Integer.parseInt(request.getParameter("orderId"));
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        List<Ordercomment> ordercommentList = orderService.getOrderCommentListByOrderId(orderId);
        Pager<Ordercomment> pagerComment = new Pager<>(pageNum, 10, ordercommentList);
        String result = JSON.toJSONString(pagerComment);
        ResponseUtils.renderJson(response,result);
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
//        List<OrderTypeDto> orderTypeDtoList = orderTypeService.getOrderTypeDtoList(1);
        List<OrderUserDto> orderUserDtoList = new ArrayList<>();
        orderUserDtoList = orderService.getOrderUserDtoListByStateAndSearch(1, search);
//        if (orderUserDtoList.size()<1) {
//            orderUserDtoList = orderService.getOrderUserDtoListByState(1);
//        }
        Pager<OrderUserDto> pager = new Pager<>(pageNum, 10, orderUserDtoList);
        System.out.println("pager============="+pager.toString());
//        model.addAttribute("orderTypeDtoList", orderTypeDtoList);
        model.addAttribute("pagerList", pager);
        model.addAttribute("search", search);
        return "server_search";
    }

    /**
     * 搜索结果分页
     * @param request
     * @param response
     */
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
        NowUser nowUser= UserSessionSetUtils.getNowUser(request);
        request.getSession().removeAttribute("nowUser");
        nowUser.setGoodsLocation("");
        nowUser.setGoodsLng("");
        nowUser.setGoodsLat("");
        request.getSession().setAttribute("nowUser", nowUser);
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

//start mysendServer -------------------------------我预定的资源服务列表-------------------------------------------------

    /**
     * 我抢的资源服务列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/myaccept/list")
    public String serverMyAccept(HttpServletRequest request, ModelMap model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderAcceptDto> orderAcceptDtoList = acceptOrderService.getOrderAcceptDtoListByUserId(nowUser.getUserid());
        Pager<OrderAcceptDto> pagerList = new Pager<>(pageNum, 10, orderAcceptDtoList);
        model.addAttribute("pagerList", pagerList);
        return "server_myaccept_list";
    }

    /**
     * 我预定的资源服务列表分页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/myaccept/listjson")
    public void serverMyAcceptListJson(HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderAcceptDto> orderAcceptDtoList = acceptOrderService.getOrderAcceptDtoListByUserId(nowUser.getUserid());
        Pager<OrderAcceptDto> pagerList = new Pager<>(pageNum, 10, orderAcceptDtoList);
//        System.out.println("pagerList============="+pagerList.toString());
        String result = JSON.toJSONString(pagerList);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 我预定的资源服务搜索
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/myaccept/search")
    public String serverMyacceptSearch(HttpServletRequest request, ModelMap model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        String search = request.getParameter("search");
        int pageNum = 1;
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderAcceptDto> orderAcceptDtoList = acceptOrderService.getOrderAcceptDtoListByUserIdAndSearch(nowUser.getUserid(),search);
        Pager<OrderAcceptDto> pagerList = new Pager<>(pageNum, 10, orderAcceptDtoList);
        model.addAttribute("pagerList", pagerList);
        model.addAttribute("search", search);
        return "server_mysend_search";
    }

    /**
     * 我预定的资源服务搜索结果分页
     * @param request
     * @param response
     */
    @RequestMapping(value = "/myaccept/searchjson")
    public void serverMyacceptSearchListJson(HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
        String search = request.getParameter("search");
        try {
            search = URLDecoder.decode(search, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderAcceptDto> orderAcceptDtoList = acceptOrderService.getOrderAcceptDtoListByUserIdAndSearch(nowUser.getUserid(),search);
        Pager<OrderAcceptDto> pagerList = new Pager<>(pageNum, 10, orderAcceptDtoList);
//        System.out.println("pagerList============="+pagerList.toString());
        String result = JSON.toJSONString(pagerList);
        ResponseUtils.renderJson(response,result);
    }

//end mysendServer -------------------------------我预定的资源服务列表-------------------------------------------------

    /**
     * 资源服务抢单列表分页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/acceptlist")
    public void serverAcceptListDetail(HttpServletRequest request, HttpServletResponse response) {
        int orderId=Integer.parseInt(request.getParameter("orderId"));
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        List<AcceptOrderUserDto> acceptOrderUserDtoList = acceptOrderService.getAcceptOrderUserDtoListByOrderId(orderId);
        Pager<AcceptOrderUserDto> pagerAccept = new Pager<>(pageNum, 10, acceptOrderUserDtoList);
        System.out.println("pagerAccept============="+pagerAccept.toString());
        String result = JSON.toJSONString(pagerAccept);
        ResponseUtils.renderJson(response,result);
    }

//start mysendServer -------------------------------我发布的资源服务列表-------------------------------------------------
    /**
     * 我发布的资源服务进行中列表
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
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        //我发布的进行中的列表 1进行中，2已下架
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListByStateAndSendUserId(1,nowUser.getUserid());
        Pager<OrderUserDto> pagerList = new Pager<>(pageNum, 10, orderUserDtoList);
        model.addAttribute("pagerList", pagerList);
        return "server_mysend_list";
    }

    /**
     * 我发布的资源服务进行中列表分页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/mysend/listjson")
    public void serverMySendListJson(HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        //我发布的进行中的列表 1进行中，2已下架
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListByStateAndSendUserId(1,nowUser.getUserid());
        Pager<OrderUserDto> pagerList = new Pager<>(pageNum, 10, orderUserDtoList);
//        System.out.println("pagerList============="+pagerList.toString());
        String result = JSON.toJSONString(pagerList);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 我发布的资源服务进行中详情
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/{orderId}/detail")
    public String serverMySendDetail(@PathVariable("orderId") int orderId,HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
//        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        OrderUserDto orderUserDto = orderService.getOrderUserDtoByOrderId(orderId);
        List<AcceptOrderUserDto> acceptOrderUserDtoList = acceptOrderService.getAcceptOrderUserDtoListByOrderId(orderId);
        Pager<AcceptOrderUserDto> pagerAccept = new Pager<>(pageNum, 10, acceptOrderUserDtoList);

        List<Ordercomment> ordercommentList = orderService.getOrderCommentListByOrderId(orderId);
        Pager<Ordercomment> pagerComment = new Pager<>(1, 10, ordercommentList);
        model.addAttribute("orderUserDto", orderUserDto);
        model.addAttribute("pagerAccept", pagerAccept);
        model.addAttribute("pagerComment", pagerComment);
        return "server_mysend_detail";
    }

    /**
     * 我发布的资源服务搜索
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/search")
    public String serverMysendSearch(HttpServletRequest request, ModelMap model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        String search = request.getParameter("search");
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListBySendUserIdAndSearch(nowUser.getUserid(),search);
        Pager<OrderUserDto> pagerList = new Pager<>(pageNum, 10, orderUserDtoList);
        model.addAttribute("pagerList", pagerList);
        model.addAttribute("search", search);
        return "server_mysend_search";
    }

    /**
     * 我发布的资源服务搜索结果分页
     * @param request
     * @param response
     */
    @RequestMapping(value = "/mysend/searchjson")
    public void serverMysendSearchListJson(HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
        String search = request.getParameter("search");
        try {
            search = URLDecoder.decode(search, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListBySendUserIdAndSearch(nowUser.getUserid(),search);
        Pager<OrderUserDto> pagerList = new Pager<>(pageNum, 10, orderUserDtoList);
//        System.out.println("pagerList============="+pagerList.toString());
        String result = JSON.toJSONString(pagerList);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 我发布的资源服务抢单列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/{orderId}/acceptlist")
    public String serverMySendAcceptList(@PathVariable("orderId") int orderId,
            HttpServletRequest request, ModelMap model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
//        int orderId=Integer.parseInt(request.getParameter("orderId"));
        Orderinfo orderinfo = orderService.getOrderById(orderId);
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        List<AcceptOrderUserDto> acceptOrderUserDtoList = acceptOrderService.getAcceptOrderUserDtoListByOrderId(orderId);
        Pager<AcceptOrderUserDto> pagerList = new Pager<>(pageNum, 10, acceptOrderUserDtoList);
        model.addAttribute("pagerList", pagerList);
        model.addAttribute("orderinfo", orderinfo);
        return "server_mysend_acceptlist";
    }

    /**
     * 我发布的资源服务抢单列表分页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/mysend/acceptlistjson")
    public void serverMySendAcceptListJson(HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
//        List<AcceptOrderUserDto> acceptOrderUserDtoList = acceptOrderService.getAcceptOrderUserDtoListByOrderId(orderId);
//        Pager<AcceptOrderUserDto> pagerList = new Pager<>(pageNum, 10, acceptOrderUserDtoList);
        List<OrderAcceptDto> orderAcceptDtoList = acceptOrderService.getOrderAcceptDtoListByOrderId(orderId);
        Pager<OrderAcceptDto> pagerList = new Pager<>(pageNum, 10, orderAcceptDtoList);
        String result = JSON.toJSONString(pagerList);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 通过资源服务抢单
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/mysend/acceptlist/doagree")
    public void serverMySendAcceptListDoAgree(HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
        int acceptId = Integer.parseInt(request.getParameter("acceptId"));
        int state = Integer.parseInt(request.getParameter("state"));
        //int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        Acceptorder acceptorder = acceptOrderService.getAcceptorderById(acceptId);
        Orderinfo orderinfo = orderService.getOrderById(acceptorder.getOrderid());
        String result;
        //同意抢单或者不同意，更新订单订单表、抢单表
        if (state == 1) {
            result = orderService.updateAgreeAcceptAndOrder(acceptorder, orderinfo);
        } else {
            //同意抢单或者不同意，更新订单订单表、抢单表
            result = orderService.updateDisagreeAccept(acceptorder, orderinfo);
        }
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 归还资源
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/{acceptId}/returngoods")
    public void serverReturnGoods(@PathVariable("acceptId") int acceptId,
            HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
//        int acceptId = Integer.parseInt(request.getParameter("acceptId"));
        //int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        String result;
        result = orderService.updateReturnGoods(acceptId);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 前往付款页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/{acceptId}/{pageNum}/toputmoney")
    public String serverToPutMoney(@PathVariable("acceptId") int acceptId,@PathVariable("pageNum") int pageNum
            , HttpServletRequest request, Model model){
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        Acceptorder acceptorder = acceptOrderService.getAcceptorderById(acceptId);
        Orderinfo orderinfo = orderService.getOrderById(acceptorder.getOrderid());
        //3、计算归还押金、扣除租金费用、超期费用
        int moneyYa = orderinfo.getMoneyamount();//押金
        Date startTime = TimeUtil.stringToDate(acceptorder.getUpdatetime());
        Date nowTime = TimeUtil.stringToDate(acceptorder.getFinishtime());
        int daysNumber = TimeUtil.getDatePoor(nowTime, startTime);
        if (daysNumber < 1) {
            daysNumber = 1;
        }
        System.out.println("daysNumber======" + daysNumber);
        int needMoney = 0;//租金
        if (acceptorder.getMoneytype() == 0) {
            //日租  租金=数量*日租金*天数
            needMoney = acceptorder.getNumber() * acceptorder.getMoney() * daysNumber;
            if (daysNumber > (acceptorder.getGettype() + 5)) {
                //超期5天以上的需要扣除超期的余额，每天*1
                //加上超期的
                needMoney += daysNumber-acceptorder.getGettype();
            }
        } else {
            //月租 租金=数量*月租金*月数
            needMoney = acceptorder.getNumber() * acceptorder.getMoney() * acceptorder.getGettype();
            if (daysNumber > (acceptorder.getGettype() * 30 + 5)) {
                //超期5天以上的需要扣除超期的余额，每天*1
                //加上超期的
                needMoney += daysNumber - acceptorder.getGettype() * 30;
            }
        }
        //平台获取的服务费，从租金里扣除，1%比例扣除，不够的
        int systemMoney;
        if (needMoney % 100 == 0) {
            systemMoney = needMoney / 100;
        } else {
            systemMoney = needMoney / 100 + 1;
        }
        model.addAttribute("moneyYa", moneyYa);
        model.addAttribute("needMoney", needMoney);
        model.addAttribute("systemMoney", systemMoney);
        model.addAttribute("acceptId", acceptId);
        model.addAttribute("pageNum", pageNum);
        return "server_pay";
    }

    /**
     * 付款
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/{acceptId}/putmoney")
    public void serverPutMoney(@PathVariable("acceptId") int acceptId,
                                  HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
//        int acceptId = Integer.parseInt(request.getParameter("acceptId"));
        //int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        String result;
        result = orderService.updateOrderPutMoney(acceptId);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 抢单者前往评价页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/{acceptId}/tocomment")
    public String serverToComment(@PathVariable("acceptId") int acceptId, HttpServletRequest request, Model model){
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        Acceptorder acceptorder = acceptOrderService.getAcceptorderById(acceptId);
        OrderUserDto orderUserDto = orderService.getOrderUserDtoByOrderId(acceptorder.getOrderid());
        //3、计算归还押金、扣除租金费用、超期费用
        Date startTime = TimeUtil.stringToDate(acceptorder.getUpdatetime());
        Date nowTime = TimeUtil.stringToDate(acceptorder.getFinishtime());
        int daysNumber = TimeUtil.getDatePoor(nowTime, startTime);
        if (daysNumber < 1) {
            daysNumber = 1;
        }
        System.out.println("daysNumber======" + daysNumber);
        int needMoney = 0;//租金
        if (acceptorder.getMoneytype() == 0) {
            //日租  租金=数量*日租金*天数
            needMoney = acceptorder.getNumber() * acceptorder.getMoney() * daysNumber;
            if (daysNumber > (acceptorder.getGettype() + 5)) {
                //超期5天以上的需要扣除超期的余额，每天*1
                //加上超期的
                needMoney += daysNumber-acceptorder.getGettype();
            }
        } else {
            //月租 租金=数量*月租金*月数
            needMoney = acceptorder.getNumber() * acceptorder.getMoney() * acceptorder.getGettype();
            if (daysNumber > (acceptorder.getGettype() * 30 + 5)) {
                //超期5天以上的需要扣除超期的余额，每天*1
                //加上超期的
                needMoney += daysNumber - acceptorder.getGettype() * 30;
            }
        }
        model.addAttribute("orderUserDto", orderUserDto);
        model.addAttribute("needMoney", needMoney);
        model.addAttribute("acceptorder", acceptorder);
        return "server_myaccept_comment";
    }

    /**
     * 抢单者评价
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/myaccept/comment")
    public String serverMyAcceptComment(HttpServletRequest request, Model model){
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);

        String content = request.getParameter("content");
        int acceptId = Integer.parseInt(request.getParameter("acceptId"));
        int score = Integer.parseInt(request.getParameter("score"));
        Ordercomment ordercomment = new Ordercomment();
        ordercomment.setAcceptid(acceptId);
        ordercomment.setContent(content);
        ordercomment.setScore(score);
        ordercomment.setMyid(nowUser.getUserid());
        String result = orderService.insertMyAcceptOrderComment(ordercomment);
        if (result.equals("insert_success")) {
            model.addAttribute("message", "评论成功！");
            return "pageuser_success";
        }
        model.addAttribute("message", "评论失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 订单者前往评价页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/{acceptId}/tocomment")
    public String serverMysendToComment(@PathVariable("acceptId") int acceptId, HttpServletRequest request, Model model){
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        Acceptorder acceptorder = acceptOrderService.getAcceptorderById(acceptId);
        OrderUserDto orderUserDto = orderService.getOrderUserDtoByOrderId(acceptorder.getOrderid());
        //3、计算归还押金、扣除租金费用、超期费用
        Date startTime = TimeUtil.stringToDate(acceptorder.getUpdatetime());
        Date nowTime = TimeUtil.stringToDate(acceptorder.getFinishtime());
        int daysNumber = TimeUtil.getDatePoor(nowTime, startTime);
        if (daysNumber < 1) {
            daysNumber = 1;
        }
        System.out.println("daysNumber======" + daysNumber);
        int needMoney = 0;//租金
        if (acceptorder.getMoneytype() == 0) {
            //日租  租金=数量*日租金*天数
            needMoney = acceptorder.getNumber() * acceptorder.getMoney() * daysNumber;
            if (daysNumber > (acceptorder.getGettype() + 5)) {
                //超期5天以上的需要扣除超期的余额，每天*1
                //加上超期的
                needMoney += daysNumber-acceptorder.getGettype();
            }
        } else {
            //月租 租金=数量*月租金*月数
            needMoney = acceptorder.getNumber() * acceptorder.getMoney() * acceptorder.getGettype();
            if (daysNumber > (acceptorder.getGettype() * 30 + 5)) {
                //超期5天以上的需要扣除超期的余额，每天*1
                //加上超期的
                needMoney += daysNumber - acceptorder.getGettype() * 30;
            }
        }
        model.addAttribute("orderUserDto", orderUserDto);
        model.addAttribute("needMoney", needMoney);
        model.addAttribute("acceptorder", acceptorder);
        return "server_mysend_comment";
    }

    /**
     * 订单者评价
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/comment")
    public String serverMysendComment(HttpServletRequest request, Model model){
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);

        String content = request.getParameter("content");
        int acceptId = Integer.parseInt(request.getParameter("acceptId"));
        int score = Integer.parseInt(request.getParameter("score"));
        Ordercomment ordercomment = new Ordercomment();
        ordercomment.setAcceptid(acceptId);
        ordercomment.setContent(content);
        ordercomment.setScore(score);
        ordercomment.setMyid(nowUser.getUserid());
        String result = orderService.insertMySendOrderComment(ordercomment);
        if (result.equals("insert_success")) {
            model.addAttribute("message", "评论成功！");
            return "pageuser_success";
        }
        model.addAttribute("message", "评论失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 我发布的资源服务已下架列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/finishlist")
    public String serverMySendFinishList(HttpServletRequest request, ModelMap model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        //我发布的进行中的列表 1进行中，2已下架
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListByStateAndSendUserId(2,nowUser.getUserid());
        Pager<OrderUserDto> pagerList = new Pager<>(pageNum, 10, orderUserDtoList);
        model.addAttribute("pagerList", pagerList);
        return "server_mysend_finishlist";
    }

    /**
     * 我发布的资源服务已下架列表分页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/mysend/finishlistjson")
    public void serverMySendFinishListJson(HttpServletRequest request, HttpServletResponse response) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            ResponseUtils.renderJson(response,null);
        }
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        //我发布的进行中的列表 1进行中，2已下架
        List<OrderUserDto> orderUserDtoList = orderService.getOrderUserDtoListByStateAndSendUserId(2,nowUser.getUserid());
        Pager<OrderUserDto> pagerList = new Pager<>(pageNum, 10, orderUserDtoList);
//        System.out.println("pagerList============="+pagerList.toString());
        String result = JSON.toJSONString(pagerList);
        ResponseUtils.renderJson(response,result);
    }

    /**
     * 我发布的资源服务已下架详情
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/{orderId}/finishdetail")
    public String serverMySendFinishDetail(@PathVariable("orderId") int orderId,HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
//        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        OrderUserDto orderUserDto = orderService.getOrderUserDtoByOrderId(orderId);
        List<AcceptOrderUserDto> acceptOrderUserDtoList = acceptOrderService.getAcceptOrderUserDtoListByOrderId(orderId);
        Pager<AcceptOrderUserDto> pagerAccept = new Pager<>(pageNum, 10, acceptOrderUserDtoList);

        List<Ordercomment> ordercommentList = orderService.getOrderCommentListByOrderId(orderId);
        Pager<Ordercomment> pagerComment = new Pager<>(1, 10, ordercommentList);
        model.addAttribute("orderUserDto", orderUserDto);
        model.addAttribute("pagerAccept", pagerAccept);
        model.addAttribute("pagerComment", pagerComment);
        return "server_mysend_finishdetail";
    }

    /**
     * 去往重新上架资源服务页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/{orderId}/upload")
    public String updateUploadServer(@PathVariable("orderId") int orderId,HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser= UserSessionSetUtils.getNowUser(request);
        request.getSession().removeAttribute("nowUser");
        nowUser.setGoodsLocation("");
        nowUser.setGoodsLng("");
        nowUser.setGoodsLat("");
        request.getSession().setAttribute("nowUser", nowUser);
        OrderUserDto orderUserDto = orderService.getOrderUserDtoByOrderId(orderId);
        List<Ordertype> orderTypeList = orderTypeService.getOrdertypeListByState(1);
        Money money = moneyService.getMoney(nowUser.getUserid());
        model.addAttribute("moneyInfo", money.getAmount());
        model.addAttribute("orderTypeList", orderTypeList);
        //model.addAttribute("nowTime", TimeUtil.dateToStrNoTime(new Date()));
        model.addAttribute("orderUserDto",orderUserDto);
        return "server_reupload";
    }

    /**
     * 确认重新上架资源服务
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/mysend/doupload")
    public String doUpdateUploadServer(@RequestParam(value = "file", required = false)
                                         MultipartFile file[], HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        String sendTime = TimeUtil.dateToString(new Date());

        Orderinfo orderinfo = new Orderinfo();
        orderinfo.setSenderid(nowUser.getUserid());
        orderinfo.setId(Integer.parseInt(request.getParameter("orderId")));
        orderinfo.setCity(request.getParameter("city"));
        orderinfo.setFoodname(request.getParameter("name"));
        orderinfo.setAmount(Integer.parseInt(request.getParameter("amount")));
        orderinfo.setAddress(request.getParameter("address"));
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
        if ("".equals(nowUser.getGoodsLat())) {

        } else {
            orderinfo.setLng(nowUser.getGoodsLng());
            orderinfo.setLat(nowUser.getGoodsLat());
            orderinfo.setPointinfo(nowUser.getGoodsLocation());
        }

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
        String result = orderService.updateReUploadOrder(orderinfo);
        if (result.equals("update_success")) {
            model.addAttribute("message","重新上架资源服务成功！");
            return "pageuser_success";
        }
        model.addAttribute("message","重新上架资源服务失败，请稍后再试");
        return "page_400";
    }

//end mysendServer -------------------------------我发布的资源服务列表----------------------------------------------------
}
