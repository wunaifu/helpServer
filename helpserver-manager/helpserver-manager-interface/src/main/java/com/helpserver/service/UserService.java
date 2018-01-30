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

    User getUserByPhone(String phone);

    boolean insertUser(User user);

    String loginByPhoneAndPsw(String phone,String password);

    String managerLoginByPhoneAndPsw(String phone,String password);

    String registerByPhoneAndPsw(String phone,String password);

    String doResetPsw(int userId,String oldPsw,String newPsw);

    boolean updateUser(User user);

    boolean managerUnBanUser(int userId,int permission);

    boolean managerBanUser(int userId,int permission);

    boolean managerResetUserPsw(int userId,String psw);

    boolean updateUserPermission(int userId,int permission);

}
