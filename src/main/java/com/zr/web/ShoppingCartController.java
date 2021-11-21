package com.zr.web;

import com.zr.pojo.CartVo;
import com.zr.pojo.Goods;
import com.zr.pojo.GoodsOrder;
import com.zr.pojo.ShoppingCart;
import com.zr.service.GoodsService;
import com.zr.service.OrderService;
import com.zr.service.ShoppingCartService;
import org.springframework.data.redis.connection.SortParameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
        model.addAttribute("cartVos", cartVos);
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
    public Integer delShoppingCart(@PathVariable("goodsId") Integer goodsId, HttpServletRequest request) {
        String login = request.getSession().getAttribute("login").toString();
        ShoppingCart shoppingCart = cartService.selectOne(login, goodsId);
        boolean b = cartService.delCart(shoppingCart.getCartId());
        if (b) {
            return goodsId;
        } else {
            return -1;
        }
    }

    /**
     * 购物车结算生成订单
     *
     * @param goodsIds
     * @param request
     * @return
     */
    @PostMapping("/addOrder")
    @ResponseBody
    public Boolean addOrder(@RequestParam Integer[] goodsIds, HttpServletRequest request) {
        String login = request.getSession().getAttribute("login").toString();
        boolean b = false;
        for (Integer goodsId : goodsIds) {
            //查询当前购物车商品
            ShoppingCart shoppingCart = cartService.selectOne(login, goodsId);
            //查询当前商品
            Goods goods = service.selectOne(goodsId);
            //生成订单编号
            String orderId = UUID.randomUUID().toString().replace("-", "");
            //计算总价格
            Double totalPrice = goods.getPrice() * shoppingCart.getGoodsNumber();
            //创建订单对象
            GoodsOrder order = new GoodsOrder(orderId, login, goodsId, shoppingCart.getGoodsNumber(), new Date(), totalPrice);
            //添加订单
            b = orderService.addOrder(order);
            //判断是否添加成功，不成功则跳出循环
            if (b == false) {
                break;
            }
        }
        return b;
    }
}
