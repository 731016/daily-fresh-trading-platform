package com.zr.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.zr.pojo.Goods;
import com.zr.pojo.Order;

public interface OrderService {
    //查询订单信息(分页)
    PageInfo<Order> selectPage(Integer num, Integer pageSize, QueryWrapper<Goods> wrapper);

    //增加订单
    boolean addOrder(Order order);
}
