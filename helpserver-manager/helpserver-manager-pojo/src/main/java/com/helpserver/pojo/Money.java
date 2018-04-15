package com.helpserver.pojo;

import java.io.Serializable;

public class Money implements Serializable {
    /**
     * 余额id，自增长
     */
    private Integer id;

    /**
     * 用户id
     */
    private Integer userid;

    /**
     * 账户余额
     */
    private Integer amount;

    /**
     * 时间
     */
    private String time;

    /**
     * 历史充值数目
     */
    private Integer payamount;

    /**
     * 历史提现数目
     */
    private Integer getamount;

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

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public Integer getPayamount() {
        return payamount;
    }

    public void setPayamount(Integer payamount) {
        this.payamount = payamount;
    }

    public Integer getGetamount() {
        return getamount;
    }

    public void setGetamount(Integer getamount) {
        this.getamount = getamount;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userid=").append(userid);
        sb.append(", amount=").append(amount);
        sb.append(", time=").append(time);
        sb.append(", payamount=").append(payamount);
        sb.append(", getamount=").append(getamount);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}