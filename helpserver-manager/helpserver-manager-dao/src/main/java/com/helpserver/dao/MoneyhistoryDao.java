package com.helpserver.dao;

import com.helpserver.pojo.Moneyhistory;
import com.helpserver.pojo.MoneyhistoryExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoneyhistoryDao {
    int countByExample(MoneyhistoryExample example);

    int deleteByExample(MoneyhistoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Moneyhistory record);

    int insertSelective(Moneyhistory record);

    List<Moneyhistory> selectByExample(MoneyhistoryExample example);

    Moneyhistory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Moneyhistory record, @Param("example") MoneyhistoryExample example);

    int updateByExample(@Param("record") Moneyhistory record, @Param("example") MoneyhistoryExample example);

    int updateByPrimaryKeySelective(Moneyhistory record);

    int updateByPrimaryKey(Moneyhistory record);
}