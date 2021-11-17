package com.zr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zr.pojo.User;
import org.springframework.stereotype.Repository;

/**
 * 用户
 */
@Repository
public interface UserMapper extends BaseMapper<User> {
    /**
     * 插入用户
     * @param user
     * @return
     */
    Integer userInsert(User user);
}