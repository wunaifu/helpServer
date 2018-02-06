package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.Feedback;
import com.helpserver.pojo.User;
import com.helpserver.service.FeedbackService;
import com.helpserver.service.UserService;
import com.helpserver.utils.SessionSetUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
public class FeedbackController {

    @Autowired
    UserService userService;
    @Autowired
    FeedbackService feedbackService;

    /**
     * 添加反馈信息
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/user/insertFeedback")
    public String insertFeedback(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        String content = request.getParameter("opinionContent");
        Feedback feedback = new Feedback();
        feedback.setUserid(nowUser.getUserid());
        feedback.setFeedbackinfo(content);
        feedback.setFeedbacktime(TimeUtil.dateToString(new Date()));
        String result = feedbackService.insertFeedback(feedback);
        if (result.equals("insert_success")) {
            model.addAttribute("message", "反馈信息提交成功，管理员马上处理！");
            return "page_success";
        }
        model.addAttribute("message", "反馈信息提交失败，请稍后再试！");
        return "page_400";
    }

    @RequestMapping("/user/feedback")
    public String feedback(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_feedback";
    }

    @RequestMapping("/user/feedbacklist")
    public String feedbacklist(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        List<Feedback> feedbackList = feedbackService.getFeedbackListByUserId(nowUser.getUserid());
        model.addAttribute("feedbackList", feedbackList);
        return "user_feedbacklist";
    }

}
