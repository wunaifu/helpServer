package com.helpserver.dao;

import com.helpserver.pojo.Ordercomment;
import com.helpserver.pojo.OrdercommentExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdercommentDao {
    int countByExample(OrdercommentExample example);

    int deleteByExample(OrdercommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Ordercomment record);

    int insertSelective(Ordercomment record);

    List<Ordercomment> selectByExample(OrdercommentExample example);

    Ordercomment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Ordercomment record, @Param("example") OrdercommentExample example);

    int updateByExample(@Param("record") Ordercomment record, @Param("example") OrdercommentExample example);

    int updateByPrimaryKeySelective(Ordercomment record);

    int updateByPrimaryKey(Ordercomment record);
}