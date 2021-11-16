package com.zr.service;

import com.zr.pojo.User;

public interface UserService {
    /**
     * 用户注册
     * @return
     */
    Boolean register(User user);
    /**
     * 用户登录查询
     */
    Boolean login(String account,String password);
}
