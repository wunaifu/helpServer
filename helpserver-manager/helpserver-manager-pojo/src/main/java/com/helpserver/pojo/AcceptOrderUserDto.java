package com.helpserver.pojo;

import java.io.Serializable;

/**
 * Created by Administrator on 2018-02-01.
 */
public class AcceptOrderUserDto implements Serializable {
    User user;
    Acceptorder acceptorder;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Acceptorder getAcceptorder() {
        return acceptorder;
    }

    public void setAcceptorder(Acceptorder acceptorder) {
        this.acceptorder = acceptorder;
    }
}
