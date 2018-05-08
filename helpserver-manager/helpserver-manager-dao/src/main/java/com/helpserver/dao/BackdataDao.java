package com.helpserver.dao;

import com.helpserver.pojo.Backdata;
import com.helpserver.pojo.BackdataExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BackdataDao {
    int countByExample(BackdataExample example);

    int deleteByExample(BackdataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Backdata record);

    int insertSelective(Backdata record);

    List<Backdata> selectByExample(BackdataExample example);

    Backdata selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Backdata record, @Param("example") BackdataExample example);

    int updateByExample(@Param("record") Backdata record, @Param("example") BackdataExample example);

    int updateByPrimaryKeySelective(Backdata record);

    int updateByPrimaryKey(Backdata record);
}