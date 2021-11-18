package com.zr.service.impl;

import com.alibaba.fastjson.JSON;
import com.zr.mapper.GoodsTypeMapper;
import com.zr.pojo.GoodsType;
import com.zr.service.GoodsTypeService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {
    @Resource
    private GoodsTypeMapper mapper;

    @Resource
    RedisTemplate<String, String> redisTemplate;

    @Override
    public String selectAllRedis() {
        String strType = redisTemplate.opsForValue().get("goodsType");
        if (strType == null || strType.isBlank()) {
            List<GoodsType> goodsTypes = mapper.selectList(null);
            strType = JSON.toJSONString(goodsTypes);
            redisTemplate.opsForValue().set("goodsType", strType);
        }
        return strType;
    }

    /**
     * 查询单个商品类型
     *
     * @param typeId
     * @return
     */
    @Override
    public GoodsType selectOne(Integer typeId) {
        return mapper.selectById(typeId);
    }

}
