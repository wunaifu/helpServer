package com.helpserver.pojo;

import java.io.Serializable;

public class User implements Serializable {
    /**
     * id，自动增长
     */
    private Integer userid;

    /**
     * 手机（登录账号）
     */
    private String phone;

    /**
     * 密码
     */
    private String password;

    /**
     * 姓名
     */
    private String name;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 联系地址
     */
    private String address;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别（0女，1男）
     */
    private Integer sex;

    /**
     * 简介
     */
    private String userinfo;

    /**
     * 头像
     */
    private String headicon;

    /**
     * 注册时间
     */
    private String registertime;

    /**
     * 禁用时间
     */
    private String bantime;

    /**
     * 支付账号
     */
    private String payaccount;

    /**
     * 权限（0普通用户，1可接单用户，2被禁用用户）
     */
    private Integer permission;

    private static final long serialVersionUID = 1L;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getUserinfo() {
        return userinfo;
    }

    public void setUserinfo(String userinfo) {
        this.userinfo = userinfo == null ? null : userinfo.trim();
    }

    public String getHeadicon() {
        return headicon;
    }

    public void setHeadicon(String headicon) {
        this.headicon = headicon == null ? null : headicon.trim();
    }

    public String getRegistertime() {
        return registertime;
    }

    public void setRegistertime(String registertime) {
        this.registertime = registertime == null ? null : registertime.trim();
    }

    public String getBantime() {
        return bantime;
    }

    public void setBantime(String bantime) {
        this.bantime = bantime == null ? null : bantime.trim();
    }

    public String getPayaccount() {
        return payaccount;
    }

    public void setPayaccount(String payaccount) {
        this.payaccount = payaccount == null ? null : payaccount.trim();
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userid=").append(userid);
        sb.append(", phone=").append(phone);
        sb.append(", password=").append(password);
        sb.append(", name=").append(name);
        sb.append(", nickname=").append(nickname);
        sb.append(", address=").append(address);
        sb.append(", age=").append(age);
        sb.append(", sex=").append(sex);
        sb.append(", userinfo=").append(userinfo);
        sb.append(", headicon=").append(headicon);
        sb.append(", registertime=").append(registertime);
        sb.append(", bantime=").append(bantime);
        sb.append(", payaccount=").append(payaccount);
        sb.append(", permission=").append(permission);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}