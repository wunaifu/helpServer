package com.helpserver.pojo;

import java.io.Serializable;

public class Moneyget implements Serializable {
    /**
     * 余额提现id，自增长
     */
    private Integer id;

    /**
     * 用户id
     */
    private Integer userid;

    /**
     * 提现数目
     */
    private Integer amount;

    /**
     * 请求时间
     */
    private String time;

    /**
     * 提现支付宝号
     */
    private String payaccount;

    /**
     * 真实姓名
     */
    private String accountname;

    /**
     * 后台审核时间
     */
    private String gettime;

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

    public String getPayaccount() {
        return payaccount;
    }

    public void setPayaccount(String payaccount) {
        this.payaccount = payaccount == null ? null : payaccount.trim();
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname == null ? null : accountname.trim();
    }

    public String getGettime() {
        return gettime;
    }

    public void setGettime(String gettime) {
        this.gettime = gettime == null ? null : gettime.trim();
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
        sb.append(", payaccount=").append(payaccount);
        sb.append(", accountname=").append(accountname);
        sb.append(", gettime=").append(gettime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}