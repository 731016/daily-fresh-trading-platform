package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zr.mapper.GoodsMapper;
import com.zr.pojo.Goods;
import com.zr.service.GoodsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class GoodsServiceImpl implements GoodsService {
    @Resource
    private GoodsMapper mapper;

    /**
     * 查询该类型所有商品(分页)
     *
     * @param num
     * @param pageSize
     * @param wrapper
     * @return
     */
    @Override
    public PageInfo<Goods> selectPage(Integer num, Integer pageSize, QueryWrapper<Goods> wrapper) {
        PageHelper.startPage(num, pageSize);
        List<Goods> productList = mapper.selectList(wrapper);
        PageInfo<Goods> pageInfo = new PageInfo<>(productList, 3);
        return pageInfo;
    }

    /**
     * 查询该类型销量排名前多少的商品
     *
     * @param typeId
     * @param goodsNum
     * @return
     */
    @Override
    public List<Goods> selectSortSalesByType(Integer typeId, Integer goodsNum) {
        QueryWrapper<Goods> wrapper = new QueryWrapper<>();
        wrapper.eq("type_id", typeId).orderByDesc("sales");
        List<Goods> goods = mapper.selectList(wrapper);
        if (goods.size() <= goodsNum) {
            return goods;
        }
        return goods.subList(0, goodsNum);
    }


    /**
     * 查询销量排名前多少的商品
     *
     * @param goodsNum
     * @return
     */
    @Override
    public List<Goods> selectSortSalesByType(Integer goodsNum) {
        List<Goods> goods = mapper.selectList(null);
        if (goods.size() <= goodsNum) {
            return goods;
        }
        return goods.subList(0, goodsNum);
    }

    /**
     * 查询单个商品
     *
     * @param goodsId
     * @return
     */
    @Override
    public Goods selectOne(Integer goodsId) {
        return mapper.selectById(goodsId);
    }

    /**
     * 查询集合里面对应的商品
     *
     * @param list
     * @return
     */
    @Override
    public List<Goods> selectlimit5ListGoods(List<Integer> list) {
        List<Goods> goodsList = new ArrayList<>();
        for (Integer id : list) {
            Goods goods = mapper.selectById(id);
            goodsList.add(goods);
        }
        return goodsList;
    }
}
