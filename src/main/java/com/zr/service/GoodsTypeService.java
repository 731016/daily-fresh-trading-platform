package com.zr.service;

public interface GoodsTypeService {
    //查询所有商品类型，存入缓存
    String selectAllRedis();
}
