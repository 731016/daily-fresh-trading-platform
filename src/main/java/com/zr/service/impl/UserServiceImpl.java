package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zr.mapper.UserMapper;
import com.zr.pojo.User;
import com.zr.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

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
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
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
        wrapper.eq(account,DigestUtils.md5Hex(password));
        User user = mapper.selectOne(wrapper);
        // 查询出来的对象为空
        if (user == null) {
            return false;
        }
        return true;
    }
}
