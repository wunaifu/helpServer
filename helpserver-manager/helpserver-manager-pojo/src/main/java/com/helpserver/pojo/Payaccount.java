package com.helpserver.pojo;

import java.io.Serializable;

public class Payaccount implements Serializable {
    private Integer id;

    /**
     * 更新时间
     */
    private String time;

    /**
     * 收款码
     */
    private String payphoto;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public String getPayphoto() {
        return payphoto;
    }

    public void setPayphoto(String payphoto) {
        this.payphoto = payphoto == null ? null : payphoto.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", time=").append(time);
        sb.append(", payphoto=").append(payphoto);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}