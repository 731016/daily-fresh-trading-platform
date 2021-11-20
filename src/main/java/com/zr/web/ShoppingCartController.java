package com.zr.web;

import com.zr.pojo.CartVo;
import com.zr.pojo.ShoppingCart;
import com.zr.service.GoodsService;
import com.zr.service.ShoppingCartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class ShoppingCartController {
    @Resource
    private GoodsService service;

    @Resource
    private ShoppingCartService cartService;

    /**
     * 更多商品界面添加购物车
     *
     * @param request
     * @param goodsId
     * @return
     */
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


    /**
     * 商品详情界面添加购物车
     *
     * @param request
     * @param goodsId
     * @param goodsNumber
     * @return
     */
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

    /**
     * 首页购物车数量显示
     *
     * @param request
     * @param model
     * @return
     */
    @GetMapping("/toIndex")
    public String toIndex(HttpServletRequest request, Model model) {
        String login = request.getSession().getAttribute("login").toString();
        Integer cartCount = cartService.selectCountByAccount(login);
        model.addAttribute("cartCount", cartCount);
        return "/index";
    }

    /**
     * 进入购物车页面
     *
     * @param request
     * @param model
     * @return
     */
    @GetMapping("/toShoppingCart")
    public String toShoppingCart(HttpServletRequest request, Model model) {
        Object login1 = request.getSession().getAttribute("login");
        String login = login1.toString();
        List<CartVo> cartVos = cartService.showCart(login);
        model.addAttribute("cartVos",cartVos);
        return "/user/user_shop";
    }
}
