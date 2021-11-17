package com.zr.web;

import com.zr.enums.UserState;
import com.zr.pojo.User;
import com.zr.result.Result;
import com.zr.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class UserRegAndLogController {
    @Resource
    private UserService userService;

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
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("/user/register")
    public String register(Model model, @ModelAttribute("user") User user) {
        Boolean register = userService.register(user);
        if (register) {
            // 设置 用户状态 - 注册成功
            model.addAttribute("userState", UserState.getUserStateByValue(0));

            return "/user/login";
        }
        // 注册失败
        model.addAttribute("userState", UserState.getUserStateByValue(2));
        return "/user/register";
    }



    /**
     * 用户登录
     *
     * @param model
     * @param account
     * @param pwd
     * @return
     */
    @RequestMapping("/user/login")
    public String login(Model model, @RequestParam("account") String account, @RequestParam("pwd") String pwd) {
        Boolean login = userService.login(account, pwd);
        if (login) {
            model.addAttribute("userState", UserState.getUserStateByValue(1));
            // 设置已登录的用户账号 session
            model.addAttribute("login", account);
            return "/index";
        }
        model.addAttribute("userState", UserState.getUserStateByValue(3));
        return "/user/login";
    }
}