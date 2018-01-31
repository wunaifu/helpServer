package com.helpserver.service.impl;

import com.helpserver.dao.IdentityDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.Identity;
import com.helpserver.pojo.IdentityExample;
import com.helpserver.pojo.User;
import com.helpserver.pojo.UserExample;
import com.helpserver.service.IdentityService;
import com.helpserver.service.UserService;
import com.helpserver.utils.DESUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


    @Override
    public String insertIdenty(Identity identity) {
        if (identityDao.insertSelective(identity) == 1) {
            return "update_success";
        }
        return "update_error";
    }

    @Override
    public String updateIdenty(Identity identity) {
        if (identityDao.updateByPrimaryKeySelective(identity) == 1) {
            return "update_success";
        }
        return "update_error";
    }

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
}
