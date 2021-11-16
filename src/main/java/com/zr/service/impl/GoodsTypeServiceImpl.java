package com.zr.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
        try {
            if (strType == null || strType.isBlank()) {
                List<GoodsType> goodsTypes = mapper.selectList(null);
                ObjectMapper om = new ObjectMapper();
                strType = om.writeValueAsString(goodsTypes);
                redisTemplate.opsForValue().set("goodsType",strType);
            }
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return strType;
    }
}
