package com.zr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zr.pojo.GoodsOrder;
import com.zr.pojo.GoodsOrderVo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 订单
 */
@Repository
public interface OrderMapper extends BaseMapper<GoodsOrder> {
    /**
     * 查询指定用户的订单信息(分页)
     * @return
     */
    List<GoodsOrderVo> queryOrderAndGoods(String account);
}
