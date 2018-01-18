package com.helpserver.pojo;

import java.io.Serializable;

public class Ordertype implements Serializable {
    /**
     * 类型id
     */
    private Integer ordertypeid;

    /**
     * 类型标志（1.2.3）
     */
    private Integer type;

    /**
     * 类型名称
     */
    private String typename;

    private static final long serialVersionUID = 1L;

    public Integer getOrdertypeid() {
        return ordertypeid;
    }

    public void setOrdertypeid(Integer ordertypeid) {
        this.ordertypeid = ordertypeid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", ordertypeid=").append(ordertypeid);
        sb.append(", type=").append(type);
        sb.append(", typename=").append(typename);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}