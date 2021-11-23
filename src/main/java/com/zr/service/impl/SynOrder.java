package com.zr.service.impl;

import com.zr.pojo.GoodsOrder;
import com.zr.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SynOrder {
    @Resource
    private OrderService service;

    public synchronized Boolean synAddOrder(GoodsOrder goodsOrder) throws Exception {
        return service.addOrder(goodsOrder);
    }
}
