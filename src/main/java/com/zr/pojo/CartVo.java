package com.zr.pojo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVo extends ShoppingCart {
    private Goods goods;
}
