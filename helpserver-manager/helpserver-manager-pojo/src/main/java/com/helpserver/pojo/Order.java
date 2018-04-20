package com.helpserver.pojo;

import java.io.Serializable;

public class Order implements Serializable {
    /**
     * id
     */
    private Integer orderid;

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
    private Integer money;

    /**
     * 资源名字
     */
    private String name;

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
    private String detail;

    /**
     * 所在区域（省市县）
     */
    private String area;

    /**
     * 详细坐标
     */
    private String point;

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

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
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

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point == null ? null : point.trim();
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
        sb.append(", orderid=").append(orderid);
        sb.append(", senderid=").append(senderid);
        sb.append(", typeid=").append(typeid);
        sb.append(", money=").append(money);
        sb.append(", name=").append(name);
        sb.append(", starttime=").append(starttime);
        sb.append(", endtime=").append(endtime);
        sb.append(", detail=").append(detail);
        sb.append(", area=").append(area);
        sb.append(", point=").append(point);
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