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
    @Transactional
    public boolean addAddress(ShippingAddress shippingAddress) {
        int insertFlag = 0;
        ShippingAddress address = selectOne(shippingAddress.getAccount());
        // 不存在插入数据
        if (address == null) {
            insertFlag = mapper.insert(shippingAddress);
        } else {
            // 存在update数据
            QueryWrapper<ShippingAddress> qw = new QueryWrapper<>();
            qw.eq("account", shippingAddress.getAccount());
            insertFlag = mapper.update(shippingAddress, qw);
        }
        if (insertFlag > 0) {
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public boolean delAddress(Integer shippingId) {
        int i = mapper.deleteById(shippingId);
        if (i > 0) {
            return true;
        } else {
            return false;
        }

    }

    @Override
    @Transactional
    public boolean updateAddress(ShippingAddress shippingAddress) {
        return false;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public ShippingAddress selectOne(String account) {
        System.out.println("account:" + account);
        QueryWrapper<ShippingAddress> wrapper = new QueryWrapper<>();
        wrapper.eq("account", account);
        return mapper.selectOne(wrapper);
    }

}