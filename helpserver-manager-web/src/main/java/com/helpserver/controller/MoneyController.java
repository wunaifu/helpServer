package com.helpserver.controller;

import com.helpserver.pojo.*;
import com.helpserver.service.GoldService;
import com.helpserver.service.MoneyService;
import com.helpserver.service.PayAccountService;
import com.helpserver.service.UserService;
import com.helpserver.util.ManagerSessionSetUtils;
import com.helpserver.utils.MyThrowException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
@RequestMapping("/money")
public class MoneyController {

    @Autowired
    MoneyService moneyService;
    @Autowired
    PayAccountService payAccountService;
    @Autowired
    UserService userService;

    /**
     * 用户余额列表
     * @param request
     * @return
     */
    @RequestMapping("/userlist")
    public String userMoneyList(HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<MoneyUserDto> moneyUserDtoList = moneyService.getMoneyUserDtoList();
        model.addAttribute("moneyUserDtoList", moneyUserDtoList);
        return "money_user_list";
    }

    /**
     * 管理员查看某用户的余额收支历史
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{userId}/iolist")
    public String userMoneyIOlist(@PathVariable("userId") int userId,
                                   HttpServletRequest request,Model model) throws Exception {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        User user = userService.selectByPrimaryKey(userId);
        //获取余额收支历史
        List<Moneyhistory> moneyhistoryList = moneyService.getMoneyHistoryListByUserId(userId);
        model.addAttribute("user", user);
        model.addAttribute("moneyhistoryList", moneyhistoryList);
        return "money_user_iolist";
    }

    /**
     * 管理员查看某用户的余额充值历史
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{userId}/inlist")
    public String userMoneyInlist(@PathVariable("userId") int userId,
                                  HttpServletRequest request,Model model) throws Exception {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        User user = userService.selectByPrimaryKey(userId);
        //获取余额收支历史
        List<Moneyadd> moneyaddList = moneyService.getMoneyAddListByUserId(userId);
        model.addAttribute("user", user);
        model.addAttribute("moneyhistoryList", moneyaddList);
        return "money_user_inlist";
    }

    /**
     * 管理员查看某用户的余额提现历史
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{userId}/outlist")
    public String userMoneyOutlist(@PathVariable("userId") int userId,
                                  HttpServletRequest request,Model model) throws Exception {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        User user = userService.selectByPrimaryKey(userId);
        //获取余额收支历史
        List<Moneyget> moneygetList = moneyService.getMoneygetListByUserId(userId);
        model.addAttribute("user", user);
        model.addAttribute("moneyhistoryList", moneygetList);
        return "money_user_outlist";
    }

    /**
     * 余额充值审核列表
     * @param request
     * @return
     */
    @RequestMapping("/checkadd")
    public String moneyCheckPayMoney(HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取未审核列表
        List<MoneyAddDto> moneyAddDtoList = moneyService.getMoneyAddDtoListByGetTime(0);
        model.addAttribute("moneyAddDtoList", moneyAddDtoList);
        return "money_uncheck_list";
    }

    /**
     * 余额充值已审核列表
     * @param request
     * @return
     */
    @RequestMapping("/havedcheck")
    public String moneyHavedCheck(HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取充值历史列表
        List<MoneyAddDto> moneyAddDtoList = moneyService.getMoneyAddDtoListByGetTime(1);
        model.addAttribute("moneyAddDtoList", moneyAddDtoList);
        return "money_havedcheck_list";
    }

    /**
     * 管理员查看余额充值详情
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pay/{addId}/detail")
    public String unCheckPayDetail(@PathVariable("addId") int addId,
                                   HttpServletRequest request,Model model) throws Exception {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取金币充值详情
        MoneyAddDto moneyAddDto = moneyService.getMoneyAddDtoByMoneyAddId(addId);
        model.addAttribute("moneyAddDto", moneyAddDto);
        return "money_pay_detail";
    }


    /**
     * 通过余额充值
     * @param request
     * @return
     */
    @RequestMapping("/agree/{addId}")
    public String moneyAgreeAddMoney(@PathVariable("addId") int addId,
                                 HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //pay_success
        String result = "";
        try {
            result = moneyService.addPayMoneyByMoneyAddId(addId);
        } catch (MyThrowException e) {
            e.printStackTrace();
        }
        if (result.equals("pay_success")) {
            return "redirect:/money/checkadd";
        }
        return "page_400";
    }

    /**
     * 余额提现审核列表
     * @param request
     * @return
     */
    @RequestMapping("/checkget")
    public String moneyCheckGetMoney(HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取未审核列表
        List<MoneyGetDto> moneyGetDtoList = moneyService.getMoneyGetDtoListByGetTime(0);
        model.addAttribute("moneyGetDtoList", moneyGetDtoList);
        return "money_uncheck_getlist";
    }

    /**
     * 通过余额提现
     * @param request
     * @return
     */
    @RequestMapping("/agreeget/{getId}")
    public String moneyAgreeGetMoney(@PathVariable("getId") int getId,
                                     HttpServletRequest request,Model model) {
        if (!ManagerSessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //pay_success
        String result = "";
        try {
            result = moneyService.addMoneyGetByMoneyGetId(getId);
        } catch (MyThrowException e) {
            e.printStackTrace();
        }
        if (result.equals("pay_success")) {
            return "redirect:/money/checkget";
        }
        return "page_400";
    }
}
