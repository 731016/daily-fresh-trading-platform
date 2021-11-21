package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zr.mapper.ShoppingCartMapper;
import com.zr.pojo.CartVo;
import com.zr.pojo.ShoppingCart;
import com.zr.service.ShoppingCartService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Resource
    private ShoppingCartMapper mapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<ShoppingCart> selectAllByAccount(String account) {
        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        wrapper.eq("account", account);
        return mapper.selectList(wrapper);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Integer selectCountByAccount(String account) {
        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        wrapper.eq("account", account);
        int i = Math.toIntExact(mapper.selectCount(wrapper));
        return i;
    }

    @Override
    @Transactional
    public boolean addCart(ShoppingCart shoppingCart) {
        int i = 0;
        //根据传入的购物车对象的账号查找当前账号是否有该商品在购物车里
        ShoppingCart shoppingCart1 = selectOne(shoppingCart);
        //如果查找不为空，则进行修改操作；为空则进行添加操作
        if (shoppingCart1 != null) {
            shoppingCart.setGoodsNumber(shoppingCart1.getGoodsNumber() + shoppingCart.getGoodsNumber());
            shoppingCart.setCartId(shoppingCart1.getCartId());
            i = mapper.updateById(shoppingCart);
        } else {
            i = mapper.insert(shoppingCart);
        }
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional
    public boolean delCart(Integer shoppingId) {
        int i = mapper.deleteById(shoppingId);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public ShoppingCart selectOne(ShoppingCart shoppingCart) {
        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        wrapper.eq("account", shoppingCart.getAccount()).eq("goods_id", shoppingCart.getGoodsId());
        return mapper.selectOne(wrapper);
    }

    /**
     * 查找购物车列表
     *
     * @param account
     * @return
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<CartVo> showCart(String account) {
        return mapper.showCart(account);
    }
}
