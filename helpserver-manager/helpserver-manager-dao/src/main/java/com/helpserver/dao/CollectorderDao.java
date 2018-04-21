package com.helpserver.dao;

import com.helpserver.pojo.Collectorder;
import com.helpserver.pojo.CollectorderExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectorderDao {
    int countByExample(CollectorderExample example);

    int deleteByExample(CollectorderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Collectorder record);

    int insertSelective(Collectorder record);

    List<Collectorder> selectByExample(CollectorderExample example);

    Collectorder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Collectorder record, @Param("example") CollectorderExample example);

    int updateByExample(@Param("record") Collectorder record, @Param("example") CollectorderExample example);

    int updateByPrimaryKeySelective(Collectorder record);

    int updateByPrimaryKey(Collectorder record);
}