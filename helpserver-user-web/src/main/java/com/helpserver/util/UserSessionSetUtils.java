package com.helpserver.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wunaifu on 2018/1/24.
 */
public class UserSessionSetUtils {

    public static boolean isUserLogin(HttpServletRequest request) {
        if (request.getSession().getAttribute("nowUser") != null) {
//            System.out.println("phone=="+request.getSession().getAttribute("user"));
            return true;
        }
        return false;
    }
}
