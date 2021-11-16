package com.zr.service.impl;

import com.zr.mapper.UserMapper;
import com.zr.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper mapper;
}
