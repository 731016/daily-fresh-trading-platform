package com.zr.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShippingAddress {
    private Integer shoppingId;
    private String shippingName;
    private String shippingAddress;
    private Integer zip;
    private String phone;
}
