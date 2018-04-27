package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-01.
 */
public class OrderAcceptDto implements Serializable {
    int senderId;
    String sendUserName;
    String sendUserIcon;

    String acceptUserName;
    String acceptUserIcon;

    Acceptorder acceptorder;
    Orderinfo orderinfo;

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public String getSendUserName() {
        return sendUserName;
    }

    public void setSendUserName(String sendUserName) {
        this.sendUserName = sendUserName;
    }

    public String getSendUserIcon() {
        return sendUserIcon;
    }

    public void setSendUserIcon(String sendUserIcon) {
        this.sendUserIcon = sendUserIcon;
    }

    public String getAcceptUserName() {
        return acceptUserName;
    }

    public void setAcceptUserName(String acceptUserName) {
        this.acceptUserName = acceptUserName;
    }

    public String getAcceptUserIcon() {
        return acceptUserIcon;
    }

    public void setAcceptUserIcon(String acceptUserIcon) {
        this.acceptUserIcon = acceptUserIcon;
    }

    public Acceptorder getAcceptorder() {
        return acceptorder;
    }

    public void setAcceptorder(Acceptorder acceptorder) {
        this.acceptorder = acceptorder;
    }

    public Orderinfo getOrderinfo() {
        return orderinfo;
    }

    public void setOrderinfo(Orderinfo orderinfo) {
        this.orderinfo = orderinfo;
    }
}
