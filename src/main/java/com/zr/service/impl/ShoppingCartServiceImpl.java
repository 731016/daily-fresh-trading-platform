package com.zr.service.impl;

import com.zr.mapper.ShoppingCartMapper;
import com.zr.service.ShoppingCartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Resource
    private ShoppingCartMapper mapper;
}
