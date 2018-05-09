package com.helpserver.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {

    public static String dateToString(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH/mm/ss");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }

    public static String dateToStrNoS(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("yy/MM/dd/HH:mm");
//        DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH/mm/ss");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }

    public static String dateToStrNoDay(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("HH:mm:ss");
//        DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH/mm/ss");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }

    public static String dateToStrMdHm(String dateStr){
        Date date = TimeUtil.stringToDate(dateStr);
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
//        DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH/mm/ss");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }

    public static String dateToStrNoTime(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }
    public static String dateToStrNoTimeDian(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }

    public static String dateToStrYYYYMMDD(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }

    public static Date stringToDate(String dateStr){
        Date date = new Date();
        //注意format的格式要与日期String的格式相匹配
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = sdf.parse(dateStr);
            System.out.println(date.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static Date strToDateNoTime(String dateStr){
        Date date = null;
        //注意format的格式要与日期String的格式相匹配
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            date = sdf.parse(dateStr);
            System.out.println(date.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static Date timestampToDate(Timestamp ts){
        Date date = new Date();
        try {
            date = ts;
            System.out.println(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String timestampToString(Timestamp ts){
        String tsStr = "";
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            //方法一
            tsStr = sdf.format(ts);
            System.out.println(tsStr);
            //方法二
            tsStr = ts.toString();
            System.out.println(tsStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tsStr;
    }

    public static Timestamp stringToTimestamp(String tsStr){
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        try {
            ts = Timestamp.valueOf(tsStr);
            System.out.println(ts);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ts;
    }

    public static Date longToDateNoTime(String dateStr){
        Date date = new Date(Long.parseLong(dateStr));
        //注意format的格式要与日期String的格式相匹配
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            date = sdf.parse(dateStr);
            System.out.println(date.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static Date longToDate(String dateStr){
        Date date = new Date(Long.parseLong(dateStr));
        //注意format的格式要与日期String的格式相匹配
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = sdf.parse(dateStr);
            System.out.println(date.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }
    public static Date longToDate1(Long dateStr){
        Date date = new Date(dateStr);
        //注意format的格式要与日期String的格式相匹配
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = sdf.parse(dateStr.toString());
//            date = sdf.format(dateStr.toString());
            System.out.println(date.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return date;
    }
    
    /* 
     * 将时间转换为时间戳
     */    
    public static String dateToStamp(String s) throws ParseException{
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = simpleDateFormat.parse(s);
        long ts = date.getTime();
        res = String.valueOf(ts);
        return res;
    }
    /* 
     * 将时间戳转换为时间
     */
    public static String stampToDate(String s){
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        long lt = new Long(s);
        Date date = new Date(lt);
        res = simpleDateFormat.format(date);
        return res;
    }

    public static int getDatePoor(Date endDate, Date nowDate) {

        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - nowDate.getTime();
        // 计算差多少天
        long day = diff / nd;
        // 计算差多少小时
        long hour = diff % nd / nh;
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        // 计算差多少秒//输出结果
        // long sec = diff % nd % nh % nm / ns;
        //return day + "天" + hour + "小时" + min + "分钟";
        return (int) day;
    }

    public static String getYear(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("yyyy");
//        DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH/mm/ss");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }

    public static String getMonth(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("MM");
//        DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH/mm/ss");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }

    public static String getDay(Date date){
        String dateStr = "";
        //format的格式可以任意
        DateFormat sdf = new SimpleDateFormat("dd");
//        DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH/mm/ss");
        try {
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateStr;
    }
}
