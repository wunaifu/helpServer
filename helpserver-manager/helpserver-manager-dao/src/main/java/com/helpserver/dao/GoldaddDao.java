package com.helpserver.dao;

import com.helpserver.pojo.Goldadd;
import com.helpserver.pojo.GoldaddExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoldaddDao {
    int countByExample(GoldaddExample example);

    int deleteByExample(GoldaddExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Goldadd record);

    int insertSelective(Goldadd record);

    List<Goldadd> selectByExample(GoldaddExample example);

    Goldadd selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Goldadd record, @Param("example") GoldaddExample example);

    int updateByExample(@Param("record") Goldadd record, @Param("example") GoldaddExample example);

    int updateByPrimaryKeySelective(Goldadd record);

    int updateByPrimaryKey(Goldadd record);
}