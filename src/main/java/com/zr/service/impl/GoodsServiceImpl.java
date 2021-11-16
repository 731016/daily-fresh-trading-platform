package com.zr.service.impl;

import com.zr.mapper.GoodsMapper;
import com.zr.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Resource
    private GoodsMapper mapper;
}
