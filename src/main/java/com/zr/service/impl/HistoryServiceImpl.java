package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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

    /**
     * 查询单个浏览记录
     *
     * @param goodsId
     * @return
     */
    @Override
    public History queryOne(Integer goodsId) {
        QueryWrapper<History> wrapper = new QueryWrapper<>();
        wrapper.eq("goodsId", goodsId);
        return mapper.selectOne(wrapper);
    }

    /**
     * 根据用户查询浏览记录
     *
     * @param account
     * @return
     */
    @Override
    public List<History> selectPage(String account) {
        QueryWrapper<History> wrapper = new QueryWrapper<>();
        wrapper.eq("account", account);
        return mapper.selectList(wrapper);
    }
}
