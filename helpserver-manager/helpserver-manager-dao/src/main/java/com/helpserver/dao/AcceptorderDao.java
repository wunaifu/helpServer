package com.helpserver.dao;

import com.helpserver.pojo.Acceptorder;
import com.helpserver.pojo.AcceptorderExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AcceptorderDao {
    int countByExample(AcceptorderExample example);

    int deleteByExample(AcceptorderExample example);

    int deleteByPrimaryKey(Integer acceptorderid);

    int insert(Acceptorder record);

    int insertSelective(Acceptorder record);

    List<Acceptorder> selectByExample(AcceptorderExample example);

    Acceptorder selectByPrimaryKey(Integer acceptorderid);

    int updateByExampleSelective(@Param("record") Acceptorder record, @Param("example") AcceptorderExample example);

    int updateByExample(@Param("record") Acceptorder record, @Param("example") AcceptorderExample example);

    int updateByPrimaryKeySelective(Acceptorder record);

    int updateByPrimaryKey(Acceptorder record);
}