package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-10.
 */
public class MoneyUserDto implements Serializable {
    User user;
    Money money;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Money getMoney() {
        return money;
    }

    public void setMoney(Money money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "MoneyUserDto{" +
                "user=" + user +
                ", money=" + money +
                '}';
    }
}
