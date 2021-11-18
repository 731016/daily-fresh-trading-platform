package com.zr.web;

import com.zr.enums.UserState;
import com.zr.pojo.Order;
import com.zr.service.GoodsService;
import com.zr.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    OrderService orderService;

    @Resource
    GoodsService goodsService;

    @GetMapping("/addOrder/{goodsId}/{goodsNumber}")
    @Transactional
    public String addOrder(HttpServletRequest request,
                           Model model,
                           @PathVariable Integer goodsId,
                           @PathVariable Integer goodsNumber) {
        String login = request.getSession().getAttribute("login").toString();
        Date date = new Date();
        String orderId = UUID.randomUUID().toString().replace("-", "");
        Double price = goodsService.selectOne(goodsId).getPrice();
        Double totalPrice = price * goodsNumber;
        Order order = new Order(orderId, "login", goodsId, goodsNumber, date, totalPrice);
        boolean b = orderService.addOrder(order);
        if(b){
           return "/user/order";
        }else {
            request.setAttribute("userState", UserState.getUserStateByValue(8));
        }
        return "/user/order";
    }
}
