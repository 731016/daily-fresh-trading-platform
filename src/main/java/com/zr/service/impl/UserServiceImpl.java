package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zr.mapper.UserMapper;
import com.zr.pojo.User;
import com.zr.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper mapper;

    /**
     * 用户注册
     *
     * @return
     */
    @Override
    public Boolean register(User user) {

        // 对密码进行 md5加密
        user.setPwd(DigestUtils.md5Hex(user.getPwd()));
        // 设置用户名 - 账户名
        user.setUsername(user.getAccount());
//        int insert = mapper.userInsert(user);
        int insert = mapper.insert(user);
        if (insert > 0) {
            return true;
        }
        return false;
    }

    /**
     * 用户登录查询
     *
     * @param account
     * @param password
     */
    @Override
    public Boolean login(String account, String password) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        // 账户和密码查询，密码加密后比对
        wrapper.eq("account", account);
        wrapper.eq("pwd", DigestUtils.md5Hex(password));
        User user = mapper.selectOne(wrapper);
        // 查询出来的对象为空
        if (user == null) {
            return false;
        }
        return true;
    }

    /**
     * 查询此用户是否存在
     *
     * @param account
     * @return
     */
    @Override
    public Boolean registerAccExist(String account) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("account", account);
        User existUser = mapper.selectOne(wrapper);
        // 查询用户名已存在，不能注册返回
        if (existUser != null) {
            return true;
        }
        return false;
    }

    /**
     * 查询用户
     *
     * @param account
     * @return
     */
    @Override
    public User queryUser(String account) {
        User user = mapper.selectById(account);
        return user;
    }

    /**
     * 重置密码
     *
     * @param user
     * @return
     */
    @Override
    public Boolean resetPwd(User user) {
        String newPwd = DigestUtils.md5Hex(user.getPwd());
        //重新设置密码
        user.setPwd(newPwd);
        mapper.updateById(user);
        return true;
    }

    /**
     * 更新收货地址编号
     *
     */
    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public Integer userUpdate(String account,Integer shippingId) {
        User user = new User();
        user.setAccount(account);
        user.setShippingId(shippingId);
        return mapper.updateById(user);
    }
}
