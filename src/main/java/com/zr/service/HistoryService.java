package com.zr.service;

import com.zr.pojo.History;

import java.util.HashSet;
import java.util.List;

public interface HistoryService {
    /**
     * 查询浏览记录
     *
     * @return
     */
    List<History> selectPage();

    List<History> selectPage(String account);

    /**
     * 查询单个浏览记录
     *
     * @return
     */
    History queryOne(Integer goodsId,String account);

    /**
     * 添加浏览记录
     *
     * @param history
     * @return
     */
    boolean addHistory(History history);

    /**
     * 修改浏览记录
     *
     * @param history
     * @return
     */
    boolean updateHistory(History history);

    /**
     * 删除浏览记录
     *
     * @param historyId
     * @return
     */
    boolean delHistory(Integer historyId);
}
