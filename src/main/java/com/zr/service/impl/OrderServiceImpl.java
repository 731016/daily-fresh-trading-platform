package com.zr.service.impl;

import com.zr.mapper.OrderMapper;
import com.zr.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper mapper;
}
