package com.zr.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private String orderId;
    private String account;
    private Integer goodId;
    private Integer goodNumber;
    private Date orderDate;
    private Double totalPrice;

}
