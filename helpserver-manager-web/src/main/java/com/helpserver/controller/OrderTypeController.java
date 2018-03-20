package com.helpserver.controller;

import com.helpserver.pojo.Bigtype;
import com.helpserver.pojo.OrderTypeDto;
import com.helpserver.pojo.Ordertype;
import com.helpserver.service.OrderTypeService;
import com.helpserver.util.ManagerSessionSetUtils;
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
     * 管理员查看订单类型列表,大类型和子类型，未删除
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String orderTypeList(HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<OrderTypeDto> orderTypeDtoList = orderTypeService.getOrderTypeDtoList(1);
        model.addAttribute("orderTypeDtoList", orderTypeDtoList);
        return "ordertype_list";
    }

//------------------------------------订单父类型-------------------
    /**
     * 管理员查看订单父类型列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/biglist")
    public String orderTypeBigList(HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<Bigtype> bigtypeList = orderTypeService.getBigTypeList();
        model.addAttribute("bigtypeList", bigtypeList);
        return "orderbigtype_list";
    }

    /**
     * 管理员添加订单父类型
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/addbig")
    public String orderTypeAddBig(HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        String typeName = request.getParameter("typeName");
        Bigtype bigtype = new Bigtype();
        bigtype.setTypename(typeName);
        bigtype.setCreatetime(TimeUtil.dateToString(new Date()));
        String result = orderTypeService.insertBigType(bigtype);
        if (result.equals("add_success")) {
            return "redirect:/ordertype/biglist";
        }
        model.addAttribute("reason", "添加订单类型失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 跳转到订单父类型添加页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/addbigjsp")
    public String orderTypeAddBigJsp(HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        return "ordertype_bigadd";
    }

    /**
     * 管理员修改订单父类型
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/updatebig")
    public String orderTypeUpdateBig(HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int id = Integer.parseInt(request.getParameter("id"));
        String typeName = request.getParameter("typeName");
        Bigtype bigtype = new Bigtype();
        bigtype.setId(id);
        bigtype.setTypename(typeName);
        String result = orderTypeService.updateBigType(bigtype);
        if (result.equals("update_success")) {
            return "redirect:/ordertype/biglist";
        }
        model.addAttribute("reason", "更新订单类型失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 跳转到订单父类型修改页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/updatebigjsp/{id}")
    public String orderTypeUpdateBigJsp(@PathVariable("id") int id,HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        Bigtype bigtype = orderTypeService.getBigtypeById(id);
        model.addAttribute("bigType", bigtype);
        return "ordertype_bigupdate";
    }

//--------------------------------------订单子类型---------------------------------------------

    /**
     * 管理员通过父类型id查看子订单类型
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/typelist/{id}")
    public String orderTypelistByBigTypeId(@PathVariable("id") int id, HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<Ordertype> ordertypeList = orderTypeService.getOrdertypeList(id,1);
        model.addAttribute("ordertypeList", ordertypeList);
        model.addAttribute("bigtypeId", id);
        return "ordertype_list";
    }

    /**
     * 管理员添加订单类型
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String orderTypeAdd(HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int bigtypeId = Integer.parseInt(request.getParameter("bigtypeId"));
        String typeName = request.getParameter("typeName");
        Ordertype ordertype = new Ordertype();
        ordertype.setBigtypeid(bigtypeId);
        ordertype.setTypename(typeName);
        ordertype.setState(1);
        ordertype.setCreatetime(TimeUtil.dateToString(new Date()));
        String result = orderTypeService.insertOrderType(ordertype);
        if (result.equals("add_success")) {
            return "redirect:/ordertype/typelist/"+bigtypeId;
        }
        model.addAttribute("reason", "添加订单类型失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 跳转到订单子类型添加页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/addjsp/{id}")
    public String orderTypeAddJsp(@PathVariable("id") int id,HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        model.addAttribute("bigtypeId", id);
        return "ordertype_add";
    }

    /**
     * 管理员修改订单子类型
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/update")
    public String orderTypeUpdate(HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int id = Integer.parseInt(request.getParameter("id"));
        int bigtypeid = Integer.parseInt(request.getParameter("bigtypeid"));
        String typeName = request.getParameter("typeName");
        Ordertype ordertype = new Ordertype();
        ordertype.setId(id);
        ordertype.setTypename(typeName);
        String result = orderTypeService.updateOrderType(ordertype);
        if (result.equals("update_success")) {
            return "redirect:/ordertype/typelist/"+bigtypeid;
        }
        model.addAttribute("reason", "更新订单类型失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 跳转到订单子类型修改页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/updatejsp/{id}")
    public String orderTypeUpdateJsp(@PathVariable("id") int id,HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        Ordertype ordertype = orderTypeService.getOrderTypeById(id);
        model.addAttribute("orderType", ordertype);
        return "ordertype_update";
    }

    /**
     * 管理员通过id删除订单子类型
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/del/{id}")
    public String newsDelById(@PathVariable("id") int id, HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        Ordertype ordertype = new Ordertype();
        ordertype.setId(id);
        ordertype.setState(0);
        String result = orderTypeService.updateOrderTypeTypeById(ordertype);
        if (result.equals("update_success")) {
            Ordertype ordertype1 = orderTypeService.getOrderTypeById(id);
            return "redirect:/ordertype/typelist/"+ordertype1.getBigtypeid();
        }
        model.addAttribute("reason", "删除订单类型，请稍后再试！");
        return "page_400";
    }

    /**
     * 管理员查看订单类型列表，已删除
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/dellist/{id}")
    public String orderTypeDelList(@PathVariable("id") int id,HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<Ordertype> ordertypeList = orderTypeService.getOrdertypeList(id,0);
        model.addAttribute("orderTypeList", ordertypeList);
        model.addAttribute("bigtypeId", id);
        return "ordertype_dellist";
    }



    /**
     * 管理员通过id取消删除订单类型
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/undel/{id}")
    public String orderTypeUnDelById(@PathVariable("id") int id, HttpServletRequest request, Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        Ordertype ordertype = new Ordertype();
        ordertype.setId(id);
        ordertype.setState(1);
        String result = orderTypeService.updateOrderTypeTypeById(ordertype);
        if (result.equals("update_success")) {
            Ordertype ordertype1 = orderTypeService.getOrderTypeById(id);
            return "redirect:/ordertype/dellist/"+ordertype1.getBigtypeid();
        }
        model.addAttribute("reason", "取消删除订单类型失败，请稍后再试！");
        return "page_400";
    }

}
