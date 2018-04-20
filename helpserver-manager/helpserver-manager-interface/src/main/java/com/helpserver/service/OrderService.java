package com.helpserver.service;

import com.helpserver.pojo.News;
import com.helpserver.pojo.Order;
import com.helpserver.pojo.OrderUserDto;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface OrderService {

    String insertOrder(Order news);

    String deleteOrderById(int id);

    Order getOrderById(int id);

    List<Order> getOrderList();

    List<OrderUserDto> getOrderUserDtoList(int state1,int state2);

    List<OrderUserDto> getOrderUserDtoListByState(int state2);

    List<OrderUserDto> getOrderUserDtoListByOrderList(List<Order> orderList);
}
