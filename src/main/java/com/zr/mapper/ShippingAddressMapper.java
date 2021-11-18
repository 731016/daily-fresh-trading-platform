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
//    @Insert("insert into shipping_address values (default ,#{shippingName},#{shippingAddress},#{zip},#{phone})")
//    @Options(useGeneratedKeys = true,keyProperty = "shippingId",keyColumn = "shipping_id")
    ShippingAddress insertAddress(ShippingAddress shippingAddress);
}
