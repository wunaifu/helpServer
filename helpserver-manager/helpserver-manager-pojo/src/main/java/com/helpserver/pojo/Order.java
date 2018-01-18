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
     * 标题
     */
    private String title;

    /**
     * 佣金
     */
    private Integer commission;

    /**
     * 需求人数
     */
    private Integer menaccount;

    /**
     * 服务具体时间
     */
    private String detailtime;

    /**
     * 预计耗时
     */
    private String expendtime;

    /**
     * 服务详情
     */
    private String serverinfo;

    /**
     * 所在区域（省市县）
     */
    private String area;

    /**
     * 起点（街道）
     */
    private String startpoint;

    /**
     * 终点（街道）
     */
    private String endpoint;

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
     * 订单状态（0草稿，1发布进行1中，2已结束，3已取消、4管理员禁止该订单）
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getCommission() {
        return commission;
    }

    public void setCommission(Integer commission) {
        this.commission = commission;
    }

    public Integer getMenaccount() {
        return menaccount;
    }

    public void setMenaccount(Integer menaccount) {
        this.menaccount = menaccount;
    }

    public String getDetailtime() {
        return detailtime;
    }

    public void setDetailtime(String detailtime) {
        this.detailtime = detailtime == null ? null : detailtime.trim();
    }

    public String getExpendtime() {
        return expendtime;
    }

    public void setExpendtime(String expendtime) {
        this.expendtime = expendtime == null ? null : expendtime.trim();
    }

    public String getServerinfo() {
        return serverinfo;
    }

    public void setServerinfo(String serverinfo) {
        this.serverinfo = serverinfo == null ? null : serverinfo.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getStartpoint() {
        return startpoint;
    }

    public void setStartpoint(String startpoint) {
        this.startpoint = startpoint == null ? null : startpoint.trim();
    }

    public String getEndpoint() {
        return endpoint;
    }

    public void setEndpoint(String endpoint) {
        this.endpoint = endpoint == null ? null : endpoint.trim();
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", orderid=").append(orderid);
        sb.append(", senderid=").append(senderid);
        sb.append(", typeid=").append(typeid);
        sb.append(", title=").append(title);
        sb.append(", commission=").append(commission);
        sb.append(", menaccount=").append(menaccount);
        sb.append(", detailtime=").append(detailtime);
        sb.append(", expendtime=").append(expendtime);
        sb.append(", serverinfo=").append(serverinfo);
        sb.append(", area=").append(area);
        sb.append(", startpoint=").append(startpoint);
        sb.append(", endpoint=").append(endpoint);
        sb.append(", sendtime=").append(sendtime);
        sb.append(", repealtime=").append(repealtime);
        sb.append(", repealreason=").append(repealreason);
        sb.append(", orderstate=").append(orderstate);
        sb.append(", callname=").append(callname);
        sb.append(", callphone=").append(callphone);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}