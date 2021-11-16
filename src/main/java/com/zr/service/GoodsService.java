package com.zr.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.zr.pojo.Goods;

import java.util.List;

public interface GoodsService {
    //查询该类型所有商品(分页)
    PageInfo<Goods> selectPage(Integer num, Integer pageSize, QueryWrapper<Goods> wrapper);

    //查询该类型销量排名前多少的商品
    List<Goods> selectSortSalesByType(Integer typeId, Integer goodsNum);
}
