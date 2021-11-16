package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zr.mapper.GoodsMapper;
import com.zr.pojo.Goods;
import com.zr.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Resource
    private GoodsMapper mapper;

    @Override
    public PageInfo<Goods> selectPage(Integer num, Integer pageSize, QueryWrapper<Goods> wrapper) {
        PageHelper.startPage(num, pageSize);
        List<Goods> productList = mapper.selectList(wrapper);
        PageInfo<Goods> pageInfo = new PageInfo<>(productList, 3);
        return pageInfo;
    }

    @Override
    public List<Goods> selectSortSalesByType(Integer typeId, Integer goodsNum) {
        QueryWrapper<Goods> wrapper = new QueryWrapper<>();
        wrapper.eq("typeId", typeId).orderByDesc("sales");
        List<Goods> goods = mapper.selectList(wrapper);
        if (goods.size() <= goodsNum) {
            return goods;
        }
        return goods.subList(0, goodsNum);
    }


}
