package com.zr.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private String orderId;
    private String account;
    private Integer goodId;
    private Integer goodNumber;
    private  Data orderDate;
    private Double totalPrice;

}
