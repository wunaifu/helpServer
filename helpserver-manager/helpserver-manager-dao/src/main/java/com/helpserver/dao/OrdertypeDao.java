package com.helpserver.dao;

import com.helpserver.pojo.Ordertype;
import com.helpserver.pojo.OrdertypeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdertypeDao {
    int countByExample(OrdertypeExample example);

    int deleteByExample(OrdertypeExample example);

    int deleteByPrimaryKey(Integer ordertypeid);

    int insert(Ordertype record);

    int insertSelective(Ordertype record);

    List<Ordertype> selectByExample(OrdertypeExample example);

    Ordertype selectByPrimaryKey(Integer ordertypeid);

    int updateByExampleSelective(@Param("record") Ordertype record, @Param("example") OrdertypeExample example);

    int updateByExample(@Param("record") Ordertype record, @Param("example") OrdertypeExample example);

    int updateByPrimaryKeySelective(Ordertype record);

    int updateByPrimaryKey(Ordertype record);
}