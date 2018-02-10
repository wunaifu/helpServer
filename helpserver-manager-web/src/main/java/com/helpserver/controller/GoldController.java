package com.helpserver.controller;

import com.helpserver.pojo.*;
import com.helpserver.service.GoldService;
import com.helpserver.service.PayAccountService;
import com.helpserver.utils.MyThrowException;
import com.helpserver.utils.SessionSetUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
@RequestMapping("/gold")
public class GoldController {

    @Autowired
    GoldService goldService;
    @Autowired
    PayAccountService payAccountService;

    /**
     * 用户金币列表
     * @param request
     * @return
     */
    @RequestMapping("/usergold")
    public String userGold(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<GoldUserDto> goldUserDtoList = goldService.getGoldUserDtoList();
        model.addAttribute("goldUserDtoList", goldUserDtoList);
        return "gold_user_list";
    }

    /**
     * 金币充值审核列表
     * @param request
     * @return
     */
    @RequestMapping("/checkadd")
    public String goldCheckPayGold(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取未审核列表
        List<GoldAddDto> goldAddDtoList = goldService.getGoldAddDtoListByGetTime(0);
        model.addAttribute("goldAddDtoList", goldAddDtoList);
        return "gold_uncheck_list";
    }

    /**
     * 金币充值已审核列表
     * @param request
     * @return
     */
    @RequestMapping("/havedcheck")
    public String goldHavedCheck(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取充值历史列表
        List<GoldAddDto> goldAddDtoList = goldService.getGoldAddDtoListByGetTime(1);
        model.addAttribute("goldAddDtoList", goldAddDtoList);
        return "gold_havedcheck_list";
    }

    /**
     * 管理员查看金币充值详情
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pay/{addId}/detail")
    public String unCheckPayDetail(@PathVariable("addId") int addId,
                                   HttpServletRequest request,Model model) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取金币充值详情
        GoldAddDto goldAddDto = goldService.getGoldAddDtoByGoldAddId(addId);
        model.addAttribute("goldAddDto", goldAddDto);
        return "gold_pay_detail";
    }


    /**
     * 通过金币充值
     * @param request
     * @return
     */
    @RequestMapping("/agree/{addId}")
    public String goldAgreeAddGold(@PathVariable("addId") int addId,
                                 HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //pay_success
        String result = "";
        try {
            result = goldService.addPayGoldByGoldAddId(addId);
        } catch (MyThrowException e) {
            e.printStackTrace();
        }
        if (result.equals("pay_success")) {
            return "redirect:/gold/checkadd";
        }
        return "page_400";
    }

}
