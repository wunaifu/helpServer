package com.helpserver.pojo;

import java.io.Serializable;

public class Collectorder implements Serializable {
    /**
     * 收藏id
     */
    private Integer id;

    /**
     * 订单id
     */
    private Integer orderid;

    /**
     * 收藏者id
     */
    private Integer collectorid;

    /**
     * 收藏时间
     */
    private String collecttime;

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

    public Integer getCollectorid() {
        return collectorid;
    }

    public void setCollectorid(Integer collectorid) {
        this.collectorid = collectorid;
    }

    public String getCollecttime() {
        return collecttime;
    }

    public void setCollecttime(String collecttime) {
        this.collecttime = collecttime == null ? null : collecttime.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orderid=").append(orderid);
        sb.append(", collectorid=").append(collectorid);
        sb.append(", collecttime=").append(collecttime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}