package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.Gold;
import com.helpserver.pojo.Goldhistory;
import com.helpserver.pojo.User;
import com.helpserver.service.GoldService;
import com.helpserver.service.UserService;
import com.helpserver.utils.SessionSetUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
@RequestMapping("/gold")
public class GoldController {

    @Autowired
    GoldService goldService;

    /**
     * 查看我的金币
     * @param request
     * @return
     */
    @RequestMapping("/info")
    public String goldInfo(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isUserLogin(request)) {
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

}
