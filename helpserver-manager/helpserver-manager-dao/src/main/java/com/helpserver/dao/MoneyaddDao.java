package com.helpserver.dao;

import com.helpserver.pojo.Moneyadd;
import com.helpserver.pojo.MoneyaddExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoneyaddDao {
    int countByExample(MoneyaddExample example);

    int deleteByExample(MoneyaddExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Moneyadd record);

    int insertSelective(Moneyadd record);

    List<Moneyadd> selectByExample(MoneyaddExample example);

    Moneyadd selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Moneyadd record, @Param("example") MoneyaddExample example);

    int updateByExample(@Param("record") Moneyadd record, @Param("example") MoneyaddExample example);

    int updateByPrimaryKeySelective(Moneyadd record);

    int updateByPrimaryKey(Moneyadd record);
}