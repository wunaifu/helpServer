package com.helpserver.service.impl;

import com.alibaba.druid.support.logging.Log;
import com.helpserver.dao.GoldDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.Gold;
import com.helpserver.pojo.UserExample;
import com.helpserver.service.GoldService;
import com.helpserver.utils.DESUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.helpserver.pojo.User;
import com.helpserver.service.UserService;

import java.util.Date;
import java.util.List;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

/**
 * Created by wunaifu on 2018/1/11.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;
    @Autowired
    GoldDao goldDao;

    /**
     * 根据用户权限获取用户数据，并根据注册时间排序好
     *
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
     *
     * @return
     */
    @Override
    public List<User> getAllUseingUserList() {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPermissionBetween(0, 1);
        userExample.setOrderByClause("registertime desc");
        return userDao.selectByExample(userExample);
    }

    @Override
    public List<User> getUserList(User user) {

        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        if (user.getName() != null) {
            criteria.andNameEqualTo(user.getName());
        }
        if (user.getNickname() != null) {
            criteria.andNicknameEqualTo(user.getNickname());
        }
        if (user.getAddress() != null) {
            criteria.andAddressEqualTo(user.getAddress());
        }
        if (user.getAge() != null) {
            criteria.andAgeEqualTo(user.getAge());
        }

        return userDao.selectByExample(userExample);
    }

    @Override
    public User selectByPrimaryKey(Integer userid) {
        return userDao.selectByPrimaryKey(userid);
    }

    @Override
    public User getUserByPhone(String phone) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<User> userList = userDao.selectByExample(userExample);
        if (userList.size()>0) {
            System.out.println(userList.toString());
            return userList.get(0);
        }
        return null;
    }

    @Override
    public boolean insertUser(User user) {
        return false;
    }

    /**
     * 管理员登录
     * 1、先验证是否存在手机账号
     * 2、返回信息
     *
     * @param phone
     * @param password
     * @return
     */
    @Override
    public String managerLoginByPhoneAndPsw(String phone, String password) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
        criteria.andPermissionEqualTo(-1);
        List<User> userList = userDao.selectByExample(userExample);
        if (userList != null && userList.size() > 0) {
            if (DESUtils.getMD5Str(password).equals(userList.get(0).getPassword())) {
                return "login_success";
            } else {
                return "password_error";
            }
        } else {
            return "phone_error";
        }
    }

    /**
     * 普通用户登录
     * 1、先验证是否存在手机账号,是否已被禁用
     * 2、返回信息
     *
     * @param phone
     * @param password
     * @return
     */
    @Override
    public String loginByPhoneAndPsw(String phone, String password) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
