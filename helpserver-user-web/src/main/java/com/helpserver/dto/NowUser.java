package com.helpserver.dto;

/**
 * Created by Administrator on 2018-01-29.
 */
public class NowUser {

    /**
     * id
     */
    private int userid;

    /**
     * 手机（登录账号）
     */
    private String phone;

    /**
     * 姓名
     */
    private String name;

    /**
     * 地点
     */
    private String location;

    /**
     * 资源地点
     */
    private String goodsLocation;
    /**
     * 资源地点lng
     */
    private String goodsLng;
    /**
     * 资源地点lat
     */
    private String goodsLat;

    /**
     * 权限（0普通用户，1可接单用户，2被禁用用户,-1管理员）
     */
    private int permission;

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public String getGoodsLocation() {
        return goodsLocation;
    }

    public void setGoodsLocation(String goodsLocation) {
        this.goodsLocation = goodsLocation;
    }

    public String getGoodsLng() {
        return goodsLng;
    }

    public void setGoodsLng(String goodsLng) {
        this.goodsLng = goodsLng;
    }

    public String getGoodsLat() {
        return goodsLat;
    }

    public void setGoodsLat(String goodsLat) {
        this.goodsLat = goodsLat;
    }
}
