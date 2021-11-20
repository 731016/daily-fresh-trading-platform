package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingCart {
    @TableId
    private Integer cartId;     //购物车编号
    private String account;     //账号
    private Integer goodsId;    //商品id
    private Integer goodsNumber;//商品数量
}
