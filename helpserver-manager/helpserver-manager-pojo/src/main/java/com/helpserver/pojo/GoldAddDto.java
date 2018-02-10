package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-10.
 */
public class GoldAddDto  implements Serializable {
    User user;
    Goldadd goldadd;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Goldadd getGoldadd() {
        return goldadd;
    }

    public void setGoldadd(Goldadd goldadd) {
        this.goldadd = goldadd;
    }

    @Override
    public String toString() {
        return "GoldAddDto{" +
                "user=" + user +
                ", goldadd=" + goldadd +
                '}';
    }
}
