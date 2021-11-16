package com.zr.service.impl;

import com.zr.mapper.HistoryMapper;
import com.zr.service.HistoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class HistoryServiceImpl implements HistoryService {
    @Resource
    private HistoryMapper mapper;
}
