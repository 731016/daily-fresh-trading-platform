package com.zr.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DelCartResult {
    private Double totalPrice; //返回计算的购物车剩余商品总数
    private Integer cartCount;//返回购物车剩余商品数量
    private Boolean result;        //返回是否添加成功
    private Integer goodsId;  //返回删除的用户ID
}
