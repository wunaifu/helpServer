package com.helpserver.service;

import com.helpserver.pojo.Gold;
import com.helpserver.pojo.Payaccount;

/**
 * Created by wunaifu on 2018/1/11.
 */
public interface GoldService {

    boolean insertGold(int userId);

    String updateGold(Gold gold);

    Gold getGold(int userId);

}
