package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-01.
 */
public class OrderAcceptDto implements Serializable {
    int senderId;
    String sendUserName;
    String sendUserIcon;
    String sendUserCredit;

    int orderId;
    String foodname;
    String orderdetail;
    String city;
    String address;
    String repealtime;
    int amount;
    int outamount;
    int moneyamount;

    String acceptUserName;
    String acceptUserIcon;
    String acceptUserCredit;

    Acceptorder acceptorder;
    //Orderinfo orderinfo;

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

    public String getSendUserCredit() {
        return sendUserCredit;
    }

    public void setSendUserCredit(String sendUserCredit) {
        this.sendUserCredit = sendUserCredit;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    public String getOrderdetail() {
        return orderdetail;
    }

    public void setOrderdetail(String orderdetail) {
        this.orderdetail = orderdetail;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRepealtime() {
        return repealtime;
    }

    public void setRepealtime(String repealtime) {
        this.repealtime = repealtime;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getOutamount() {
        return outamount;
    }

    public void setOutamount(int outamount) {
        this.outamount = outamount;
    }

    public int getMoneyamount() {
        return moneyamount;
    }

    public void setMoneyamount(int moneyamount) {
        this.moneyamount = moneyamount;
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

    public String getAcceptUserCredit() {
        return acceptUserCredit;
    }

    public void setAcceptUserCredit(String acceptUserCredit) {
        this.acceptUserCredit = acceptUserCredit;
    }

    public Acceptorder getAcceptorder() {
        return acceptorder;
    }

    public void setAcceptorder(Acceptorder acceptorder) {
        this.acceptorder = acceptorder;
    }
}
