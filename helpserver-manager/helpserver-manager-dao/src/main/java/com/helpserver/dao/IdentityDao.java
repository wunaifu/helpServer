package com.helpserver.dao;

import com.helpserver.pojo.Identity;
import com.helpserver.pojo.IdentityExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IdentityDao {
    int countByExample(IdentityExample example);

    int deleteByExample(IdentityExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Identity record);

    int insertSelective(Identity record);

    List<Identity> selectByExample(IdentityExample example);

    Identity selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Identity record, @Param("example") IdentityExample example);

    int updateByExample(@Param("record") Identity record, @Param("example") IdentityExample example);

    int updateByPrimaryKeySelective(Identity record);

    int updateByPrimaryKey(Identity record);
}