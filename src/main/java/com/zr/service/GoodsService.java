package com.zr.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.zr.pojo.Goods;

import java.util.List;

public interface GoodsService {

    /**
     * 查询该类型所有商品(分页)
     *
     * @param num
     * @param pageSize
     * @param wrapper
     * @return
     */
    PageInfo<Goods> selectPage(Integer num, Integer pageSize, QueryWrapper<Goods> wrapper);

    /**
     * 查询该类型销量排名前多少的商品
     *
     * @param typeId
     * @param goodsNum
     * @return
     */
    List<Goods> selectSortSalesByType(Integer typeId, Integer goodsNum);

    /**
     * 查询销量排名前多少的商品
     *
     * @param goodsNum
     * @return
     */
    List<Goods> selectSortSalesByType(Integer goodsNum);

    /**
     * 查询单个商品
     *
     * @param goodsId
     * @return
     */
    Goods selectOne(Integer goodsId);
}
