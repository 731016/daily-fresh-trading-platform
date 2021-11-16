package com.zr.service;

import com.zr.pojo.ShoppingCart;

import java.util.List;

public interface ShoppingCartService {
    //查询购物车
    List<ShoppingCart> selectAll();

    //查询购物车商品数量
    Integer selectCount();

    //添加购物车
    boolean addCart(ShoppingCart shoppingCart);

    //删除购物车
    boolean delCart(Integer shoppingId);
}
