package com.helpserver.pojo;

import java.io.Serializable;

public class Ordercomment implements Serializable {
    /**
     * 接单者评论发布者id
     */
    private Integer id;

    /**
     * 订单表id
     */
    private Integer orderid;

    /**
     * 评论者id
     */
    private Integer myid;

    /**
     * 被评论者id
     */
    private Integer hisid;

    /**
     * 评分（1-5）
     */
    private Integer score;

    /**
     * 评论
     */
    private String content;

    /**
     * 评论时间
     */
    private String time;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getMyid() {
        return myid;
    }

    public void setMyid(Integer myid) {
        this.myid = myid;
    }

    public Integer getHisid() {
        return hisid;
    }

    public void setHisid(Integer hisid) {
        this.hisid = hisid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orderid=").append(orderid);
        sb.append(", myid=").append(myid);
        sb.append(", hisid=").append(hisid);
        sb.append(", score=").append(score);
        sb.append(", content=").append(content);
        sb.append(", time=").append(time);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}