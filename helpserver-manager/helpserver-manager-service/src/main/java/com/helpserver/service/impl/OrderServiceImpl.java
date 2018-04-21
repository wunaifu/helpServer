package com.helpserver.service.impl;

import com.helpserver.dao.BigtypeDao;
import com.helpserver.dao.OrderinfoDao;
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
    OrderinfoDao orderDao;
    @Autowired
    BigtypeDao bigtypeDao;
    @Autowired
    OrdertypeDao orderTypeDao;

    @Override
    public String insertOrder(Orderinfo order) {
        if (orderDao.insertSelective(order) == 1) {
            return "insert_success";
        }
        return "insert_failure";
    }

    @Override
    public String deleteOrderById(int id) {
        if (orderDao.deleteByPrimaryKey(id) == 1) {
            return "del_success";
        }
        return "del_failure";
    }

    @Override
    public Orderinfo getOrderById(int id) {
        return orderDao.selectByPrimaryKey(id);
    }

    @Override
    public List<Orderinfo> getOrderList() {
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
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andOrderstateBetween(state1,state2);
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
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
        OrderinfoExample orderExample = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = orderExample.createCriteria();
        criteria.andOrderstateEqualTo(state);
        orderExample.setOrderByClause("sendTime desc");
        List<Orderinfo> orderList = orderDao.selectByExample(orderExample);
        System.out.println(orderList.toString());
        List<OrderUserDto> orderUserDtoList = this.getOrderUserDtoListByOrderList(orderList);
        return orderUserDtoList;
    }

    /**
     * 通过orderList获取所有订单的详情列表
     * @param orderList
     * @return
     */
    @Override
    public List<OrderUserDto> getOrderUserDtoListByOrderList(List<Orderinfo> orderList) {
        List<OrderUserDto> orderUserDtoList = new ArrayList<>();
        if (orderList.size() > 0) {
            for (Orderinfo order : orderList) {
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

    /**
     * 通过order获取订单的详情
     * @param order
     * @return
     */
    @Override
    public OrderUserDto getOrderUserDtoByOrder(Orderinfo order) {
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
        return orderUserDto;
    }

    /**
     * 通过orderId获取订单详情
     * @param orderId
     * @return
     */
    @Override
    public OrderUserDto getOrderUserDtoByOrderId(int orderId) {
        Orderinfo orderinfo = orderDao.selectByPrimaryKey(orderId);
        return this.getOrderUserDtoByOrder(orderinfo);
    }
}
