package com.helpserver.service;

import com.helpserver.pojo.News;
import com.helpserver.pojo.Order;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface OrderService {

    String insertOrder(Order news);

    String deleteOrderById(int id);

    News getOrderById(int id);

    List<Order> getOrderList();
}
