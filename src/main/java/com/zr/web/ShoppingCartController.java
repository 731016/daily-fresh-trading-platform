package com.zr.web;

import com.zr.pojo.ShoppingCart;
import com.zr.service.GoodsService;
import com.zr.service.ShoppingCartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/user")
public class ShoppingCartController {
    @Resource
    private GoodsService service;

    @Resource
    private ShoppingCartService cartService;

    @PostMapping("/addShoppingCart/{goodsId}")
    @ResponseBody
    public String addShoppingCart(@PathVariable("goodsId")Integer goodsId) {
        ShoppingCart shoppingCart = new ShoppingCart(null, "admin", goodsId, 1);
        boolean b = cartService.addCart(shoppingCart);
        if (b) {
            Integer cartCount = cartService.selectCountByAccount("admin");
            return cartCount.toString();
        }
        return "";
    }
}
