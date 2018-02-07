package com.helpserver.dao;

import com.helpserver.pojo.Goldhistory;
import com.helpserver.pojo.GoldhistoryExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoldhistoryDao {
    int countByExample(GoldhistoryExample example);

    int deleteByExample(GoldhistoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Goldhistory record);

    int insertSelective(Goldhistory record);

    List<Goldhistory> selectByExample(GoldhistoryExample example);

    Goldhistory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Goldhistory record, @Param("example") GoldhistoryExample example);

    int updateByExample(@Param("record") Goldhistory record, @Param("example") GoldhistoryExample example);

    int updateByPrimaryKeySelective(Goldhistory record);

    int updateByPrimaryKey(Goldhistory record);
}