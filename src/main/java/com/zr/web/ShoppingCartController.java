package com.zr.web;

import com.zr.pojo.CartVo;
import com.zr.pojo.DelCartResult;
import com.zr.pojo.Goods;
import com.zr.pojo.ShoppingCart;
import com.zr.service.GoodsService;
import com.zr.service.OrderService;
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

    @Resource
    private OrderService orderService;

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
        String login = request.getSession().getAttribute("login").toString();
        List<CartVo> cartVos = cartService.showCart(login);
        Integer count = cartService.selectCountByAccount(login);
        //根据账号查询所有剩余购物车对象
        List<ShoppingCart> shoppingCarts = cartService.selectAllByAccount(login);
        //计算剩余购物车商品总价
        Double totalPrice = 0.00;
        Goods goods = null;
        for (ShoppingCart cart : shoppingCarts) {
            goods = service.selectOne(cart.getGoodsId());
            totalPrice += goods.getPrice() * cart.getGoodsNumber();
        }
        model.addAttribute("cartVos", cartVos);
        model.addAttribute("count", count);
        model.addAttribute("totalPrice", totalPrice);
        return "/user/user_shop";
    }

    /**
     * 删除购物车
     *
     * @param goodsId
     * @param request
     * @return
     */
    @PostMapping("/delShoppingCart/{goodsId}")
    @ResponseBody
    public DelCartResult delShoppingCart(@PathVariable("goodsId") Integer goodsId, HttpServletRequest request) {
        //创建删除购物车返回值对象
        DelCartResult result = new DelCartResult();
        //获取账号
        String login = request.getSession().getAttribute("login").toString();
        //根据账号和商品id查询单个购物车对象
        ShoppingCart shoppingCart = cartService.selectOne(login, goodsId);
        //删除此购物车对象
        boolean b = cartService.delCart(shoppingCart.getCartId());
        //将是否删除成功的值传入返回对象
        result.setResult(b);
        result.setGoodsId(goodsId);
        //获取剩余购物车数量
        Integer count = cartService.selectCountByAccount(login);
        //传入返回值对象
        result.setCartCount(count);
        //根据账号查询所有剩余购物车对象
        List<ShoppingCart> shoppingCarts = cartService.selectAllByAccount(login);
        //计算剩余购物车商品总价
        Double totalPrice = 0.00;
        Goods goods = null;
        for (ShoppingCart cart : shoppingCarts) {
            goods = service.selectOne(cart.getGoodsId());
            totalPrice += goods.getPrice() * cart.getGoodsNumber();
        }
        //传入返回值
        result.setTotalPrice(totalPrice);
        return result;
    }

    /**
     * 所有商品页面购物车数量显示
     *
     * @param request
     * @return
     */
    @PostMapping("/cartCountShow")
    @ResponseBody
    public Integer cartCountShow(HttpServletRequest request) {
        //获取账号
        Object login = request.getSession().getAttribute("login");
        //判断是否登录，登录则获取购物车数量
        if (login != null) {
            String s = login.toString();
            return cartService.selectCountByAccount(s);
        } else {
            return 0;
        }
    }

    @PostMapping("/changeCart")
    @ResponseBody
    public void changeCart(Integer goodsId){

    }
}
