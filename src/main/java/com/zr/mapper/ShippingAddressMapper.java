package com.zr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zr.pojo.ShippingAddress;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.springframework.stereotype.Repository;


/**
 * 收货地址
 */
@Repository
public interface ShippingAddressMapper extends BaseMapper<ShippingAddress> {

}
