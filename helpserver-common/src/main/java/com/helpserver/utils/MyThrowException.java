package com.helpserver.utils;

/**
 * 秒杀相关的所有业务异常
 * Created by wunaifu on 18/02/09.
 */
public class MyThrowException extends RuntimeException {
    public MyThrowException(String message) {
        super(message);
    }

    public MyThrowException(String message, Throwable cause) {
        super(message, cause);
    }
}
