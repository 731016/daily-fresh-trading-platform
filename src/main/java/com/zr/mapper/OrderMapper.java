package com.zr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zr.pojo.GoodsOrder;
import org.springframework.stereotype.Repository;

/**
 * 订单
 */
@Repository
public interface OrderMapper extends BaseMapper<GoodsOrder> {

}
