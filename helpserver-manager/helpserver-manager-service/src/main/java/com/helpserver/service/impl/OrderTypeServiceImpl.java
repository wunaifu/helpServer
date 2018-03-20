package com.helpserver.service.impl;

import com.helpserver.dao.BigtypeDao;
import com.helpserver.dao.OrderDao;
import com.helpserver.dao.OrdertypeDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.*;
import com.helpserver.service.OrderService;
import com.helpserver.service.OrderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wunaifu on 2018/3/06.
 */
@Service
public class OrderTypeServiceImpl implements OrderTypeService {

    @Autowired
    BigtypeDao bigtypeDao;
    @Autowired
    OrdertypeDao ordertypeDao;

    @Override
    public String insertOrderType(Ordertype orderType) {
        if (ordertypeDao.insertSelective(orderType)==1) {
            return "add_success";
        }
        return "add_error";
    }

    @Override
    public String insertBigType(Bigtype bigtype) {
        if (bigtypeDao.insertSelective(bigtype)==1) {
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
    public String updateBigType(Bigtype bigtype) {
        if (bigtypeDao.updateByPrimaryKeySelective(bigtype)==1) {
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
    public Bigtype getBigtypeById(int id) {
        return bigtypeDao.selectByPrimaryKey(id);
    }

    @Override
    public List<OrderTypeDto> getOrderTypeDtoList(int state) {
        List<OrderTypeDto> orderTypeDtoList = new ArrayList<>();

        BigtypeExample bigtypeExample = new BigtypeExample();
        BigtypeExample.Criteria criteria1 = bigtypeExample.createCriteria();
        criteria1.andIdIsNotNull();
        bigtypeExample.setOrderByClause("createTime desc");
        List<Bigtype> bigtypeList = bigtypeDao.selectByExample(bigtypeExample);

        for (int i = 0; i < bigtypeList.size(); i++) {
            OrderTypeDto orderTypeDto = new OrderTypeDto();
            orderTypeDto.setBigtype(bigtypeList.get(i));
            OrdertypeExample ordertypeExample = new OrdertypeExample();
            OrdertypeExample.Criteria criteria=ordertypeExample.createCriteria();
            criteria.andStateEqualTo(state);
            ordertypeExample.setOrderByClause("createTime desc");
            List<Ordertype> ordertypeS = ordertypeDao.selectByExample(ordertypeExample);
            orderTypeDto.setOrdertypeList(ordertypeS);
            orderTypeDtoList.add(orderTypeDto);
        }
        return orderTypeDtoList;
    }

    @Override
    public List<Bigtype> getBigTypeList() {
        BigtypeExample bigtypeExample = new BigtypeExample();
        BigtypeExample.Criteria criteria1 = bigtypeExample.createCriteria();
        criteria1.andIdIsNotNull();
        bigtypeExample.setOrderByClause("createTime desc");
        List<Bigtype> bigtypeList = bigtypeDao.selectByExample(bigtypeExample);

        return bigtypeList;
    }

    @Override
    public List<Ordertype> getOrdertypeList(int bigTypeId,int state) {
        OrdertypeExample ordertypeExample = new OrdertypeExample();
        OrdertypeExample.Criteria criteria=ordertypeExample.createCriteria();
        criteria.andStateEqualTo(state);
        criteria.andBigtypeidEqualTo(bigTypeId);
        ordertypeExample.setOrderByClause("createTime desc");
        List<Ordertype> ordertypeS = ordertypeDao.selectByExample(ordertypeExample);

        return ordertypeS;
    }


}
