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

    /**
     * 查询此用户是否存在
     * @param account
     * @return
     */
    Boolean registerAccExist(String account);

    /**
     * 查询用户
     * @param account
     * @return
     */
    User queryUser(String account);

    /**
     * 重置密码
     * @param user
     * @return
     */
    Boolean resetPwd(User user);
    /**
     * 更新收货地址编号
     */
    Integer userUpdate(String account,Integer shippingId);
}
