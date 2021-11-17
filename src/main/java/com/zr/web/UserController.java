package com.zr.web;

import com.zr.enums.UserState;
import com.zr.result.Result;
import com.zr.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @Resource
    private UserService userService;

    /**
     * 查询账户是否已注册
     *
     * @param account
     * @return
     */
    @RequestMapping("/user/register_accountExist")
    @ResponseBody
    public Result registerAccExist(@RequestParam("account") String account) {
        Boolean accExist = userService.registerAccExist(account);
        Result result = new Result();
        if (accExist) {
            result.setMsg("用户名已存在");
            return result;
        }
        result.setMsg("用户名可以使用");
        return result;
    }

    @RequestMapping("/user/toLogin")
    public String toLogin() {
        return "/user/login";
    }

    /**
     * 用户登录
     *
     * @param request
     * @param account
     * @param pwd
     * @return
     */
    @RequestMapping("/user/login")
    public String login(HttpServletRequest request, @RequestParam("account") String account, @RequestParam("pwd") String pwd) {
        Boolean login = userService.login(account, pwd);
        if (login) {
            request.setAttribute("userState", UserState.getUserStateByValue(1));
            // 设置已登录的用户账号 session
            request.setAttribute("login", account);
            return "/index";
        }
        request.setAttribute("userState", UserState.getUserStateByValue(3));
        return "/user/login";
    }

    @RequestMapping("/user/exit")
    public String exit(HttpServletRequest request) {
        request.getSession().invalidate();
        return "/user/login";
    }
}
