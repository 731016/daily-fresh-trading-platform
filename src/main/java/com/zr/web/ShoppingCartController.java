package com.zr.web;

import com.zr.pojo.ShoppingCart;
import com.zr.service.GoodsService;
import com.zr.service.ShoppingCartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class ShoppingCartController {
    @Resource
    private GoodsService service;

    @Resource
    private ShoppingCartService cartService;

    @PostMapping("/addShoppingCart/{goodsId}")
    @ResponseBody
    public String addShoppingCart(HttpServletRequest request, @PathVariable("goodsId") Integer goodsId) {
        String login = request.getSession().getAttribute("login").toString();
        if (login != null) {
            ShoppingCart shoppingCart = new ShoppingCart(null, login, goodsId, 1);
            boolean b = cartService.addCart(shoppingCart);
            if (b) {
                Integer cartCount = cartService.selectCountByAccount(login);
                return cartCount.toString();
            }
        }
        return "-1";
    }

    @PostMapping("/addShoppingCart/{goodsId}/{goodsNumber}")
    @ResponseBody
    public String addShoppingCart(HttpServletRequest request, @PathVariable("goodsId") Integer goodsId, @PathVariable("goodsNumber") Integer goodsNumber) {
        Object login1 = request.getSession().getAttribute("login");
        if (login1 != null) {
            String login = login1.toString();
            ShoppingCart shoppingCart = new ShoppingCart(null, login, goodsId, goodsNumber);
            boolean b = cartService.addCart(shoppingCart);
            if (b) {
                Integer cartCount = cartService.selectCountByAccount(login);
                return cartCount.toString();
            }
        }
        return "-1";
    }

    @GetMapping("/toIndex")
    public String toIndex(HttpServletRequest request, Model model) {
        String login = request.getSession().getAttribute("login").toString();
        Integer cartCount = cartService.selectCountByAccount(login);
        model.addAttribute("cartCount", cartCount);
        return "/index";
    }
}
