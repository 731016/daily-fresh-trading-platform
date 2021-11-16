package com.zr.web;

import com.zr.enums.UserState;
import com.zr.pojo.User;
import com.zr.result.Result;
import com.zr.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
public class UserController {
    @Resource
    private UserService userService;

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

    @RequestMapping("/user/login")
    public String login(Model model, @RequestParam("account") String account, @RequestParam("pwd") String pwd) {
        Boolean login = userService.login(account, pwd);
        if (login) {
            model.addAttribute("userState", UserState.getUserStateByValue(1));
            return "/index";
        }
        model.addAttribute("userState", UserState.getUserStateByValue(3));
        return "/user/login";
    }
}
