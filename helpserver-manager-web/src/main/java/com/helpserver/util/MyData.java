package com.helpserver.util;

import java.util.List;

/**
 * Created by wnf on 2017-12-28.
 */
public class MyData<T> {

    private int state;

    private List<T> dataList; //要显示的数据

    public MyData(int state, List<T> dataList) {
        this.state = state;
        this.dataList = dataList;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    @Override
    public String toString() {
        return "MyData{" +
                "state=" + state +
                ", dataList=" + dataList +
                '}';
    }
}
