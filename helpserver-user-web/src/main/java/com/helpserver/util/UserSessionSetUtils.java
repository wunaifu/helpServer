package com.helpserver.util;

import com.helpserver.dto.NowUser;

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

    public static NowUser getNowUser(HttpServletRequest request) {
        if (request.getSession().getAttribute("nowUser") != null) {
            NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
            return nowUser;
        }
        return null;
    }



}
