package com.zr.result;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result<T> {
    /**
     * 返回消息
     */
    private String msg;
    /**
     * 返回对象类型list集合
     */
    private List<T> resultListObject;
    /**
     * 返回json类型
     */
    private String resultListJson;
}
