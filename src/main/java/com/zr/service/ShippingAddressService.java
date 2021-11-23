package com.zr.service;

import com.zr.pojo.ShippingAddress;

public interface ShippingAddressService {

    /**
     * 查询单个收货地址
     *
     * @return
     */
    ShippingAddress selectOne(String account);


    /**
     * 添加收货地址
     *
     * @param shippingAddress
     * @return
     */
    boolean addAddress(ShippingAddress shippingAddress);

    /**
     * 删除收货地址
     *
     * @param shippingId
     * @return
     */
    boolean delAddress(Integer shippingId);

}
