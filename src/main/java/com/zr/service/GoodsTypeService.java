package com.zr.service;

import com.zr.pojo.GoodsType;

public interface GoodsTypeService {
    /**
     * 查询所有商品类型，存入缓存
     *
     * @return
     */
    String selectAllRedis();

    /**
     * 查询单个商品类型
     *
     * @param typeId
     * @return
     */
    GoodsType selectOne(Integer typeId);
}
