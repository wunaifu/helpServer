package com.helpserver.pojo;

import java.io.Serializable;

public class Gold implements Serializable {
    private Integer id;

    /**
     * 用户id
     */
    private Integer userid;

    /**
     * 金币数
     */
    private Integer goldamount;

    /**
     * 时间
     */
    private String time;

    /**
     * 签到（0未签，1已签，每日零点置为0）
     */
    private Integer state;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGoldamount() {
        return goldamount;
    }

    public void setGoldamount(Integer goldamount) {
        this.goldamount = goldamount;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userid=").append(userid);
        sb.append(", goldamount=").append(goldamount);
        sb.append(", time=").append(time);
        sb.append(", state=").append(state);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}