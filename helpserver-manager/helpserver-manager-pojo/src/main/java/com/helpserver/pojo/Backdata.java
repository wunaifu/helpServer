package com.helpserver.pojo;

import java.io.Serializable;

public class Backdata implements Serializable {
    /**
     * id
     */
    private Integer id;

    /**
     * 总赚取的服务费
     */
    private Integer allmoney;

    /**
     * 总注册人数
     */
    private Integer allmen;

    /**
     * 总租借成交数
     */
    private Integer allorders;

    /**
     * 统计年份
     */
    private Integer year;

    /**
     * 统计月份
     */
    private Integer month;

    /**
     * 统计月份赚取的服务费
     */
    private Integer monthmoney;

    /**
     * 月注册人数
     */
    private Integer monthmen;

    /**
     * 月租借成交数
     */
    private Integer monthorders;

    /**
     * 统计时间
     */
    private String time;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAllmoney() {
        return allmoney;
    }

    public void setAllmoney(Integer allmoney) {
        this.allmoney = allmoney;
    }

    public Integer getAllmen() {
        return allmen;
    }

    public void setAllmen(Integer allmen) {
        this.allmen = allmen;
    }

    public Integer getAllorders() {
        return allorders;
    }

    public void setAllorders(Integer allorders) {
        this.allorders = allorders;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getMonthmoney() {
        return monthmoney;
    }

    public void setMonthmoney(Integer monthmoney) {
        this.monthmoney = monthmoney;
    }

    public Integer getMonthmen() {
        return monthmen;
    }

    public void setMonthmen(Integer monthmen) {
        this.monthmen = monthmen;
    }

    public Integer getMonthorders() {
        return monthorders;
    }

    public void setMonthorders(Integer monthorders) {
        this.monthorders = monthorders;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", allmoney=").append(allmoney);
        sb.append(", allmen=").append(allmen);
        sb.append(", allorders=").append(allorders);
        sb.append(", year=").append(year);
        sb.append(", month=").append(month);
        sb.append(", monthmoney=").append(monthmoney);
        sb.append(", monthmen=").append(monthmen);
        sb.append(", monthorders=").append(monthorders);
        sb.append(", time=").append(time);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}