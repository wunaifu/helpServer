package com.helpserver.pojo;

import java.io.Serializable;

public class Orderinfo implements Serializable {
    /**
     * id
     */
    private Integer id;

    /**
     * 发布者id
     */
    private Integer senderid;

    /**
     * 发布类型id（零活、跑腿）
     */
    private Integer typeid;

    /**
     * 服务费用
     */
    private Integer moneyamount;

    /**
     * 资源名字
     */
    private String foodname;

    /**
     * 可使用开始时间
     */
    private String starttime;

    /**
     * 可使用结束时间
     */
    private String endtime;

    /**
     * 服务详情、备注
     */
    private String orderdetail;

    /**
     * 所在区域（省市县）
     */
    private String areainfo;

    /**
     * 详细坐标
     */
    private String pointinfo;

    /**
     * 发布时间
     */
    private String sendtime;

    /**
     * 撤单时间
     */
    private String repealtime;

    /**
     * 撤单原因
     */
    private String repealreason;

    /**
     * 订单状态（0草稿、1抢单进行中、2服务进行中、3已结束、4已取消、-1管理员禁止该订单
     */
    private Integer orderstate;

    /**
     * 联系人
     */
    private String callname;

    /**
     * 联系电话
     */
    private String callphone;

    /**
     * 浏览数
     */
    private Integer seeamount;

    /**
     * 资源图片
     */
    private String picture;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSenderid() {
        return senderid;
    }

    public void setSenderid(Integer senderid) {
        this.senderid = senderid;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getMoneyamount() {
        return moneyamount;
    }

    public void setMoneyamount(Integer moneyamount) {
        this.moneyamount = moneyamount;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname == null ? null : foodname.trim();
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime == null ? null : starttime.trim();
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime == null ? null : endtime.trim();
    }

    public String getOrderdetail() {
        return orderdetail;
    }

    public void setOrderdetail(String orderdetail) {
        this.orderdetail = orderdetail == null ? null : orderdetail.trim();
    }

    public String getAreainfo() {
        return areainfo;
    }

    public void setAreainfo(String areainfo) {
        this.areainfo = areainfo == null ? null : areainfo.trim();
    }

    public String getPointinfo() {
        return pointinfo;
    }

    public void setPointinfo(String pointinfo) {
        this.pointinfo = pointinfo == null ? null : pointinfo.trim();
    }

    public String getSendtime() {
        return sendtime;
    }

    public void setSendtime(String sendtime) {
        this.sendtime = sendtime == null ? null : sendtime.trim();
    }

    public String getRepealtime() {
        return repealtime;
    }

    public void setRepealtime(String repealtime) {
        this.repealtime = repealtime == null ? null : repealtime.trim();
    }

    public String getRepealreason() {
        return repealreason;
    }

    public void setRepealreason(String repealreason) {
        this.repealreason = repealreason == null ? null : repealreason.trim();
    }

    public Integer getOrderstate() {
        return orderstate;
    }

    public void setOrderstate(Integer orderstate) {
        this.orderstate = orderstate;
    }

    public String getCallname() {
        return callname;
    }

    public void setCallname(String callname) {
        this.callname = callname == null ? null : callname.trim();
    }

    public String getCallphone() {
        return callphone;
    }

    public void setCallphone(String callphone) {
        this.callphone = callphone == null ? null : callphone.trim();
    }

    public Integer getSeeamount() {
        return seeamount;
    }

    public void setSeeamount(Integer seeamount) {
        this.seeamount = seeamount;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", senderid=").append(senderid);
        sb.append(", typeid=").append(typeid);
        sb.append(", moneyamount=").append(moneyamount);
        sb.append(", foodname=").append(foodname);
        sb.append(", starttime=").append(starttime);
        sb.append(", endtime=").append(endtime);
        sb.append(", orderdetail=").append(orderdetail);
        sb.append(", areainfo=").append(areainfo);
        sb.append(", pointinfo=").append(pointinfo);
        sb.append(", sendtime=").append(sendtime);
        sb.append(", repealtime=").append(repealtime);
        sb.append(", repealreason=").append(repealreason);
        sb.append(", orderstate=").append(orderstate);
        sb.append(", callname=").append(callname);
        sb.append(", callphone=").append(callphone);
        sb.append(", seeamount=").append(seeamount);
        sb.append(", picture=").append(picture);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}