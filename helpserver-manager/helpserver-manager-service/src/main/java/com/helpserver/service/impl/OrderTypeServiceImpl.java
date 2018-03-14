package com.helpserver.service.impl;

import com.helpserver.dao.OrderDao;
import com.helpserver.dao.OrdertypeDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.News;
import com.helpserver.pojo.Order;
import com.helpserver.pojo.Ordertype;
import com.helpserver.pojo.OrdertypeExample;
import com.helpserver.service.OrderService;
import com.helpserver.service.OrderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/06.
 */
@Service
public class OrderTypeServiceImpl implements OrderTypeService {

    @Autowired
    UserDao newsDao;
    @Autowired
    OrdertypeDao ordertypeDao;

    @Override
    public String insertOrderType(Ordertype orderType) {
        OrdertypeExample ordertypeExample = new OrdertypeExample();
        OrdertypeExample.Criteria criteria=ordertypeExample.createCriteria();
        criteria.andOrdertypeidIsNotNull();
        //int count = ordertypeDao.countByExample(ordertypeExample);
        //orderType.setType(1);
        if (ordertypeDao.insertSelective(orderType)==1) {
            return "add_success";
        }
        return "add_error";
    }

    @Override
    public String updateOrderType(Ordertype orderType) {
        if (ordertypeDao.updateByPrimaryKeySelective(orderType)==1) {
            return "update_success";
        }
        return "update_error";
    }

    @Override
    public String updateOrderTypeTypeById(Ordertype ordertype) {
        if (ordertypeDao.updateByPrimaryKeySelective(ordertype) == 1) {
            return "update_success";
        }
        return "update_error";
    }

    @Override
    public Ordertype getOrderTypeById(int id) {
        return ordertypeDao.selectByPrimaryKey(id);
    }

    @Override
    public List<Ordertype> getOrdertypeList(int type) {
        OrdertypeExample ordertypeExample = new OrdertypeExample();
        OrdertypeExample.Criteria criteria=ordertypeExample.createCriteria();
        criteria.andTypeEqualTo(type);
        ordertypeExample.setOrderByClause("type asc");
        return ordertypeDao.selectByExample(ordertypeExample);
    }
}
