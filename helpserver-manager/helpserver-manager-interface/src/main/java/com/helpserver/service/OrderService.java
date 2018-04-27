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

    List<OrderUserDto> getOrderUserDtoList(int state1,int state2);

    List<OrderUserDto> getOrderUserDtoListByState(int state2);

    List<OrderUserDto> getOrderUserDtoListByStateAndCity(int state,String city);

    List<OrderUserDto> getOrderUserDtoListByStateAndSearch(int state,String search);

    List<OrderUserDto> getOrderUserDtoListByStateAndSendUserId(int state,int userId);

    List<OrderUserDto> getOrderUserDtoListBySendUserId(int userId);

    List<OrderUserDto> getOrderUserDtoListByOrderList(List<Orderinfo> orderList);

    public OrderUserDto getOrderUserDtoByOrder(Orderinfo order);

    public OrderUserDto getOrderUserDtoByOrderId(int orderId);

    public List<AcceptOrderUserDto> getAcceptOrderUserDtoListByOrderId(Orderinfo order);
}
