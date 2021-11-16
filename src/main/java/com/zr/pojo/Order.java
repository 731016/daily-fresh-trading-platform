package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    @TableId
    private String orderId;    //订单号
    private String account;    //账号
    private Integer goodsId;    //购买商品编号
    private Integer goodsNumber;//购买商品数量
    private Date orderDate;    //下单日期
    private Double totalPrice; //总价格
}
