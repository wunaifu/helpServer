package com.helpserver.service;

import com.helpserver.pojo.AcceptOrderUserDto;
import com.helpserver.pojo.OrderUserDto;
import com.helpserver.pojo.Orderinfo;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/13.
 */
public interface AcceptOrderService {

    String insertOrder(Orderinfo orderinfo);

}
