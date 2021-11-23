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
        //定义页号以及页面大小
        PageHelper.startPage(num, pageSize);
        //根据传入条件查询返回商品集合
        List<Goods> productList = mapper.selectList(wrapper);
        //创建pageInfo对象并设置显示的页号
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
        //定义商品类型查询条件（查询对应商品类型，根据销量倒序排序）
        QueryWrapper<Goods> wrapper = new QueryWrapper<>();
        wrapper.eq("type_id", typeId).orderByDesc("sales");
        //查询商品装入集合
        List<Goods> goods = mapper.selectList(wrapper);
        //判断集合长度小于需要显示的数量则直接返回集合，否则截取对应长度的集合
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
        //根据商品销量倒序排序
        QueryWrapper<Goods> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("sales");
        List<Goods> goods = mapper.selectList(null);
        //判断集合长度小于需要显示的数量则直接返回集合，否则截取对应长度的集合
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
        //传入已排序商品id集合，根据集合查询对应商品对象
        List<Goods> goodsList = new ArrayList<>();
        for (Integer id : list) {
            Goods goods = mapper.selectById(id);
            goodsList.add(goods);
        }
        return goodsList;
    }
}
