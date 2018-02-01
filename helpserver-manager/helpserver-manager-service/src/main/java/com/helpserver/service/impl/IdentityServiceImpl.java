package com.helpserver.service.impl;

import com.helpserver.dao.IdentityDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.*;
import com.helpserver.service.IdentityService;
import com.helpserver.service.UserService;
import com.helpserver.utils.DESUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
@Service
public class IdentityServiceImpl implements IdentityService {

    @Autowired
    UserDao userDao;
    @Autowired
    IdentityDao identityDao;


    /**
     * 添加身份认证
     * @param identity
     * @return
     */
    @Override
    public String insertIdenty(Identity identity) {
        if (identityDao.insertSelective(identity) == 1) {
            return "update_success";
        }
        return "update_error";
    }

    /**
     * 根据主键更新不为空的字段信息、身份认证表
     * @param identity
     * @return
     */
    @Override
    public String updateIdenty(Identity identity) {
        if (identityDao.updateByPrimaryKeySelective(identity) == 1) {
            return "update_success";
        }
        return "update_error";
    }

    /**
     * 通过用户Id获取身份认证信息
     * @param userId
     * @return
     */
    @Override
    public Identity getIdentityByUserId(int userId) {
        IdentityExample identityExample = new IdentityExample();
        IdentityExample.Criteria criteria = identityExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Identity> identities=identityDao.selectByExample(identityExample);
        if (identities.size() > 0) {
            return identities.get(0);
        }
        return null;
    }

    /**
     * 通过验证状态查找认证列表
     * @param checkState
     * @return
     */
    @Override
    public List<UserInfoDto> getUserInfoDtoListByCheckState(int checkState) {
        IdentityExample identityExample = new IdentityExample();
        IdentityExample.Criteria criteria = identityExample.createCriteria();
        criteria.andCheckstateEqualTo(checkState);
        List<UserInfoDto> userInfoDtos = new ArrayList<>();
        List<Identity> identityList = identityDao.selectByExample(identityExample);
        for (int i = 0; i < identityList.size(); i++) {
            User user = userDao.selectByPrimaryKey(identityList.get(i).getUserid());
            UserInfoDto userInfoDto = new UserInfoDto();
            userInfoDto.setIdentity(identityList.get(i));
            userInfoDto.setUser(user);
            userInfoDtos.add(userInfoDto);
        }
        return userInfoDtos;
    }

    @Override
    public UserInfoDto getUserInfoDtoByUserId(int userId) {
        IdentityExample identityExample = new IdentityExample();
        IdentityExample.Criteria criteria = identityExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Identity> identityList = identityDao.selectByExample(identityExample);
        User user = userDao.selectByPrimaryKey(userId);
        UserInfoDto userInfoDtos = new UserInfoDto();
        userInfoDtos.setUser(user);
        if (identityList != null && identityList.size() > 0) {
            userInfoDtos.setIdentity(identityList.get(0));
        }
        return userInfoDtos;
    }
}
