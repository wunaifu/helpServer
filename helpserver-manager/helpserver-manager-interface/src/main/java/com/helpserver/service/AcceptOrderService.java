package com.helpserver.service;

import com.helpserver.pojo.*;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface AcceptOrderService {

    String insertAcceptOrder(Acceptorder acceptorder);

    String updateAcceptOrderStateUpdateTime(Acceptorder acceptorder);

    Acceptorder getAcceptorderById(int acceptId);

    List<AcceptOrderUserDto> getAcceptOrderUserDtoListByOrderId(int orderId);

    List<OrderAcceptDto> getOrderAcceptDtoListByUserId(int userId);

    List<OrderAcceptDto> getOrderAcceptDtoIngListByUserIdAndState(int userId,int state);

    List<OrderAcceptDto> getOrderAcceptDtoFinishListByUserIdAndState(int userId,int state);

    List<OrderAcceptDto> getOrderAcceptDtoListByOrderId(int orderId);

    List<OrderAcceptDto> getOrderAcceptDtoListByUserIdAndSearch(int userId,String search);

    List<OrderAcceptDto> getOrderAcceptDtoListByAcceptOrderList(List<Acceptorder> acceptOrderList);

    int checkIsOrNotComment(int acceptId,int userId);

    int updateDateStateByAcceptId(Acceptorder acceptorder);

    String updateDateStateAcceptList();
}
