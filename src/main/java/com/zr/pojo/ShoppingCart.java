package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingCart {
    @TableId(value = "cartId")
    private Integer cartId;    //购物车编号
    private String account;    //账号
    private String goodId;     //商品id（用逗号隔开的字符串）
    private Integer goodNumber;//商品数量
}
