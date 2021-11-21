package com.zr.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.zr.pojo.Goods;
import com.zr.pojo.GoodsOrder;

public interface OrderService {
    /**
     * 查询订单信息(分页)
     *
     * @param num
     * @param pageSize
     * @param wrapper
     * @return
     */
    PageInfo<GoodsOrder> selectPage(Integer num, Integer pageSize, QueryWrapper<Goods> wrapper);

    /**
     * 增加订单
     *
     * @param goodsOrder
     * @return
     */
    boolean addOrder(GoodsOrder goodsOrder);
}
