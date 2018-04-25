package com.helpserver.pojo;

import java.io.Serializable;

public class Acceptorder implements Serializable {
    /**
     * 接单表id
     */
    private Integer id;

    /**
     * 接单者id
     */
    private Integer accepterid;

    /**
     * 订单id
     */
    private Integer orderid;

    /**
     * 计费方式（0日租，1月租）
     */
    private Integer moneytype;

    /**
     * 周期内租金（日租金，月租金）
     */
    private Integer money;

    /**
     * 租用周期
     */
    private Integer number;

    /**
     * 提货方式（0自取，1邮寄）
     */
    private Integer gettype;

    /**
     * 状态（1抢单中，0取消，2接单中，3已完成，4发布方取消）
     */
    private Integer acceptstate;

    /**
     * 租用状态（1正常，0超期，2
     */
    private Integer datestate;

    /**
     * 退单理由
     */
    private String backreason;

    /**
     * 退单时间
     */
    private String backtime;

    /**
     * 抢单时间
     */
    private String accepttime;

    /**
     * 确认订单时间
     */
    private String suretime;

    /**
     * 订单完成时间
     */
    private String finishtime;

    /**
     * 状态更新时间
     */
    private String updatetime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAccepterid() {
        return accepterid;
    }

    public void setAccepterid(Integer accepterid) {
        this.accepterid = accepterid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getMoneytype() {
        return moneytype;
    }

    public void setMoneytype(Integer moneytype) {
        this.moneytype = moneytype;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getGettype() {
        return gettype;
    }

    public void setGettype(Integer gettype) {
        this.gettype = gettype;
    }

    public Integer getAcceptstate() {
        return acceptstate;
    }

    public void setAcceptstate(Integer acceptstate) {
        this.acceptstate = acceptstate;
    }

    public Integer getDatestate() {
        return datestate;
    }

    public void setDatestate(Integer datestate) {
        this.datestate = datestate;
    }

    public String getBackreason() {
        return backreason;
    }

    public void setBackreason(String backreason) {
        this.backreason = backreason == null ? null : backreason.trim();
    }

    public String getBacktime() {
        return backtime;
    }

    public void setBacktime(String backtime) {
        this.backtime = backtime == null ? null : backtime.trim();
    }

    public String getAccepttime() {
        return accepttime;
    }

    public void setAccepttime(String accepttime) {
        this.accepttime = accepttime == null ? null : accepttime.trim();
    }

    public String getSuretime() {
        return suretime;
    }

    public void setSuretime(String suretime) {
        this.suretime = suretime == null ? null : suretime.trim();
    }

    public String getFinishtime() {
        return finishtime;
    }

    public void setFinishtime(String finishtime) {
        this.finishtime = finishtime == null ? null : finishtime.trim();
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime == null ? null : updatetime.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", accepterid=").append(accepterid);
        sb.append(", orderid=").append(orderid);
        sb.append(", moneytype=").append(moneytype);
        sb.append(", money=").append(money);
        sb.append(", number=").append(number);
        sb.append(", gettype=").append(gettype);
        sb.append(", acceptstate=").append(acceptstate);
        sb.append(", datestate=").append(datestate);
        sb.append(", backreason=").append(backreason);
        sb.append(", backtime=").append(backtime);
        sb.append(", accepttime=").append(accepttime);
        sb.append(", suretime=").append(suretime);
        sb.append(", finishtime=").append(finishtime);
        sb.append(", updatetime=").append(updatetime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}