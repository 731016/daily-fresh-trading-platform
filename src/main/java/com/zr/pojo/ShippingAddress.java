package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShippingAddress {
    @TableId(value = "shippingId")
    private Integer shippingId;    //收货地址编号
    private String shippingName;   //收件人姓名
    private String shippingAddress;//收货地址
    private Integer zip;           //邮政编码
    private String phone;          //收件人手机号
}
