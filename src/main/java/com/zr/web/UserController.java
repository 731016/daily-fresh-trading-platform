package com.zr.web;

import com.zr.enums.UserState;
import com.zr.result.Result;
import com.zr.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerAdapter;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    public String login(HttpServletRequest request,
                        HttpServletResponse response,
                        @RequestParam("account") String account,
                        @RequestParam("pwd") String pwd,
                        @RequestParam(value = "rememberAccount", required = false) String rememberAccount
    ) {
        Boolean login = userService.login(account, pwd);
        if (login) {
            request.getSession().setAttribute("userState", UserState.getUserStateByValue(1));
            // 设置已登录的用户账号 session
            request.getSession().setAttribute("login", account);
            // 记住密码复选项 被选中
            if (StringUtils.equals(rememberAccount, "remember")) {
                Cookie cookie = new Cookie("rememberAccount", account);
                response.addCookie(cookie);
            }
            return "/index";
        }
        request.getSession().setAttribute("userState", UserState.getUserStateByValue(3));
        return "/user/login";
    }

    /**
     * 用户注销
     *
     * @param request
     * @return
     */
    @RequestMapping("/user/exit")
    public String exit(HttpServletRequest request) {
        request.getSession().invalidate();
        return "/user/login";
    }



    /**
     * 忘记密码，修改密码
     * @param request
     * @return
     */
    @RequestMapping("/user/forgetpwd")
    public String forgetpwd(HttpServletRequest request) {

        // 修改密码后，自动退出登录
        request.getSession().invalidate();
        return "/user/login";
    }
}
