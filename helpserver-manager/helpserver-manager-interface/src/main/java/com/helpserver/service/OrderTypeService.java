package com.helpserver.service;

import com.helpserver.pojo.*;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface OrderTypeService {

    String insertOrderType(Ordertype orderType);

    String insertBigType(Bigtype bigtype);

    String updateBigType(Bigtype bigtype);

    String updateOrderType(Ordertype orderType);

    String updateOrderTypeTypeById(Ordertype ordertype);

    Ordertype getOrderTypeById(int id);

    Bigtype getBigtypeById(int id);

    List<OrderTypeDto> getOrderTypeDtoList(int state);

    List<Bigtype> getBigTypeList();

    List<Ordertype> getOrdertypeList(int bigTypeId,int state);


    List<Ordertype> getOrdertypeListByState(int state);
}
