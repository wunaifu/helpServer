package com.helpserver.service.impl;

import com.helpserver.dao.BigtypeDao;
import com.helpserver.dao.OrderDao;
import com.helpserver.dao.OrdertypeDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.*;
import com.helpserver.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wunaifu on 2018/3/06.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    UserDao userDao;
    @Autowired
    OrderDao orderDao;
    @Autowired
    BigtypeDao bigtypeDao;
    @Autowired
    OrdertypeDao orderTypeDao;

    @Override
    public String insertOrder(Order news) {
        return null;
    }

    @Override
    public String deleteOrderById(int id) {
        return null;
    }

    @Override
    public Order getOrderById(int id) {
        return null;
    }

    @Override
    public List<Order> getOrderList() {
        return null;
    }

    /**
     * 两种状态的订单列表
     * @param state1
     * @param state2
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoList(int state1,int state2) {
        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();
//        criteria.andOrderstateBetween(state1,state2);
        orderExample.setOrderByClause("sendTime desc");
        List<Order> orderList = orderDao.selectByExample(orderExample);
        System.out.println(orderList.toString());
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }
    /**
     * 一种状态的订单列表
     * @param state
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListByState(int state) {
        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();
//        criteria.andOrderstateEqualTo(state);
        orderExample.setOrderByClause("sendTime desc");
        List<Order> orderList = orderDao.selectByExample(orderExample);
        System.out.println(orderList.toString());
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }

    /**
     * 通过orderList获取订单的详情
     * @param orderList
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListByOrderList(List<Order> orderList) {
        List<OrderUserDto> orderUserDtoList = new ArrayList<>();
        if (orderList.size() > 0) {
            for (Order order : orderList) {
                OrderUserDto orderUserDto = new OrderUserDto();
                User user = userDao.selectByPrimaryKey(order.getSenderid());
                Ordertype ordertype = orderTypeDao.selectByPrimaryKey(order.getTypeid());
                Bigtype bigtype = bigtypeDao.selectByPrimaryKey(ordertype.getBigtypeid());
                orderUserDto.setOrder(order);
                if (user != null) {
                    orderUserDto.setSenderName(user.getName());
                }
                if (ordertype != null) {
                    orderUserDto.setOrderTypeName(ordertype.getTypename());
                }
                if (bigtype != null) {
                    orderUserDto.setBigTypeName(bigtype.getTypename());
                }
                orderUserDtoList.add(orderUserDto);
            }
        }
        return orderUserDtoList;
    }
}
