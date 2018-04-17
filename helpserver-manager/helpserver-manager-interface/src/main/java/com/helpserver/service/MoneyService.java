package com.helpserver.service;

import com.helpserver.pojo.*;

import java.util.List;

/**
 * Created by wunaifu on 2018/4/15.
 */
public interface MoneyService {

    boolean insertMoney(int userId);

    int insertMoneyHistory(Moneyhistory moneyhistory);

    int updateMoneyByPrimaryKey(Money money);

    String addPayMoneyByMoneyAddId(int moneyAddId);

    String addMoneyGetByMoneyGetId(int moneyGetId);

    String addMoneyadd(Moneyadd moneyadd);

    String addMoneyGet(Moneyget moneyget);

    Money getMoney(int userId);

    List<Moneyadd> getMoneyAddedListByUserId(int userId);

    List<Moneyadd> getMoneyAddingListByUserId(int userId);

    List<Moneyadd> getMoneyAddListByUserId(int userId);

    List<Moneyget> getMoneygetedListByUserId(int userId);

    List<Moneyget> getMoneygetingListByUserId(int userId);

    List<Moneyget> getMoneygetListByUserId(int userId);

    List<Moneyhistory> getMoneyHistoryListByUserId(int userId);

    List<MoneyUserDto> getMoneyUserDtoList();

    List<MoneyAddDto> getMoneyAddDtoListByGetTime(int getTimeState);

    List<MoneyGetDto> getMoneyGetDtoListByGetTime(int getTimeState);

    MoneyAddDto getMoneyAddDtoByMoneyAddId(int addId);

}
