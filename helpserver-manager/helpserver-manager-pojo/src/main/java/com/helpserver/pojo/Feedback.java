package com.helpserver.pojo;

import java.io.Serializable;

public class Feedback implements Serializable {
    /**
     * 反馈表id
     */
    private Integer feedbackid;

    /**
     * 反馈用户id
     */
    private Integer userid;

    /**
     * 反馈信息
     */
    private String feedbackinfo;

    /**
     * 反馈时间
     */
    private String feedbacktime;

    /**
     * 管理员回复
     */
    private String reply;

    /**
     * 回复时间
     */
    private String replytime;

    private static final long serialVersionUID = 1L;

    public Integer getFeedbackid() {
        return feedbackid;
    }

    public void setFeedbackid(Integer feedbackid) {
        this.feedbackid = feedbackid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getFeedbackinfo() {
        return feedbackinfo;
    }

    public void setFeedbackinfo(String feedbackinfo) {
        this.feedbackinfo = feedbackinfo == null ? null : feedbackinfo.trim();
    }

    public String getFeedbacktime() {
        return feedbacktime;
    }

    public void setFeedbacktime(String feedbacktime) {
        this.feedbacktime = feedbacktime == null ? null : feedbacktime.trim();
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply == null ? null : reply.trim();
    }

    public String getReplytime() {
        return replytime;
    }

    public void setReplytime(String replytime) {
        this.replytime = replytime == null ? null : replytime.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", feedbackid=").append(feedbackid);
        sb.append(", userid=").append(userid);
        sb.append(", feedbackinfo=").append(feedbackinfo);
        sb.append(", feedbacktime=").append(feedbacktime);
        sb.append(", reply=").append(reply);
        sb.append(", replytime=").append(replytime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}