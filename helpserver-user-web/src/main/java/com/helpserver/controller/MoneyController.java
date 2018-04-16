package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.*;
import com.helpserver.service.GoldService;
import com.helpserver.service.MoneyService;
import com.helpserver.service.PayAccountService;
import com.helpserver.util.UserSessionSetUtils;
import com.helpserver.utils.MyThrowException;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/money")
public class MoneyController {

    @Autowired
    MoneyService moneyService;
    @Autowired
    PayAccountService payAccountService;

    /**
     * 查看我的余额，余额收支历史
     * @param request
     * @return
     */
    @RequestMapping("/info")
    public String goldInfo(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        List<Moneyhistory> moneyHistoryListGet = new ArrayList<>();
        List<Moneyhistory> moneyHistoryListPut = new ArrayList<>();
        List<Moneyhistory> moneyHistoryListAll = moneyService.getMoneyHistoryListByUserId(nowUser.getUserid());

        if (moneyHistoryListAll != null && moneyHistoryListAll.size() > 0) {
            for (int i = 0; i < moneyHistoryListAll.size(); i++) {
                if (moneyHistoryListAll.get(i).getState() == 1) {
                    moneyHistoryListGet.add(moneyHistoryListAll.get(i));
                } else {
                    moneyHistoryListPut.add(moneyHistoryListAll.get(i));
                }
            }
        }
        Money money = moneyService.getMoney(nowUser.getUserid());
        model.addAttribute("moneyHistoryListAll", moneyHistoryListAll);
        model.addAttribute("moneyHistoryListGet", moneyHistoryListGet);
        model.addAttribute("moneyHistoryListPut", moneyHistoryListPut);
        model.addAttribute("money", money);
        return "money_info";
    }

    /**
     * 充值我的余额
     * @param request
     * @return
     */
    @RequestMapping("/pay")
    public String moneyPay(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        Payaccount payaccount=payAccountService.getPayAccoun();
        model.addAttribute("payAccount", payaccount);
        return "money_pay";
    }

    /**
     * 确认充值余额、提交请求
     * @param request
     * @return
     */
    @RequestMapping("/dopay")
    public String moneyDoPay(@RequestParam(value = "file", required = false)
                                   MultipartFile file, HttpServletRequest request, Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        String fileName = null;
        try {
            if (file != null) {
                String picture = file.getOriginalFilename();
                if (picture.equals("")) {
                    model.addAttribute("message", "图片不能为空，请刷新页面后重试！");
                    return "page_400";
                } else {// 保存
                    String filePath = request.getSession().getServletContext().getRealPath("/") + "resources/img/"+nowUser.getUserid()+"/";
                    fileName = UUID.randomUUID() + picture.substring(picture.lastIndexOf("."));
                    System.out.println("**********" + filePath);
                    System.out.println("fileName1**********" + fileName);
                    File targetFile = new File(filePath, fileName); // 新建文件
                    if (!targetFile.exists()) { // 判断文件的路径是否存在
                        targetFile.mkdirs(); // 如果文件不存在 在目录中创建文件夹 这里要注意mkdir()和mkdirs()的区别
                    }
                    file.transferTo(targetFile); // 传送 失败就抛异常
                    // 执行更新图片在服务器的地址
                    fileName=nowUser.getUserid()+"/"+fileName;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "图片传送失败，请重试！");
            return "page_400";
        }
        int userId = nowUser.getUserid();
        int payAmount = Integer.parseInt(request.getParameter("pay"));

        Moneyadd moneyadd = new Moneyadd();
        moneyadd.setUserid(userId);
        moneyadd.setAddamount(payAmount);
        moneyadd.setAddtime(TimeUtil.dateToString(new Date()));
        moneyadd.setAddphoto(fileName);

        String result = "";
        result = moneyService.addMoneyadd(moneyadd);
        if (result.equals("paymoney_success")) {
            model.addAttribute("message", "充值请求提交成功，管理员将在24小时内处理，请等待！");
            return "pageuser_success";
        } else{
            model.addAttribute("message", "余额充值失败，请稍后再试！");
            return "page_400";
        }
    }

    /**
     * 查看我的余额充值历史
     * @param request
     * @return
     */
    @RequestMapping("/payhistory")
    public String moneyPayhistory(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        List<Moneyadd> moneyAddingList = moneyService.getMoneyAddingListByUserId(nowUser.getUserid());
        List<Moneyadd> moneyAddedList = moneyService.getMoneyAddedListByUserId(nowUser.getUserid());
        model.addAttribute("moneyAddingList", moneyAddingList);
        model.addAttribute("moneyAddedList", moneyAddedList);
        return "money_addhistory";
    }

}
