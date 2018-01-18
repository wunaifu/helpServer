package com.helpserver.service.impl;

import com.helpserver.dao.UserDao;
import com.helpserver.pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.helpserver.pojo.User;
import com.helpserver.service.UserService;

import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserDao userDao;

    /**
     * 根据用户权限获取用户数据，并根据注册时间排序好
     * @param permission
     * @return
     */
    @Override
    public List<User> getUserListByPermission(int permission) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPermissionEqualTo(permission);
        userExample.setOrderByClause("bantime desc");
        return userDao.selectByExample(userExample);
    }

    /**
     * 获取使用中的用户列表，并根据注册时间排序
     * @return
     */
    @Override
    public List<User> getAllUseingUserList() {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPermissionBetween(0,1);
        userExample.setOrderByClause("registertime desc");
        return userDao.selectByExample(userExample);
    }

    @Override
    public List<User> getUserList(User user) {

        UserExample userExample = new UserExample();
        UserExample.Criteria criteria=userExample.createCriteria();
        if (user.getName() != null) {
            criteria.andNameEqualTo(user.getName());
        }
        if (user.getNickname() != null) {
            criteria.andNicknameEqualTo(user.getNickname());
        }
        if (user.getAddress() != null) {
            criteria.andAddressEqualTo(user.getAddress());
        }
        if (user.getAge()!=null){
            criteria.andAgeEqualTo(user.getAge());
        }

        return userDao.selectByExample(userExample);
    }

    @Override
    public User selectByPrimaryKey(Integer userid) {
        return userDao.selectByPrimaryKey(userid);
    }

    @Override
    public User selectByExample(String phone) {
        return null;
    }

    @Override
    public boolean insertUser(User user) {
        return false;
    }

    @Override
    public User selectByPhoneAndPsw(String phone, String password) {
        return null;
    }

    @Override
    public boolean updateUser(User user) {
        return false;
    }
}