//        criteria.andPermissionNotEqualTo(2);
        List<User> userList = userDao.selectByExample(userExample);
        if (userList != null && userList.size() > 0) {
            if (userList.get(0).getPermission() == 2) {
                return "phone_ban";
            }
            if (DESUtils.getMD5Str(password).equals(userList.get(0).getPassword())) {
                return "login_success";
            } else {
                return "password_error";
            }
        } else {
            return "phone_error";
        }
    }

    /**
     * 更新密码
     *
     * @param userId
     * @param oldPsw
     * @param newPsw
     * @return
     */
    @Override
    public String doResetPsw(int userId, String oldPsw, String newPsw) {
        User user = userDao.selectByPrimaryKey(userId);
        if (user != null) {
            if (user.getPassword().equals(oldPsw)) {
                //密码验证成功
                User user1 = new User();
                user1.setUserid(userId);
                user1.setPassword(newPsw);
                if (userDao.updateByPrimaryKeySelective(user1) == 1) {
                    return "resetpsw_success";
                }
            } else {
                //旧密码错误
                return "oldpsw_error";
            }
        }
        return "resetpsw_error";
    }

    /**
     * 更新手机号
     *
     * @param userId
     * @param newPhone
     * @return
     */
    @Override
    public String doBindPhone(int userId, String newPhone) {
//        UserExample userExample = new UserExample();
//        UserExample.Criteria criteria = userExample.createCriteria();
//        criteria.andPhoneEqualTo(newPhone);
//        List<User> userList = userDao.selectByExample(userExample);
        User user = this.getUserByPhone(newPhone);
        if (user!=null) {
            //手机号存在
            return "phone_exist";
        }

        User user1 = new User();
        user1.setUserid(userId);
        user1.setPhone(newPhone);
        if (userDao.updateByPrimaryKeySelective(user1) == 1) {
            return "bindphone_success";
        }
        return "bindphone_error";
    }

    /**
     * 注册
     * 1、先验证是否存在手机账号
     * 2、插入账号密码、权限为0、注册时间
     *
     * @param phone
     * @param password
     * @return
     */
    @Override
    public String registerByPhoneAndPsw(String phone, String password) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<User> userList = userDao.selectByExample(userExample);
        if (userList != null && userList.size() > 0) {
            return "user_exist";
        } else {
            User user = new User();
            user.setPhone(phone);
            user.setPassword(DESUtils.getMD5Str(password));
            user.setPermission(0);
            user.setRegistertime(TimeUtil.dateToString(new Date()));
            user.setName(phone);
            user.setNickname(phone);
            user.setHeadicon("icon001.png");
            int result = userDao.insertSelective(user);
            int userId = user.getUserid();
            System.out.println("1userId====================="+userId);
            if (result == 1) {
                Gold gold = new Gold();
                gold.setUserid(user.getUserid());
                gold.setTime(TimeUtil.dateToString(new Date()));
                gold.setGoldamount(10);
                gold.setState(0);
                System.out.println("2userId====================="+user.getUserid());
                goldDao.insertSelective(gold);
                return "register_success";
            }
            return "register_failure";
        }
    }

    @Override
    public boolean updateUser(User user) {
//        UserExample userExample = new UserExample();
//        UserExample.Criteria criteria=userExample.createCriteria();
//        if (user.getName() != null) {
//            criteria.andNameEqualTo(user.getName());
//        }
//        if (user.getNickname() != null) {
//            criteria.andNicknameEqualTo(user.getNickname());
//        }
//        if (user.getAddress() != null) {
//            criteria.andAddressEqualTo(user.getAddress());
//        }
//        if (user.getAge()!=null){
//            criteria.andAgeEqualTo(user.getAge());
//        }
//        if (user.getSex() != null) {
//            criteria.andSexEqualTo(user.getSex());
//        }
//        if (user.getUserinfo()!=null){
//            criteria.andUserinfoEqualTo(user.getUserinfo());
//        }
//        criteria.andUseridEqualTo(user.getUserid());
        if (userDao.updateByPrimaryKeySelective(user) == 1) {
            return true;
        }
        return false;
    }

    @Override
    public boolean updateUserPermission(int userId, int permission) {
        User user = new User();
        user.setUserid(userId);
        user.setPermission(permission);
        if (userDao.updateByPrimaryKeySelective(user) == 1) {
            return true;
        }
        return false;
    }

    /**
     * 管理员取消禁用用户，禁用时间置为空
     *
     * @param userId
     * @param permission
     * @return
     */
    @Override
    public boolean managerUnBanUser(int userId, int permission) {
        User user = new User();
        user.setUserid(userId);
        user.setPermission(permission);
        user.setBantime("");
        if (userDao.updateByPrimaryKeySelective(user) == 1) {
            return true;
        }
        return false;
    }

    /**
     * 管理员禁用用户，设置禁用时间
     *
     * @param userId
     * @param permission
     * @return
     */
    @Override
    public boolean managerBanUser(int userId, int permission) {
        User user = new User();
        user.setUserid(userId);
        user.setPermission(permission);
        user.setBantime(TimeUtil.dateToString(new Date()));
        if (userDao.updateByPrimaryKeySelective(user) == 1) {
            return true;
        }
        return false;
    }

    /**
     * 管理员重置密码
     *
     * @param userId
     * @param psw
     * @return
     */
    @Override
    public boolean managerResetUserPsw(int userId, String psw) {
        User user = new User();
        user.setUserid(userId);
        user.setPassword(psw);
        if (userDao.updateByPrimaryKeySelective(user) == 1) {
            return true;
        }
        return false;
    }
}
