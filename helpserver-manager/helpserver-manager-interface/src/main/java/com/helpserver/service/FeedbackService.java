package com.helpserver.service;

import com.helpserver.pojo.Feedback;
import com.helpserver.pojo.FeedbackDto;
import com.helpserver.pojo.Identity;
import com.helpserver.pojo.UserInfoDto;

import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
public interface FeedbackService {

    String insertFeedback(Feedback feedback);

    String deleteFeedback(Feedback feedback);

    String updateFeedback(int id,String reply);

    List<Feedback> getFeedbackListByUserId(int userId);

    List<FeedbackDto> getFeedbackListByReplyTime(boolean isOrNotNull);
}
