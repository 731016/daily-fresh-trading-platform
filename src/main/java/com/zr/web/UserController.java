package com.zr.web;

import com.zr.enums.UserState;
import com.zr.pojo.User;
import com.zr.result.Result;
import com.zr.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/user/register")
    public String register(Model model, @ModelAttribute("user") User user){
        Boolean register = userService.register(user);
        UserState state = UserState.getUserStateByValue(0);
        // 设置 用户状态 - 注册成功
        model.addAttribute("login", state);

        Result result = new Result();
        result.setMsg(state.getName());
        // 存储结果
        model.addAttribute("result",result);
        return "/index";
    }
}
