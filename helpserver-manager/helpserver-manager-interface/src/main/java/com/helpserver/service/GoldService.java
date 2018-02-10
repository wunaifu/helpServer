package com.helpserver.service;

import com.helpserver.pojo.Gold;
import com.helpserver.pojo.Goldhistory;
import com.helpserver.pojo.Payaccount;

import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
public interface GoldService {

    boolean insertGold(int userId);

    String updateGold(Gold gold);

    String updateGoldSignIn(int userId);

    Gold getGold(int userId);

    List<Goldhistory> getGoldHistoryListByUserId(int userId);

}
