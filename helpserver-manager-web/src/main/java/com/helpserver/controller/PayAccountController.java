package com.helpserver.controller;

import com.helpserver.pojo.Payaccount;
import com.helpserver.pojo.User;
import com.helpserver.service.PayAccountService;
import com.helpserver.service.UserService;
import com.helpserver.utils.ResponseUtils;
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
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;
import java.util.UUID;

/**
 * Created by wunaifu on 2018/1/13.
 */
@Controller
public class PayAccountController {

    @Autowired
    PayAccountService payAccountService;

    /**
     * 管理支付宝收款码
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/manager/mypayaccount")
    public String mypayaccount(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        Payaccount payaccount=payAccountService.getPayAccoun();
        model.addAttribute("payaccount", payaccount);
        return "mypayaccount";
    }

    /**
     * 保存收款码
     * @param file
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/manager/update/payaccount")
    public String updateMypayaccount(@RequestParam(value = "file", required = false)
                                           MultipartFile file, HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        String fileName1 = null;
        int id = Integer.parseInt(request.getParameter("id"));
        Payaccount payaccount = new Payaccount();
        payaccount.setTime(TimeUtil.dateToString(new Date()));
        try {
            if (file != null) {
                String picture1 = file.getOriginalFilename();
                if (picture1.equals("")) {
                    model.addAttribute("reason", "没有更新收款码，请返回！");
                    return "page_400";
                } else {// 保存
                    String filePath = request.getSession().getServletContext().getRealPath("/") + "resources/img/";
                    fileName1 = UUID.randomUUID() + picture1.substring(picture1.lastIndexOf("."));
                    System.out.println("**********" + filePath);
                    System.out.println("fileName1**********" + fileName1);
                    File targetFile1 = new File(filePath, fileName1); // 新建文件
                    if (!targetFile1.exists()) { // 判断文件的路径是否存在
                        targetFile1.mkdirs(); // 如果文件不存在 在目录中创建文件夹 这里要注意mkdir()和mkdirs()的区别
                    }
                    file.transferTo(targetFile1); // 传送 失败就抛异常
                    // 执行更新图片在服务器的地址
                    payaccount.setPayphoto(fileName1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("reason", "传送失败，请重试！");
            return "page_400";
        }
        String result = "";
        if (id == 0) {
            //添加操作
            result = payAccountService.insertPayAccount(payaccount);
        } else {
            //修改操作
            payaccount.setId(id);
            result = payAccountService.updatePayAccount(payaccount);
        }
        if (result.equals("update_success")) {
            return "redirect:/manager/mypayaccount";
        }
        model.addAttribute("reason", "保存失败，请重试！");
        return "page_400";
    }



}
