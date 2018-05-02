package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-01.
 */
public class AcceptOrderUserDto implements Serializable {
    int senderId;
    String sendUserName;
    String acceptUserName;
    String acceptUserIcon;
    String acceptUserCredit;
    String orderGoodsName;
    Acceptorder acceptorder;

    int isOrNotComment;

    public int getIsOrNotComment() {
        return isOrNotComment;
    }

    public void setIsOrNotComment(int isOrNotComment) {
        this.isOrNotComment = isOrNotComment;
    }

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

    public String getAcceptUserName() {
        return acceptUserName;
    }

    public void setAcceptUserName(String acceptUserName) {
        this.acceptUserName = acceptUserName;
    }

    public String getOrderGoodsName() {
        return orderGoodsName;
    }

    public void setOrderGoodsName(String orderGoodsName) {
        this.orderGoodsName = orderGoodsName;
    }

    public Acceptorder getAcceptorder() {
        return acceptorder;
    }

    public void setAcceptorder(Acceptorder acceptorder) {
        this.acceptorder = acceptorder;
    }

    public String getAcceptUserIcon() {
        return acceptUserIcon;
    }

    public void setAcceptUserIcon(String acceptUserIcon) {
        this.acceptUserIcon = acceptUserIcon;
    }

    public String getAcceptUserCredit() {
        return acceptUserCredit;
    }

    public void setAcceptUserCredit(String acceptUserCredit) {
        this.acceptUserCredit = acceptUserCredit;
    }
}
