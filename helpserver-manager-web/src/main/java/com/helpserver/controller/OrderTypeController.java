package com.helpserver.controller;

import com.helpserver.pojo.News;
import com.helpserver.pojo.Ordertype;
import com.helpserver.service.NewsService;
import com.helpserver.service.OrderTypeService;
import com.helpserver.utils.SessionSetUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018-03-06.
 */
@Controller
@RequestMapping("/ordertype")
public class OrderTypeController {

    @Autowired
    OrderTypeService orderTypeService;

    /**
     * 管理员查看订单类型列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String orderTypeList(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<Ordertype> ordertypeList = orderTypeService.getOrdertypeList();
        model.addAttribute("orderTypeList", ordertypeList);
        return "ordertype_list";
    }

    /**
     * 管理员通过id删除订单类型
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/del/{id}")
    public String newsDelById(@PathVariable("id") int id, HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        String result = orderTypeService.deleteOrderTypeById(id);
        if (result.equals("del_success")) {
            return "redirect:/ordertype/list";
        }
        model.addAttribute("message", "删除订单类型，请稍后再试！");
        return "page_400";
    }

    /**
     * 管理员添加订单类型
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String orderTypeAdd(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        String typeName = request.getParameter("typeName");
        Ordertype ordertype = new Ordertype();
        ordertype.setTypename(typeName);
        String result = orderTypeService.insertOrderType(ordertype);
        if (result.equals("insert_success")) {
            return "redirect:/ordertype/list";
        }
        model.addAttribute("message", "添加订单类型失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 跳转到订单类型添加页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/addjsp")
    public String orderTypeAddJsp(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        return "ordertype_add";
    }

    /**
     * 管理员修改订单类型
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/update")
    public String orderTypeUpdate(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int id = Integer.parseInt(request.getParameter("id"));
        int type = Integer.parseInt(request.getParameter("type"));
        String typeName = request.getParameter("typeName");
        Ordertype ordertype = new Ordertype();
        ordertype.setOrdertypeid(id);
        ordertype.setType(type);
        ordertype.setTypename(typeName);
        String result = orderTypeService.updateOrderType(ordertype);
        if (result.equals("update_success")) {
            return "redirect:/ordertype/list";
        }
        model.addAttribute("message", "添加订单类型失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 跳转到订单类型修改页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/updatejsp/{id}")
    public String orderTypeUpdateJsp(@PathVariable("id") int id,HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        Ordertype ordertype = orderTypeService.getOrderTypeById(id);
        model.addAttribute("orderType", ordertype);
        return "ordertype_update";
    }


}
