package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-10.
 */
public class MoneyGetDto implements Serializable {
    User user;
    Moneyget moneyget;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Moneyget getMoneyget() {
        return moneyget;
    }

    public void setMoneyget(Moneyget moneyget) {
        this.moneyget = moneyget;
    }

    @Override
    public String toString() {
        return "MoneyGetDto{" +
                "user=" + user +
                ", moneyget=" + moneyget +
                '}';
    }
}
