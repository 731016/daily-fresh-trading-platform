package com.zr.service.impl;

import com.zr.mapper.ShoppingCartMapper;
import com.zr.pojo.ShoppingCart;
import com.zr.service.ShoppingCartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Resource
    private ShoppingCartMapper mapper;

    @Override
    public List<ShoppingCart> selectAll() {
        return null;
    }

    @Override
    public Integer selectCount() {
        return null;
    }

    @Override
    public boolean addCart(ShoppingCart shoppingCart) {
        return false;
    }

    @Override
    public boolean delCart(Integer shoppingId) {
        return false;
    }

}
