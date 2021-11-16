package com.zr.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Utils {
    /**
     * 消息摘要方法，md5加密
     *
     * @param msg
     * @return
     */
    public static String msgEncrypt(String msg) {
        String result = "";
        try {
            byte[] digest = null;
            MessageDigest md5 = MessageDigest.getInstance("md5");
            digest = md5.digest(msg.getBytes("utf-8"));
            result = new BigInteger(1, digest).toString(16);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
