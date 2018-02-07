package com.helpserver.dao;

import com.helpserver.pojo.Gold;
import com.helpserver.pojo.GoldExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoldDao {
    int countByExample(GoldExample example);

    int deleteByExample(GoldExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Gold record);

    int insertSelective(Gold record);

    List<Gold> selectByExample(GoldExample example);

    Gold selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Gold record, @Param("example") GoldExample example);

    int updateByExample(@Param("record") Gold record, @Param("example") GoldExample example);

    int updateByPrimaryKeySelective(Gold record);

    int updateByPrimaryKey(Gold record);
}