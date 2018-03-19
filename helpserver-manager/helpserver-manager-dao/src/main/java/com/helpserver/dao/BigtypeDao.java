package com.helpserver.dao;

import com.helpserver.pojo.Bigtype;
import com.helpserver.pojo.BigtypeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BigtypeDao {
    int countByExample(BigtypeExample example);

    int deleteByExample(BigtypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Bigtype record);

    int insertSelective(Bigtype record);

    List<Bigtype> selectByExample(BigtypeExample example);

    Bigtype selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Bigtype record, @Param("example") BigtypeExample example);

    int updateByExample(@Param("record") Bigtype record, @Param("example") BigtypeExample example);

    int updateByPrimaryKeySelective(Bigtype record);

    int updateByPrimaryKey(Bigtype record);
}