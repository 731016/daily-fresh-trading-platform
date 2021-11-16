package com.zr.service;

import com.zr.pojo.History;

import java.util.List;

public interface HistoryService {
    //查询浏览记录
    List<History> selectPage();

    //增加浏览记录
    boolean addHistory(History history);

    //删除浏览记录
    boolean delHistory(Integer historyId);
}
