package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-03-19.
 */
public class OrderTypeDto implements Serializable {

    private Bigtype bigtype;
    private Ordertype ordertype;

    public Bigtype getBigtype() {
        return bigtype;
    }

    public void setBigtype(Bigtype bigtype) {
        this.bigtype = bigtype;
    }

    public Ordertype getOrdertype() {
        return ordertype;
    }

    public void setOrdertype(Ordertype ordertype) {
        this.ordertype = ordertype;
    }

    @Override
    public String toString() {
        return "OrderTypeDto{" +
                "bigtype=" + bigtype +
                ", ordertype=" + ordertype +
                '}';
    }
}
