package com.zr.service;

import com.zr.pojo.ShoppingCart;

import java.util.List;

public interface ShoppingCartService {

    /**
     * 查询购物车
     *
     * @param account
     * @return
     */
    List<ShoppingCart> selectAllByAccount(String account);

    /**
     * 查询购物车商品数量
     *
     * @param account
     * @return
     */
    Integer selectCountByAccount(String account);

    /**
     * 添加购物车
     *
     * @param shoppingCart
     * @return
     */
    boolean addCart(ShoppingCart shoppingCart);

    /**
     * 删除购物车
     *
     * @param shoppingId
     * @return
     */
    boolean delCart(Integer shoppingId);

    /**
     * 查询购物车单个商品
     *
     * @param shoppingCart
     * @return
     */
    ShoppingCart selectOne(ShoppingCart shoppingCart);
}
