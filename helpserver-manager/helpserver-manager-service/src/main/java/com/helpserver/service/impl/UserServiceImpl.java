package com.helpserver.service.impl;

import com.alibaba.druid.support.logging.Log;
import com.helpserver.dao.GoldDao;
import com.helpserver.dao.GoldhistoryDao;
import com.helpserver.dao.MoneyDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.*;
import com.helpserver.service.GoldService;
import com.helpserver.utils.CommonsUtil;
import com.helpserver.utils.DESUtils;
import com.helpserver.utils.MyThrowException;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.helpserver.service.UserService;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    GoldhistoryDao goldhistoryDao;
    @Autowired
    MoneyDao moneyDao;

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
        if (userList.size() > 0) {
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
     * 普通用户忘记密码时登录
     * 1、先验证是否存在手机账号,是否已被禁用
     * 2、返回信息
     *
     * @param phone
     * @return
     */
    @Override
    public String loginByPhone(String phone) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
//        criteria.andPermissionNotEqualTo(2);
        List<User> userList = userDao.selectByExample(userExample);
        if (userList != null && userList.size() > 0) {
            if (userList.get(0).getPermission() == 2) {
                return "phone_ban";
            }
            return "login_success";
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
     * 设置密码
     *
     * @param userId
     * @param password
     * @return
     */
    @Override
    public String doSetPsw(int userId, String password) {
        User user = userDao.selectByPrimaryKey(userId);
        if (user != null) {
            User user1 = new User();
            user1.setUserid(userId);
            user1.setPassword(password);
            if (userDao.updateByPrimaryKeySelective(user1) == 1) {
                return "setpsw_success";
            }
        }
        return "setpsw_error";
    }

    /**
     * 设置支付宝账号
     *
     * @param userId
     * @param payAccount
     * @return
     */
    @Override
    public String doSetPayAccount(int userId, String payAccount) {
        User user = userDao.selectByPrimaryKey(userId);
        if (user != null) {
            User user1 = new User();
            user1.setUserid(userId);
            user1.setPayaccount(payAccount);
            if (userDao.updateByPrimaryKeySelective(user1) == 1) {
                return "setpay_success";
            }
        }
        return "setpay_error";
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
        if (user != null) {
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
     * 前端用户注册
     * 1、先验证是否存在手机账号
     * 2、插入账号密码、注册时间、权限为0：普通用户 1：实名可接单用户 -1：管理员
     * 3、添加初始金币
     * 4、添加金币收支历史
     * 5、添加初始余额基本信息
     * *
     * 使用注解控制事务方法的优点:
     * 1.开发团队达成一致约定，明确标注事务方法的编程风格
     * 2.保证事务方法的执行时间尽可能短，不要穿插其他网络操作RPC/HTTP请求或者剥离到事务方法外部
     * 3.不是所有的方法都需要事务，如只有一条修改操作、只读操作不要事务控制
     */
    @Transactional
    @Override
    public String addByPhoneAndPsw(String phone, String password) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<User> userList = userDao.selectByExample(userExample);
        int permission = 0;
        //1.先验证是否存在手机账号
        if (userList != null && userList.size() > 0) {
            return "user_exist";
        } else {
            try {
                //2.添加用户 插入账号密码、权限为permission、注册时间
                User user = new User();
                user.setPhone(phone);
                user.setPassword(DESUtils.getMD5Str(password));
                user.setPermission(permission);
                user.setRegistertime(TimeUtil.dateToString(new Date()));
                user.setName(phone);
                user.setNickname(phone);
                user.setHeadicon("icon001.png");
                user.setCredit("0");
                int result = userDao.insertSelective(user);
                if (result == 1) {
                    UserExample userExample1 = new UserExample();
                    UserExample.Criteria criteria1 = userExample1.createCriteria();
                    criteria1.andPhoneEqualTo(phone);
                    List<User> userList1 = userDao.selectByExample(userExample1);
                    int userId = userList1.get(0).getUserid();
                    //3.添加初始金币
                    Gold gold = new Gold();
                    gold.setUserid(userId);
                    gold.setTime(TimeUtil.dateToString(new Date()));
                    gold.setGoldamount(10);
                    gold.setState(0);
                    if (goldDao.insertSelective(gold) == 1) {
                        //4、添加金币收支历史
                        Goldhistory goldhistory = new Goldhistory();
                        goldhistory.setUserid(userId);
                        goldhistory.setInfo(CommonsUtil.goldInfoRegister);
                        goldhistory.setAmount(10);
                        goldhistory.setTime(gold.getTime());
                        goldhistory.setState(1);
                        if (goldhistoryDao.insertSelective(goldhistory) == 1) {
                            //5、添加初始余额基本信息
                            Money money = new Money();
                            money.setUserid(userId);
                            money.setAmount(0);
                            money.setGetamount(0);
                            money.setPayamount(0);
                            money.setTime(gold.getTime());
                            if (moneyDao.insertSelective(money) == 1) {
                                return "register_success";
                            }else {
                                throw new MyThrowException("addmoney_failure");
                            }
                        } else {
                            throw new MyThrowException("addgoldhistory_failure");
                        }
                    } else {
                        throw new MyThrowException("addgold_failure");
                    }
                } else {
                    throw new MyThrowException("register_failure");
                }
            } catch (MyThrowException e) {
                System.out.println("e========================" + e.getMessage());
                throw e;
            }
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

    /**
     * 添加默认管理员
     * 1、先验证是否存在手机账号
     * 2、插入账号密码、权限为-1、注册时间
     * *
     * 使用注解控制事务方法的优点:
     * 1.开发团队达成一致约定，明确标注事务方法的编程风格
     * 2.保证事务方法的执行时间尽可能短，不要穿插其他网络操作RPC/HTTP请求或者剥离到事务方法外部
     * 3.不是所有的方法都需要事务，如只有一条修改操作、只读操作不要事务控制
     */
    @Transactional
    @Override
    public String addAdmin(String phone, String password) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<User> userList = userDao.selectByExample(userExample);
        if (userList != null && userList.size() > 0) {
            return "user_exist";
        } else {
            try {
                User user = new User();
                user.setPhone(phone);
                user.setPassword(DESUtils.getMD5Str(password));
                user.setPermission(-1);
                user.setRegistertime(TimeUtil.dateToString(new Date()));
                user.setName("管理员");
                user.setNickname("管理员");
                user.setHeadicon("icon001.png");
                user.setCredit("0");
                int result = userDao.insertSelective(user);

                if (result == 1) {
                    UserExample userExample1 = new UserExample();
                    UserExample.Criteria criteria1 = userExample1.createCriteria();
                    criteria1.andPhoneEqualTo(phone);
                    List<User> userList1 = userDao.selectByExample(userExample1);
                    int userId = userList1.get(0).getUserid();
                    Gold gold = new Gold();
                    gold.setUserid(userId);
                    gold.setTime(TimeUtil.dateToString(new Date()));
                    gold.setGoldamount(10);
                    gold.setState(0);
                    if (goldDao.insertSelective(gold) == 1) {
                        Goldhistory goldhistory = new Goldhistory();
                        goldhistory.setUserid(userId);
                        goldhistory.setInfo(CommonsUtil.goldInfoRegister);
                        goldhistory.setAmount(10);
                        goldhistory.setTime(gold.getTime());
                        goldhistory.setState(1);
                        if (goldhistoryDao.insertSelective(goldhistory) == 1) {
                            //5、添加初始余额基本信息
                            Money money = new Money();
                            money.setUserid(userId);
                            money.setAmount(0);
                            money.setGetamount(0);
                            money.setPayamount(0);
                            money.setTime(gold.getTime());
                            if (moneyDao.insertSelective(money) == 1) {
                                return "register_success";
                            }else {
                                throw new MyThrowException("addmoney_failure");
                            }
                        } else {
                            throw new MyThrowException("addgold_failure");
                        }
                    } else {
                        throw new MyThrowException("addgold_failure");
                    }
                } else {
                    throw new MyThrowException("register_failure");
                }
            } catch (MyThrowException e) {
                System.out.println("e========================" + e.getMessage());
                throw e;
            }
        }
    }

    /**
     * 根据用户权限获取用户数据，并根据注册时间排序好
     *
     * @param permission
     * @return
     */
    @Override
    public int getUserListByNotPermission(int permission) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPermissionNotEqualTo(permission);
        return userDao.countByExample(userExample);
    }
}
