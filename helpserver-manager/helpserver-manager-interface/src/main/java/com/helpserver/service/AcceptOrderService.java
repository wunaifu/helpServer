package com.helpserver.service;

import com.helpserver.pojo.*;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface AcceptOrderService {

    String insertAcceptOrder(Acceptorder acceptorder);

    List<AcceptOrderUserDto> getAcceptOrderUserDtoListByOrderId(int orderId);

    List<OrderAcceptDto> getOrderAcceptDtoListByUserId(int userId);

    List<OrderAcceptDto> getOrderAcceptDtoListByOrderId(int orderId);

    List<OrderAcceptDto> getOrderAcceptDtoListByUserIdAndSearch(int userId,String search);

    List<OrderAcceptDto> getOrderAcceptDtoListByAcceptOrderList(List<Acceptorder> acceptOrderList);
}
