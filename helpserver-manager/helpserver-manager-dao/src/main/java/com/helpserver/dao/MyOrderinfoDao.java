package com.helpserver.dao;

import com.helpserver.pojo.Orderinfo;
import com.helpserver.pojo.OrderinfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyOrderinfoDao {

    List<Orderinfo> selectByStateAndSearch(@Param("state") int state, @Param("search") String search);
}