package com.zr.service.impl;

import com.zr.mapper.ShippingAddressMapper;
import com.zr.service.ShippingAddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ShippingAddressServiceImpl implements ShippingAddressService {
    @Resource
    private ShippingAddressMapper mapper;
}
