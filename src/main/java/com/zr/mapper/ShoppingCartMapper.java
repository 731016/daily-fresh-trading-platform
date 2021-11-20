package com.zr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zr.pojo.CartVo;
import com.zr.pojo.ShoppingCart;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 购物车
 */
@Repository
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {
    /**
     * 查找购物车列表
     *
     * @param account
     * @return
     */
    List<CartVo> showCart(String account);
}
