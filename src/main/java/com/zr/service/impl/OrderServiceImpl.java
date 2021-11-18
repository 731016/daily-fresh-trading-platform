package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zr.mapper.OrderMapper;
import com.zr.pojo.Goods;
import com.zr.pojo.GoodsOrder;
import com.zr.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper mapper;


    @Override
    public PageInfo<GoodsOrder> selectPage(Integer num, Integer pageSize, QueryWrapper<Goods> wrapper) {

        PageHelper.startPage(num, pageSize);
        List<GoodsOrder> productList = mapper.selectList(null);
        PageInfo<GoodsOrder> pageInfo = new PageInfo<>(productList, 3);
        return pageInfo;
    }

    @Override
    public boolean addOrder(GoodsOrder goodsOrder) {
        int i = mapper.insert(goodsOrder);
        if (i>0){
            return true;
        }else {
            return false;
        }

    }
}
