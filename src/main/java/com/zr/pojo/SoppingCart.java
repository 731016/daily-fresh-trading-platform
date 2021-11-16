package com.zr.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SoppingCart {
    private Integer cartId;
    private String account;
    private String goodId;
    private Integer goodNumber;
}
