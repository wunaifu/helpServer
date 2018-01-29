package com.helpserver.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wunaifu on 2018/1/24.
 */
public class SessionSetUtils {

    public static boolean isManagerLogin(HttpServletRequest request) {
        if (request.getSession().getAttribute("phone") != null) {
            System.out.println("phone=="+request.getSession().getAttribute("phone"));
            return true;
        }
        return false;
    }

    public static boolean isUserLogin(HttpServletRequest request) {
        if (request.getSession().getAttribute("nowUser") != null) {
//            System.out.println("phone=="+request.getSession().getAttribute("user"));
            return true;
        }
        return false;
    }
}
