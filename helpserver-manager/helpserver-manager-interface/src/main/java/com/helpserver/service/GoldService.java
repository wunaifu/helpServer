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

    String addPayGoldByMoney(Goldadd goldAdd);

    String goleToMoney(int amount,int userId);

    String addGoldadd(Goldadd goldadd);

    Gold getGold(int userId);

    List<Goldadd> getGoldaddedListByUserId(int userId);

    List<Goldadd> getGoldaddingListByUserId(int userId);

    List<Goldhistory> getGoldHistoryListByUserId(int userId);

    List<GoldUserDto> getGoldUserDtoList();

    List<GoldAddDto> getGoldAddDtoListByGetTime(int getTimeState);

    GoldAddDto getGoldAddDtoByGoldAddId(int addId);

}
