package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zr.mapper.OrderMapper;
import com.zr.pojo.Goods;
import com.zr.pojo.GoodsOrder;
import com.zr.pojo.GoodsOrderVo;
import com.zr.service.OrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper mapper;


    /**
     * 查询订单信息(分页)
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public PageInfo<GoodsOrderVo> selectPage(String account, Integer num, Integer pageSize) {
        PageHelper.startPage(num, pageSize);
        List<GoodsOrderVo> goodsOrderVo = mapper.queryOrderAndGoods(account);
        PageInfo<GoodsOrderVo> pageInfo = new PageInfo<>(goodsOrderVo, 3);
        return pageInfo;
    }

    /**
     * 增加订单
     *
     * @param goodsOrder
     * @return
     */
    @Override
    @Transactional
    public boolean addOrder(GoodsOrder goodsOrder) {
        int i = mapper.insert(goodsOrder);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 删除订单
     *
     * @param orderId
     * @return
     */
    @Override
    @Transactional
    public boolean delOrder(String orderId) {
        int delFlag = mapper.deleteById(orderId);
        if (delFlag > 0) {
            return true;
        }
        return false;
    }
}
