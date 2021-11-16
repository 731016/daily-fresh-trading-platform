package com.zr.service.impl;

import com.zr.mapper.ShoppingCartMapper;
import com.zr.pojo.ShoppingCart;
import com.zr.service.ShoppingCartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Wrapper;
import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Resource
    private ShoppingCartMapper mapper;

    @Override
    public List<ShoppingCart> selectAll() {

       return mapper.selectList(null);
    }

    @Override
    public Integer selectCount() {
        int i = Math.toIntExact(mapper.selectCount(null));
        return i;
    }

    @Override
    public boolean addCart(ShoppingCart shoppingCart) {
        int i =  mapper.updateById(shoppingCart);
        if (i>0){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public boolean delCart(Integer shoppingId) {
        int i = mapper.deleteById(shoppingId);
        if (i>0){
            return true;
        }else {
            return false;
        }

    }

}
