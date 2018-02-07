package com.helpserver.controller;

import com.helpserver.pojo.Feedback;
import com.helpserver.pojo.FeedbackDto;
import com.helpserver.pojo.User;
import com.helpserver.service.FeedbackService;
import com.helpserver.service.UserService;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.SessionSetUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/13.
 */
@Controller
public class FeedbackController {

    @Autowired
    UserService userService;
    @Autowired
    FeedbackService feedbackService;


    /**
     * 处理反馈信息，回复
     * @param request
     * @return
     */
//    @RequestMapping("/feedback/dispose/{id}/{reply}")
    @RequestMapping("/feedback/dispose")
    public void disposeFeedback(//@PathVariable("id") int id,@PathVariable("reply") String reply,
            HttpServletRequest request,HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        String reply = request.getParameter("reply");
        try {
            reply = URLDecoder.decode(reply, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String result = feedbackService.updateFeedback(id, reply);
        ResponseUtils.renderJson(response, result);
    }

    /**
     * 查看未处理反馈列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/feedback/undisposelist")
    public String undisposelist(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<FeedbackDto> feedbackDtoList = feedbackService.getFeedbackListByReplyTime(true);
        model.addAttribute("feedbackDtoList", feedbackDtoList);
        return "feedback_undispose_list";
    }

    /**
     * 查看历史反馈列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/feedback/disposelist")
    public String disposelist(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<FeedbackDto> feedbackDtoList = feedbackService.getFeedbackListByReplyTime(false);
        model.addAttribute("feedbackDtoList", feedbackDtoList);
        return "feedback_dispose_list";
    }
}
