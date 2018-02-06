package com.helpserver.service.impl;

import com.helpserver.dao.FeedbackDao;
import com.helpserver.dao.IdentityDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.*;
import com.helpserver.service.FeedbackService;
import com.helpserver.service.IdentityService;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    UserDao userDao;
    @Autowired
    FeedbackDao feedbackDao;


    @Override
    public String insertFeedback(Feedback feedback) {
        if (feedbackDao.insertSelective(feedback) == 1) {
            return "insert_success";
        }
        return "insert_error";
    }

    @Override
    public String deleteFeedback(Feedback feedback) {
        return null;
    }

    /**
     * 更新回复
     * @param id
     * @param reply
     * @return
     */
    @Override
    public String updateFeedback(int id, String reply) {
        Feedback feedback = new Feedback();
        feedback.setFeedbackid(id);
        feedback.setReply(reply);
        feedback.setReplytime(TimeUtil.dateToString(new Date()));
        if (feedbackDao.updateByPrimaryKeySelective(feedback) == 1) {
            return "update_success";
        }
        return "update_error";
    }

    @Override
    public List<Feedback> getFeedbackListByUserId(int userId) {
        FeedbackExample feedbackExample = new FeedbackExample();
        FeedbackExample.Criteria criteria = feedbackExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        feedbackExample.setOrderByClause("replytime desc");
        feedbackExample.setOrderByClause("feedbacktime desc");
        return feedbackDao.selectByExample(feedbackExample);
    }

    @Override
    public List<FeedbackDto> getFeedbackListByReplyTime(boolean isOrNotNull) {
        FeedbackExample feedbackExample = new FeedbackExample();
        FeedbackExample.Criteria criteria = feedbackExample.createCriteria();
        if (isOrNotNull == true) {
            criteria.andReplyIsNull();
        } else {
            criteria.andReplyIsNotNull();
        }
        feedbackExample.setOrderByClause("replytime desc");
        feedbackExample.setOrderByClause("feedbacktime desc");
        List<Feedback> feedbackList=feedbackDao.selectByExample(feedbackExample);
        List<FeedbackDto> feedbackDtos = new ArrayList<>();
        if (feedbackList != null&&feedbackList.size()>0) {
            for (int i = 0; i < feedbackList.size(); i++) {
                FeedbackDto feedbackDto = new FeedbackDto();
                User user = userDao.selectByPrimaryKey(feedbackList.get(i).getUserid());
                feedbackDto.setFeedback(feedbackList.get(i));
                feedbackDto.setUser(user);
                feedbackDtos.add(feedbackDto);
            }
        }

        return feedbackDtos;
    }
}
