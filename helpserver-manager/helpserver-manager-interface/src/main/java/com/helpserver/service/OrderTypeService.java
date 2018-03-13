package com.helpserver.service;

import com.helpserver.pojo.News;
import com.helpserver.pojo.Order;
import com.helpserver.pojo.Ordertype;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface OrderTypeService {

    String insertOrderType(Ordertype orderType);

    String updateOrderType(Ordertype orderType);

    String deleteOrderTypeById(int id);

    Ordertype getOrderTypeById(int id);

    List<Ordertype> getOrdertypeList();
}
