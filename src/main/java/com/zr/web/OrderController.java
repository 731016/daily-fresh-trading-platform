package com.zr.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.zr.enums.UserState;
import com.zr.pojo.Goods;
import com.zr.pojo.GoodsOrder;
import com.zr.pojo.GoodsOrderVo;
import com.zr.pojo.ShoppingCart;
import com.zr.service.GoodsService;
import com.zr.service.OrderService;
import com.zr.service.ShoppingCartService;
import com.zr.service.impl.SynOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class OrderController {
    @Resource
    private OrderService orderService;

    @Resource
    private GoodsService goodsService;

    @Resource
    private ShoppingCartService cartService;

    @Resource
    private SynOrder synOrder;


    /**
     * 商品详情界面直接购买添加订单
     *
     * @param request
     * @param model
     * @param goodsId
     * @param goodsNumber
     * @return
     */
    @GetMapping("/addOrder/{goodsId}/{goodsNumber}")
    public String addOrder(HttpServletRequest request,
                           Model model,
                           @PathVariable Integer goodsId,
                           @PathVariable Integer goodsNumber) throws Exception {
        //获取账号
        String login = request.getSession().getAttribute("login").toString();
        //定义当前时间对象
        Date date = new Date();
        //生成订单编号
        String orderId = UUID.randomUUID().toString().replace("-", "");
        //获取商品价格
        Double price = goodsService.selectOne(goodsId).getPrice();
        //计算总价格
        Double totalPrice = price * goodsNumber;
        //创建订单对象
        GoodsOrder order = new GoodsOrder(orderId, login, goodsId, goodsNumber, date, totalPrice);
        //生成订单
        boolean b = synOrder.synAddOrder(order);
        if (b) {
            return "/user/order";
        } else {
            request.setAttribute("userState", UserState.getUserStateByValue(10));
        }
        return "/user/order";
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
    public Boolean addOrder(@RequestParam Integer[] goodsIds, HttpServletRequest request) throws Exception {
        String login = request.getSession().getAttribute("login").toString();
        boolean b = false;
        for (Integer goodsId : goodsIds) {
            //查询当前购物车商品
            ShoppingCart shoppingCart = cartService.selectOne(login, goodsId);
            //查询当前商品
            Goods goods = goodsService.selectOne(goodsId);
            //生成订单编号
            String orderId = UUID.randomUUID().toString().replace("-", "");
            //计算总价格
            Double totalPrice = goods.getPrice() * shoppingCart.getGoodsNumber();
            //创建订单对象
            GoodsOrder order = new GoodsOrder(orderId, login, goodsId, shoppingCart.getGoodsNumber(), new Date(), totalPrice);
            //添加订单
            b = synOrder.synAddOrder(order);
            //判断是否添加成功，不成功则跳出循环
            if (!b) {
                break;
            }
        }
        return b;
    }

    /**
     * 分页查询订单信息
     *
     * @param request
     * @param currentPageNum
     * @return
     */
    @PostMapping("/order")
    @ResponseBody
    public PageInfo<GoodsOrderVo> selectOrderPage(HttpServletRequest request, @RequestParam Integer currentPageNum) {
        QueryWrapper<GoodsOrder> wrapper = new QueryWrapper<>();
        String account = request.getSession().getAttribute("login").toString();
        wrapper.eq("account", account);
        PageInfo<GoodsOrderVo> orderPageInfo = orderService.selectPage(account, currentPageNum, 5);
        return orderPageInfo;
    }

    /**
     * 删除订单
     * @param orderId
     * @return
     */
    @GetMapping(value = {"/delOrder/{orderId}", "/delOrder"})
    public String delOrder(@PathVariable(value = "orderId", required = false) String orderId) {
        boolean delFlag = orderService.delOrder(orderId);
        return "/user/order";
    }
}
