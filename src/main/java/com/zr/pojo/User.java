package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @TableId
    private String account;    //账号
    private String pwd;   //密码
    private String username;   //用户名
    private String email;      //邮箱
    private String phone;      //手机号
    private Integer shippingId;//收货地址id
    private Integer state; //账户状态
}
