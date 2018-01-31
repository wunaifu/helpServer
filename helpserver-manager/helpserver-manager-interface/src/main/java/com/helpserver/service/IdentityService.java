package com.helpserver.service;

import com.helpserver.pojo.Identity;
import com.helpserver.pojo.User;

import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
public interface IdentityService {

    String insertIdenty(Identity identity);

    String updateIdenty(Identity identity);

    Identity getIdentityByUserId(int userId);

}
