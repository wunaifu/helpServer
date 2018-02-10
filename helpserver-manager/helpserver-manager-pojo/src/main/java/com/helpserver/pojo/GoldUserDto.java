package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-10.
 */
public class GoldUserDto implements Serializable {
    User user;
    Gold gold;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Gold getGold() {
        return gold;
    }

    public void setGold(Gold gold) {
        this.gold = gold;
    }

    @Override
    public String toString() {
        return "GoldUserDto{" +
                "user=" + user +
                ", gold=" + gold +
                '}';
    }
}
