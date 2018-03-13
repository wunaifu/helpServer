package com.helpserver.service.impl;

import com.helpserver.dao.OrderDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.News;
import com.helpserver.pojo.Order;
import com.helpserver.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/06.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    UserDao newsDao;
    @Autowired
    OrderDao orderDao;

    @Override
    public String insertOrder(Order news) {
        return null;
    }

    @Override
    public String deleteOrderById(int id) {
        return null;
    }

    @Override
    public News getOrderById(int id) {
        return null;
    }

    @Override
    public List<Order> getOrderList() {
        return null;
    }
}
