package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-10.
 */
public class MoneyAddDto implements Serializable {
    User user;
    Moneyadd moneyadd;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Moneyadd getMoneyadd() {
        return moneyadd;
    }

    public void setMoneyadd(Moneyadd moneyadd) {
        this.moneyadd = moneyadd;
    }

    @Override
    public String toString() {
        return "MoneyAddDto{" +
                "user=" + user +
                ", moneyadd=" + moneyadd +
                '}';
    }
}
