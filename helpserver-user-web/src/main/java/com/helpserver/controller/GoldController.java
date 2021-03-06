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
@RequestMapping("/gold")
public class GoldController {

    @Autowired
    GoldService goldService;
    @Autowired
    PayAccountService payAccountService;
    @Autowired
    MoneyService moneyService;

    /**
     * 查看我的金币
     * @param request
     * @return
     */
    @RequestMapping("/info")
    public String goldInfo(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        List<Goldhistory> goldHistoryListGet = new ArrayList<>();
        List<Goldhistory> goldHistoryListPut = new ArrayList<>();
        List<Goldhistory> goldHistoryListAll = goldService.getGoldHistoryListByUserId(nowUser.getUserid());

        if (goldHistoryListAll != null && goldHistoryListAll.size() > 0) {
            for (int i = 0; i < goldHistoryListAll.size(); i++) {
                if (goldHistoryListAll.get(i).getState() == 1) {
                    goldHistoryListGet.add(goldHistoryListAll.get(i));
                } else {
                    goldHistoryListPut.add(goldHistoryListAll.get(i));
                }
            }
        }
        Gold gold = goldService.getGold(nowUser.getUserid());
        model.addAttribute("goldHistoryListAll", goldHistoryListAll);
        model.addAttribute("goldHistoryListGet", goldHistoryListGet);
        model.addAttribute("goldHistoryListPut", goldHistoryListPut);
        model.addAttribute("gold", gold);
        return "gold_info";
    }

    /**
     * 通过支付宝充值我的金币
     * @param request
     * @return
     */
    @RequestMapping("/pay")
    public String goldPay(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        Payaccount payaccount=payAccountService.getPayAccoun();
        model.addAttribute("payAccount", payaccount);
        return "gold_pay";
    }

    /**
     * 支付宝充值确认充值金币、提交请求
     * @param request
     * @return
     */
    @RequestMapping("/dopay")
    public String goldDoPay(@RequestParam(value = "file", required = false)
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

        Goldadd goldadd = new Goldadd();
        goldadd.setUserid(userId);
        goldadd.setAddamount(payAmount);
        goldadd.setAddtime(TimeUtil.dateToString(new Date()));
        goldadd.setAddphoto(fileName);

        String result = "";
        result = goldService.addGoldadd(goldadd);
        if (result.equals("paygold_success")) {
            model.addAttribute("message", "充值请求提交成功，管理员将在24小时内处理，请等待！");
            return "pageuser_success";
        } else{
            model.addAttribute("message", "金币充值失败，请稍后再试！");
            return "page_400";
        }
    }

    /**
     * 通过余额充值我的金币
     * @param request
     * @return
     */
    @RequestMapping("/paybymoney")
    public String goldPayByMoney(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        Money money = moneyService.getMoney(nowUser.getUserid());
        model.addAttribute("money", money);
        return "gold_pay_bymoney";
    }

    /**
     * 确认充值，通过余额充值我的金币
     * @param request
     * @return
     */
    @RequestMapping("/dopaybymoney")
    public String goldDoPayByMoney(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        int userId = nowUser.getUserid();
        int payAmount = Integer.parseInt(request.getParameter("pay"));

        Goldadd goldadd = new Goldadd();
        goldadd.setUserid(userId);
        goldadd.setAddamount(payAmount);
        goldadd.setAddtime(TimeUtil.dateToString(new Date()));

        String result = "";
        result = goldService.addPayGoldByMoney(goldadd);
        if (result.equals("pay_success")) {
            model.addAttribute("message", "充值请求提交成功，管理员将在24小时内处理，请等待！");
            return "pageuser_success";
        } else{
            model.addAttribute("message", "金币充值失败，请稍后再试！");
            return "page_400";
        }
    }

    /**
     * 金币提现为余额
     * @param request
     * @return
     */
    @RequestMapping("/tomoney")
    public String goldToMoney(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        Gold gold = goldService.getGold(nowUser.getUserid());
        model.addAttribute("gold", gold);
        return "gold_tomoney";
    }

    /**
     * 确认提现金币为余额
     * @param request
     * @return
     */
    @RequestMapping("/dotomoney")
    public String goldDoToMoney(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = UserSessionSetUtils.getNowUser(request);
        int userId = nowUser.getUserid();
        int amount = Integer.parseInt(request.getParameter("pay"));

        String result = "";
        result = goldService.goleToMoney(amount,userId);
        if (result.equals("get_success")) {
            model.addAttribute("message", "金币提现为余额成功，此次提现可得余额"+amount/10+"￥");
            return "pageuser_success";
        } else{
            model.addAttribute("message", "金币提现失败，请稍后再试！");
            return "page_400";
        }
    }

    /**
     * 每日签到金币
     * @param request
     * @return
     */
    @RequestMapping("/dosignin")
    public String goldDoSignIn(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        String result = "error";
        try {
            result = goldService.updateGoldSignIn(nowUser.getUserid());
        } catch (MyThrowException e) {
            e.printStackTrace();
        }
        if (result.equals("signin_success")) {
            model.addAttribute("message", "签到成功。每天首次签到可以获得金币喔！");
            return "pageuser_success";
        } else if (result.equals("signin_haved")) {
            model.addAttribute("message", "对不起，您今天已签到，不能重复签到！");
            return "page_400";
        }
        model.addAttribute("message", "对不起，签到失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 查看我的金币充值历史
     * @param request
     * @return
     */
    @RequestMapping("/payhistory")
    public String goldPayhistory(HttpServletRequest request,Model model) {
        if (!UserSessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        List<Goldadd> goldaddedList = goldService.getGoldaddedListByUserId(nowUser.getUserid());
        List<Goldadd> goldaddingList = goldService.getGoldaddingListByUserId(nowUser.getUserid());
        model.addAttribute("goldaddedList", goldaddedList);
        model.addAttribute("goldaddingList", goldaddingList);
        return "gold_addhistory";
    }

}
