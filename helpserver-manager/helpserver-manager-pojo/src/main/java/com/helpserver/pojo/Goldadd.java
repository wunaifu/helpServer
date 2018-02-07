package com.helpserver.pojo;

import java.io.Serializable;

public class Goldadd implements Serializable {
    private Integer id;

    /**
     * 用户id
     */
    private Integer userid;

    /**
     * 充值数目
     */
    private Integer addamount;

    /**
     * 充值时间
     */
    private String addtime;

    /**
     * 支付宝充值截图
     */
    private String addphoto;

    /**
     * 到账时间
     */
    private String gettime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getAddamount() {
        return addamount;
    }

    public void setAddamount(Integer addamount) {
        this.addamount = addamount;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }

    public String getAddphoto() {
        return addphoto;
    }

    public void setAddphoto(String addphoto) {
        this.addphoto = addphoto == null ? null : addphoto.trim();
    }

    public String getGettime() {
        return gettime;
    }

    public void setGettime(String gettime) {
        this.gettime = gettime == null ? null : gettime.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userid=").append(userid);
        sb.append(", addamount=").append(addamount);
        sb.append(", addtime=").append(addtime);
        sb.append(", addphoto=").append(addphoto);
        sb.append(", gettime=").append(gettime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}