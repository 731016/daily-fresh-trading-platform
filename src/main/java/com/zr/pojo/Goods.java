package com.zr.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private Integer goodId;
    private String goodName;
    private String describe;
    private Integer inventory;
    private Double price;
    private Integer goodType;
    private Integer sales;
    private String picture;
    private String originPlace;
    private Double unit;
}
