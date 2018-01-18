package com.helpserver.service;

import com.helpserver.pojo.User;

import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
public interface UserService {

    List<User> getUserListByPermission(int permission);

    List<User> getAllUseingUserList();

    List<User> getUserList(User user);

    User selectByPrimaryKey(Integer userid);

    User selectByExample(String phone);

    boolean insertUser(User user);

    User selectByPhoneAndPsw(String phone,String password);

    boolean updateUser(User user);
}
