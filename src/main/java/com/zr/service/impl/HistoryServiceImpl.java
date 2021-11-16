package com.zr.service.impl;

import com.zr.mapper.HistoryMapper;
import com.zr.pojo.History;
import com.zr.service.HistoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {
    @Resource
    private HistoryMapper mapper;

    @Override
    public List<History> selectPage() {
        return mapper.selectList(null);
    }

    @Override
    public boolean addHistory(History history) {
        int i = mapper.updateById(history);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean delHistory(Integer historyId) {
        int i = mapper.deleteById(historyId);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }
}
