package com.helpserver.dao;

import com.helpserver.pojo.Payaccount;
import com.helpserver.pojo.PayaccountExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PayaccountDao {
    int countByExample(PayaccountExample example);

    int deleteByExample(PayaccountExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Payaccount record);

    int insertSelective(Payaccount record);

    List<Payaccount> selectByExample(PayaccountExample example);

    Payaccount selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Payaccount record, @Param("example") PayaccountExample example);

    int updateByExample(@Param("record") Payaccount record, @Param("example") PayaccountExample example);

    int updateByPrimaryKeySelective(Payaccount record);

    int updateByPrimaryKey(Payaccount record);
}