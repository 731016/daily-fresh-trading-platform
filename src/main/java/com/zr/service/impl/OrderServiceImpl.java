package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.zr.mapper.OrderMapper;
import com.zr.pojo.Goods;
import com.zr.pojo.Order;
import com.zr.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper mapper;


    @Override
    public PageInfo<Order> selectPage(Integer num, Integer pageSize, QueryWrapper<Goods> wrapper) {
        return null;
    }

    @Override
    public boolean addOrder(Order order) {
        return false;
    }
}
