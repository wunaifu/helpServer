package com.helpserver.dao;

import com.helpserver.pojo.Moneyget;
import com.helpserver.pojo.MoneygetExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoneygetDao {
    int countByExample(MoneygetExample example);

    int deleteByExample(MoneygetExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Moneyget record);

    int insertSelective(Moneyget record);

    List<Moneyget> selectByExample(MoneygetExample example);

    Moneyget selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Moneyget record, @Param("example") MoneygetExample example);

    int updateByExample(@Param("record") Moneyget record, @Param("example") MoneygetExample example);

    int updateByPrimaryKeySelective(Moneyget record);

    int updateByPrimaryKey(Moneyget record);
}