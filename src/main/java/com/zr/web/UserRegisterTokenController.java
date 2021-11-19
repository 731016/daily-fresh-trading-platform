package com.zr.web;

import com.alibaba.fastjson.JSON;
import com.zr.enums.UserState;
import com.zr.pojo.ShippingAddress;
import com.zr.pojo.User;
import com.zr.result.Result;
import com.zr.service.ShippingAddressService;
import com.zr.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class UserRegisterTokenController {
    @Resource
    private UserService userService;
    @Resource
    private ShippingAddressService shippingAddressService;

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
     * 用户注册
     *
     * @param request
     * @param user
     * @return
     */
    @RequestMapping("/user/register")
    public String register(HttpServletRequest request, @ModelAttribute("user") User user) {
        Boolean register = userService.register(user);
        if (register) {
            // 设置 用户状态 - 注册成功
            request.setAttribute("userState", UserState.getUserStateByValue(0));

            return "/user/login";
        }
        // 注册失败
        request.setAttribute("userState", UserState.getUserStateByValue(2));
        return "/user/register";
    }



}