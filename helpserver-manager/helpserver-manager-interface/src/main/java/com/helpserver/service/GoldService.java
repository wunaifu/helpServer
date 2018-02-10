package com.helpserver.service;

import com.helpserver.pojo.*;

import java.util.List;

/**
 * Created by wunaifu on 2018/1/11.
 */
public interface GoldService {

    boolean insertGold(int userId);

    boolean updateAllUserGoldState();

    String updateGoldSignIn(int userId);

    String addPayGoldByGoldAddId(int goldAddId);

    String addGoldadd(Goldadd goldadd);

    Gold getGold(int userId);

    List<Goldhistory> getGoldHistoryListByUserId(int userId);

    List<GoldAddDto> getGoldAddDtoListByGetTime(int getTimeState);

    GoldAddDto getGoldAddDtoByGoldAddId(int addId);

}
