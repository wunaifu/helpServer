package com.helpserver.service;

import com.helpserver.pojo.*;

import java.util.List;

/**
 * Created by wunaifu on 2018/4/15.
 */
public interface MoneyService {

    boolean insertMoney(int userId);

    String updateMoneySignIn(int userId);

    String addPayMoneyByMoneyAddId(int moneyAddId);

    String addMoneyadd(Moneyadd moneyadd);

    Money getMoney(int userId);

    List<Moneyadd> getMoneyAddedListByUserId(int userId);

    List<Moneyadd> getMoneyAddingListByUserId(int userId);

    List<Moneyhistory> getMoneyHistoryListByUserId(int userId);

    List<MoneyUserDto> getMoneyUserDtoList();

    List<MoneyAddDto> getMoneyAddDtoListByGetTime(int getTimeState);

    MoneyAddDto getMoneyAddDtoByMoneyAddId(int addId);

}
