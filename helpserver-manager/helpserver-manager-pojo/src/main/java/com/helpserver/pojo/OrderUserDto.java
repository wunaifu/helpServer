package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-01.
 */
public class OrderUserDto implements Serializable {
    int senderId;
    String senderName;
    String orderTypeName;
    String bigTypeName;
    Orderinfo order;

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getOrderTypeName() {
        return orderTypeName;
    }

    public void setOrderTypeName(String orderTypeName) {
        this.orderTypeName = orderTypeName;
    }

    public String getBigTypeName() {
        return bigTypeName;
    }

    public void setBigTypeName(String bigTypeName) {
        this.bigTypeName = bigTypeName;
    }

    public Orderinfo getOrder() {
        return order;
    }

    public void setOrder(Orderinfo order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "OrderUserDto{" +
                "senderId=" + senderId +
                ", senderName='" + senderName + '\'' +
                ", orderTypeName='" + orderTypeName + '\'' +
                ", bigTypeName='" + bigTypeName + '\'' +
                ", order=" + order +
                '}';
    }
}
