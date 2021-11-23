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

    /**
     * 处理token 对比，在所有handle方法之前执行
     *
     * @param request
     */
    @ModelAttribute
    private void isRepeatSubmit(HttpServletRequest request) {
        boolean flag = false;
        String client_token = request.getParameter("token");
        //如果用户提交的表单数据中没有token，则是重复提交
        if (client_token == null) {
            flag = true;
        }
        //取出存储在Session中的token
        String server_token = (String) request.getSession().getAttribute("token");
        //如果当前用户的Session中不存在Token，则是重复提交
        if (server_token == null) {
            flag = true;
        }
        //存储在Session中的Token)与表单提交的Token不同，则是重复提交
        if (!client_token.equals(server_token)) {
            flag = true;
        }

        if (flag) {
            System.out.println("请不要重复提交!!!");
            return;
        }
        request.getSession().removeAttribute("token");//移除session中的token
    }

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
                           @PathVariable Integer goodsNumber) {
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
        boolean b = orderService.addOrder(order);
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
    public Boolean addOrder(@RequestParam Integer[] goodsIds, HttpServletRequest request) {
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
            b = orderService.addOrder(order);
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

    @GetMapping(value = {"/delOrder/{orderId}","/user/delOrder"})
    public String delOrder(@PathVariable(value = "orderId",required = false)String orderId){
        boolean delFlag = orderService.delOrder(orderId);
        return "/user/order";
    }
}
