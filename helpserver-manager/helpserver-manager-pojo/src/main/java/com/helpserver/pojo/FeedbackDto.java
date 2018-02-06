package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-01.
 */
public class FeedbackDto implements Serializable {
    User user;
    Feedback feedback;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    @Override
    public String toString() {
        return "FeedbackDto{" +
                "user=" + user +
                ", feedback=" + feedback +
                '}';
    }
}
