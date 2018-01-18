package com.helpserver.pojo;

import java.io.Serializable;

public class Acceptorder implements Serializable {
    /**
     * 接单表id
     */
    private Integer acceptorderid;

    /**
     * 接单者id
     */
    private Integer accepterid;

    /**
     * 订单id
     */
    private Integer orderid;

    /**
     * 接单时间
     */
    private String accepttime;

    /**
     * 退单理由
     */
    private String backreason;

    /**
     * 退单时间（为空未取消，不空接单中）
     */
    private String backtime;

    /**
     * 状态（1接单，0取消，2已完成，3发布方取消）
     */
    private Integer acceptstate;

    private static final long serialVersionUID = 1L;

    public Integer getAcceptorderid() {
        return acceptorderid;
    }

    public void setAcceptorderid(Integer acceptorderid) {
        this.acceptorderid = acceptorderid;
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

    public String getAccepttime() {
        return accepttime;
    }

    public void setAccepttime(String accepttime) {
        this.accepttime = accepttime == null ? null : accepttime.trim();
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

    public Integer getAcceptstate() {
        return acceptstate;
    }

    public void setAcceptstate(Integer acceptstate) {
        this.acceptstate = acceptstate;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", acceptorderid=").append(acceptorderid);
        sb.append(", accepterid=").append(accepterid);
        sb.append(", orderid=").append(orderid);
        sb.append(", accepttime=").append(accepttime);
        sb.append(", backreason=").append(backreason);
        sb.append(", backtime=").append(backtime);
        sb.append(", acceptstate=").append(acceptstate);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}