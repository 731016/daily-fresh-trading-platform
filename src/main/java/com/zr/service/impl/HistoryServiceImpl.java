package com.zr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zr.mapper.HistoryMapper;
import com.zr.pojo.History;
import com.zr.service.HistoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {
    @Resource
    private HistoryMapper mapper;

    /**
     * 查询单个浏览记录
     *
     * @param goodsId
     * @return
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public History queryOne(Integer goodsId, String account) {
        //根据账号以及商品查询对应浏览记录数据
        QueryWrapper<History> wrapper = new QueryWrapper<>();
        wrapper.eq("goods_id", goodsId).eq("account", account);
        return mapper.selectOne(wrapper);
    }

    /**
     * 添加浏览记录
     *
     * @param history
     * @return
     */
    @Override
    @Transactional
    public boolean addHistory(History history) {
        int i = mapper.insert(history);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 修改浏览记录
     *
     * @param history
     * @return
     */
    @Override
    @Transactional
    public boolean updateHistory(History history) {
        int i = mapper.updateById(history);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 删除浏览记录
     *
     * @param historyIds
     * @return
     */
    @Override
    @Transactional
    public boolean delHistory(List<Integer> historyIds) {
        int i = 0;
        if (historyIds.size() > 0) {
            i = mapper.deleteBatchIds(historyIds);
        }
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 查询浏览记录
     *
     * @return
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<History> selectPage() {
        return mapper.selectList(null);
    }

    /**
     * 根据用户查询浏览记录
     *
     * @param account
     * @return
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<History> selectPage(String account) {
        QueryWrapper<History> wrapper = new QueryWrapper<>();
        wrapper.eq("account", account);
        return mapper.selectList(wrapper);
    }
}
