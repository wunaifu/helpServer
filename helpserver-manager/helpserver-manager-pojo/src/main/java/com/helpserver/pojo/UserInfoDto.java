package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-01.
 */
public class UserInfoDto implements Serializable {
    User user;
    Identity identity;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Identity getIdentity() {
        return identity;
    }

    public void setIdentity(Identity identity) {
        this.identity = identity;
    }

    @Override
    public String toString() {
        return "UserInfoDto{" +
                "user=" + user +
                ", identity=" + identity +
                '}';
    }
}
