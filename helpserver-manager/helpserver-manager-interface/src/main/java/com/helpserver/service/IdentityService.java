package com.helpserver.service;

import com.helpserver.pojo.Identity;
import com.helpserver.pojo.User;
import com.helpserver.pojo.UserInfoDto;

import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
public interface IdentityService {

    String insertIdenty(Identity identity);

    String updateIdenty(Identity identity);

    String agreeUserIdentity(int userId);

    String disagreeUserIdentity(int userId,String reason);

    Identity getIdentityByUserId(int userId);

    List<UserInfoDto> getUserInfoDtoListByCheckState(int checkState);

    UserInfoDto getUserInfoDtoByUserId(int userId);

}
