package com.helpserver.utils;

/**
 * Created by wunaifu on 2017-12-25.
 */
import org.apache.commons.codec.binary.Hex;

import java.security.Key;
import java.security.MessageDigest;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

/**
 * 加密解密工具包
 */
public class DESUtils {

    public static final String ALGORITHM_DES = "DES/CBC/PKCS5Padding";
    public static final String key = "wu8nai8fu";//加密私钥，长度不能够小于8位
    //加入一个混淆字符串(秒杀接口)的salt，为了我避免用户猜出我们的md5值，值任意给，越复杂越好
    private static final String salt="fu888";

    /**
     * DES算法，加密
     *
     * @param data 待加密字符串
     * @return 加密后的字节数组，一般结合Base64编码使用
     * @throws Exception
     */
    public static String encode(String data) {
//        String key=this.key;
        if (data == null) {
            return null;
        }
        try{
            DESKeySpec dks = new DESKeySpec(key.getBytes());
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            //key的长度不能够小于8位字节
            Key secretKey = keyFactory.generateSecret(dks);
            Cipher cipher = Cipher.getInstance(ALGORITHM_DES);
            IvParameterSpec iv = new IvParameterSpec("12345678".getBytes());
            AlgorithmParameterSpec paramSpec = iv;
            cipher.init(Cipher.ENCRYPT_MODE, secretKey,paramSpec);
            byte[] bytes = cipher.doFinal(data.getBytes());
            return byte2hex(bytes);
        }catch(Exception e){
            e.printStackTrace();
            return data;
        }
    }

    /**
     * DES算法，解密
     *
     * @param data 待解密字符串
     * @return 解密后的字节数组
     * @throws Exception 异常
     */
    public static String decode(String data) {
        if (data == null) {
            return null;
        }
        try {
            DESKeySpec dks = new DESKeySpec(key.getBytes());
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            //key的长度不能够小于8位字节
            Key secretKey = keyFactory.generateSecret(dks);
            Cipher cipher = Cipher.getInstance(ALGORITHM_DES);
            IvParameterSpec iv = new IvParameterSpec("12345678".getBytes());
            AlgorithmParameterSpec paramSpec = iv;
            cipher.init(Cipher.DECRYPT_MODE, secretKey, paramSpec);
            return new String(cipher.doFinal(hex2byte(data.getBytes())));
        } catch (Exception e){
            e.printStackTrace();
            return data;
        }
    }

    /**
     * 二行制转字符串
     * @param b
     * @return
     */
    private static String byte2hex(byte[] b) {
        StringBuilder hs = new StringBuilder();
        String stmp;
        for (int n = 0; b!=null && n < b.length; n++) {
            stmp = Integer.toHexString(b[n] & 0XFF);
            if (stmp.length() == 1) {
                hs.append('0');
            }
            hs.append(stmp);
        }
        return hs.toString().toUpperCase();
    }

    private static byte[] hex2byte(byte[] b) {
        if ((b.length % 2) != 0) {
            throw new IllegalArgumentException();
        }
        byte[] b2 = new byte[b.length/2];
        for (int n = 0; n < b.length; n+=2) {
            String item = new String(b,n,2);
            b2[n/2] = (byte)Integer.parseInt(item,16);
        }
        return b2;
    }



    /**
     * 用jdk实现:MD5
     * @param src
     * @return
     */
    public static String getMD5Str(String src) {
        if (src == null) {
            return null;
        }
        src = src + salt;
        String encodeStr = "";
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] md5Bytes = md.digest(src.getBytes());
            encodeStr = Hex.encodeHexString(md5Bytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return encodeStr;
    }

    public static void main(String[] args) {
        String src = "963852";
        String enStr = DESUtils.getMD5Str(src);
        System.out.println("加密后："+enStr);
    }

}
