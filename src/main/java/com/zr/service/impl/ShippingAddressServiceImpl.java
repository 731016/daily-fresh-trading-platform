package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zr.mapper.ShippingAddressMapper;
import com.zr.pojo.ShippingAddress;
import com.zr.service.ShippingAddressService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    public ShippingAddress addAddress(ShippingAddress shippingAddress) {
        ShippingAddress address = mapper.insertAddress(shippingAddress);
        System.out.println(address);
        return address;

    }

    @Override
    public boolean delAddress(Integer shippingId) {
        int i = mapper.deleteById(shippingId);
        if (i > 0) {
            return true;
        } else {
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
        wrapper.eq("shipping_name", shippingName);
        return mapper.selectOne(wrapper);
    }
}