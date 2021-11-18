package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zr.mapper.ShippingAddressMapper;
import com.zr.pojo.ShippingAddress;
import com.zr.service.ShippingAddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShippingAddressServiceImpl implements ShippingAddressService {
    @Resource
    private ShippingAddressMapper mapper;

    @Override
    public List<ShippingAddress> selectAll() {
        return mapper.selectList(null);
    }

    @Override
    public boolean addAddress(ShippingAddress shippingAddress) {
        int i = mapper.insert(shippingAddress);
        if (i>0){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public boolean delAddress(Integer shippingId) {
        int i = mapper.deleteById(shippingId);
        if (i>0){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public boolean updateAddress(ShippingAddress shippingAddress) {
        return false;
    }

    @Override
    public ShippingAddress selectOne(String shippingName) {
        QueryWrapper<ShippingAddress> wrapper = new QueryWrapper<>();
        wrapper.eq("shippingName",shippingName);
        return mapper.selectOne(wrapper);
    }
}