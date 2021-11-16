package com.zr.utils;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.Random;


public class TokenProccessor {
    /*
     *单例模式
     */
    private TokenProccessor(){}

    private static final TokenProccessor instance = new TokenProccessor();

    /**
     * 返回类的对象
     * @return
     */
    public static TokenProccessor getInstance(){
        return instance;
    }

    /**
     * 生成Token
     */
    public String makeToken(){
        String token = (System.currentTimeMillis() + new Random().nextInt(999999999)) + "";
        return DigestUtils.sha256Hex(token);
    }
}
