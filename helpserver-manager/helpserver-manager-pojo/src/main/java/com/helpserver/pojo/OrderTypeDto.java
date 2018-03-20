package com.helpserver.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2018-03-19.
 */
public class OrderTypeDto implements Serializable {

    private Bigtype bigtype;
    private List<Ordertype> ordertypeList;

    public Bigtype getBigtype() {
        return bigtype;
    }

    public void setBigtype(Bigtype bigtype) {
        this.bigtype = bigtype;
    }

    public List<Ordertype> getOrdertypeList() {
        return ordertypeList;
    }

    public void setOrdertypeList(List<Ordertype> ordertypeList) {
        this.ordertypeList = ordertypeList;
    }

    @Override
    public String toString() {
        return "OrderTypeDto{" +
                "bigtype=" + bigtype +
                ", ordertypeList=" + ordertypeList +
                '}';
    }
}
