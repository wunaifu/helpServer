package com.helpserver.service;

import com.helpserver.pojo.*;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface OrderService {

    String insertOrder(Orderinfo orderinfo);

    String updateReUploadOrder(Orderinfo orderinfo);

    String updateOrder(Orderinfo orderinfo);

    String updateDownloadOrder(Orderinfo orderinfo);

    String updateAgreeAcceptAndOrder(Acceptorder acceptorder, Orderinfo orderinfo);

    String updateReturnGoods(int acceptId);

    String updateOrderPutMoney(int acceptId);

    String updateDisagreeAccept(Acceptorder acceptorder,Orderinfo orderinfo);

    String deleteOrderById(int id);

    Orderinfo getOrderById(int id);

    List<OrderUserDto> getOrderUserDtoList(int state1,int state2);

    List<OrderUserDto> getOrderUserDtoListByState(int state2);

    List<OrderUserDto> getOrderUserDtoListByStateAndCity(int state,String city);

    List<OrderUserDto> getOrderUserDtoListByStateAndSearch(int state,String search);

    List<OrderUserDto> getOrderUserDtoListByStateAndSendUserId(int state,int userId);

    List<OrderUserDto> getOrderUserDtoListBySendUserId(int userId);

    List<OrderUserDto> getOrderUserDtoListBySendUserIdAndSearch(int userId, String search);

    List<OrderUserDto> getOrderUserDtoListByOrderList(List<Orderinfo> orderList);

    public OrderUserDto getOrderUserDtoByOrder(Orderinfo order);

    public OrderUserDto getOrderUserDtoByOrderId(int orderId);

    public List<AcceptOrderUserDto> getAcceptOrderUserDtoListByOrderId(Orderinfo order);

    String insertMyAcceptOrderComment(Ordercomment ordercomment);

    String insertMySendOrderComment(Ordercomment ordercomment);

    boolean checkDoubleComment(Ordercomment ordercomment);

    int checkIsOrNotComment(int acceptId,int userId);

    List<Ordercomment> getOrderCommentListByOrderId(int orderId);
}
