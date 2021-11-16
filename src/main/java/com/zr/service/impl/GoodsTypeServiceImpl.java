package com.zr.service.impl;

import com.zr.mapper.GoodsTypeMapper;
import com.zr.service.GoodsTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {
    @Resource
    private GoodsTypeMapper mapper;
}
