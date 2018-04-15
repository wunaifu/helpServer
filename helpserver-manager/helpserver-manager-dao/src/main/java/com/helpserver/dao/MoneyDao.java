package com.helpserver.dao;

import com.helpserver.pojo.Money;
import com.helpserver.pojo.MoneyExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoneyDao {
    int countByExample(MoneyExample example);

    int deleteByExample(MoneyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Money record);

    int insertSelective(Money record);

    List<Money> selectByExample(MoneyExample example);

    Money selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Money record, @Param("example") MoneyExample example);

    int updateByExample(@Param("record") Money record, @Param("example") MoneyExample example);

    int updateByPrimaryKeySelective(Money record);

    int updateByPrimaryKey(Money record);
}