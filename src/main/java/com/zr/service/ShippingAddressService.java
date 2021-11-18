package com.zr.service;

import com.zr.pojo.ShippingAddress;

import java.util.List;

public interface ShippingAddressService {
    //查询收货地址
    List<ShippingAddress> selectAll();

    /**
     * 查询单个收货地址
     * @return
     */
    ShippingAddress selectOne(String shippingName);

    //添加收货地址
    boolean addAddress(ShippingAddress shippingAddress);

    //删除收货地址
    boolean delAddress(Integer shippingId);

    //修改收货地址
    boolean updateAddress(ShippingAddress shippingAddress);
}
