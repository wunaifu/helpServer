package com.helpserver.service;

import com.helpserver.pojo.AcceptOrderUserDto;
import com.helpserver.pojo.OrderUserDto;
import com.helpserver.pojo.Orderinfo;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface OrderService {

    String insertOrder(Orderinfo orderinfo);

    String deleteOrderById(int id);

    Orderinfo getOrderById(int id);

    List<Orderinfo> getOrderList();

    List<OrderUserDto> getOrderUserDtoList(int state1,int state2);

    List<OrderUserDto> getOrderUserDtoListByState(int state2);

    List<OrderUserDto> getOrderUserDtoListByOrderList(List<Orderinfo> orderList);

    public OrderUserDto getOrderUserDtoByOrder(Orderinfo order);

    public OrderUserDto getOrderUserDtoByOrderId(int orderId);

    public List<AcceptOrderUserDto> getAcceptOrderUserDtoListByOrderId(Orderinfo order);
}
