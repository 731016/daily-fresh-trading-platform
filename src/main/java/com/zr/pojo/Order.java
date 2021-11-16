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
    @TableId(value = "orderId")
    private String orderId;    //订单号
    private String account;    //账号
    private Integer goodId;    //购买商品编号
    private Integer goodNumber;//购买商品数量
    private Date orderDate;    //下单日期
    private Double totalPrice; //总价格
}
