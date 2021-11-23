package com.zr.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zr.mapper.GoodsMapper;
import com.zr.mapper.OrderMapper;
import com.zr.pojo.Goods;
import com.zr.pojo.GoodsOrder;
import com.zr.pojo.GoodsOrderVo;
import com.zr.service.OrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper mapper;

    @Resource
    private GoodsMapper goodsMapper;

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
        //根据传入订单里的商品id查找该商品
        Goods goods = goodsMapper.selectById(goodsOrder.getGoodsId());
        //判断订单购买数量是否小于商品库存
        if (goods.getInventory() >= goodsOrder.getGoodsNumber()) {
            //修改商品库存
            goods.setInventory(goods.getInventory() - goodsOrder.getGoodsNumber());
            //修改商品销量
            goods.setSales(goods.getSales() + goodsOrder.getGoodsNumber());
            goodsMapper.updateById(goods);
            //添加订单
            int i = mapper.insert(goodsOrder);
            if (i > 0) {
                return true;
            } else {
                return false;
            }
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
