package com.helpserver.pojo;

import java.io.Serializable;

public class Identity implements Serializable {
    private Integer id;

    /**
     * 用户id
     */
    private Integer userid;

    /**
     * 身份证正面
     */
    private String frontphoto;

    /**
     * 身份证反面
     */
    private String backphoto;

    /**
     * 请求时间
     */
    private String asktime;

    /**
     * 验证时间（通过或失败时间）
     */
    private String checktime;

    /**
     * 失败原因
     */
    private String failurereason;

    /**
     * 验证状态（0请求验证，1已通过）
     */
    private Integer checkstate;

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

    public String getFrontphoto() {
        return frontphoto;
    }

    public void setFrontphoto(String frontphoto) {
        this.frontphoto = frontphoto == null ? null : frontphoto.trim();
    }

    public String getBackphoto() {
        return backphoto;
    }

    public void setBackphoto(String backphoto) {
        this.backphoto = backphoto == null ? null : backphoto.trim();
    }

    public String getAsktime() {
        return asktime;
    }

    public void setAsktime(String asktime) {
        this.asktime = asktime == null ? null : asktime.trim();
    }

    public String getChecktime() {
        return checktime;
    }

    public void setChecktime(String checktime) {
        this.checktime = checktime == null ? null : checktime.trim();
    }

    public String getFailurereason() {
        return failurereason;
    }

    public void setFailurereason(String failurereason) {
        this.failurereason = failurereason == null ? null : failurereason.trim();
    }

    public Integer getCheckstate() {
        return checkstate;
    }

    public void setCheckstate(Integer checkstate) {
        this.checkstate = checkstate;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userid=").append(userid);
        sb.append(", frontphoto=").append(frontphoto);
        sb.append(", backphoto=").append(backphoto);
        sb.append(", asktime=").append(asktime);
        sb.append(", checktime=").append(checktime);
        sb.append(", failurereason=").append(failurereason);
        sb.append(", checkstate=").append(checkstate);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}