package com.zr.service;

import com.github.pagehelper.PageInfo;
import com.zr.pojo.GoodsOrder;
import com.zr.pojo.GoodsOrderVo;

public interface OrderService {
    /**
     * 查询订单信息(分页)
     *
     */
    PageInfo<GoodsOrderVo> selectPage(String account, Integer num, Integer pageSize);

//    /**
//     * 查询指定用户的订单信息(分页)
//     * @return
//     */
//    PageInfo<GoodsOrderVo> queryOrderAndGoods(String account);
    /**
     * 增加订单
     *
     * @param goodsOrder
     * @return
     */
    boolean addOrder(GoodsOrder goodsOrder);

    /**
     * 删除订单
     * @param orderId
     * @return
     */
    boolean delOrder(String orderId);
}
