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
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.HandlerAdapter;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private ShippingAddressService shippingAddressService;

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

    /**
     * 记住用户名操作,获取cookie信息，存在session
     *
     * @param request
     * @return
     */
    @RequestMapping("/user/toLogin")
    public String toLogin(HttpServletRequest request, @CookieValue(value = "rememberAccount", required = false) String rememberAccount) {
//        Cookie[] cookies = request.getCookies();
//        for (Cookie cookie : cookies) {
//            if (StringUtils.equals(cookie.getName(), "rememberAccount")) {
//                System.out.println(cookie.getName());
//                request.getSession().setAttribute("rememberAccount", cookie.getValue());
//            }
//        }
        System.out.println("cookie:" + rememberAccount);
        request.getSession().setAttribute("rememberAccount", rememberAccount);
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
            request.setAttribute("userState", UserState.getUserStateByValue(1));
            // 设置已登录的用户账号 session
            request.getSession().setAttribute("login", account);
            // 查询用户
            User user = userService.queryUser(account);
            // 存储session
            request.getSession().setAttribute("user", user);

            // 记住密码复选项 被选中
            System.out.println(rememberAccount);
            if (StringUtils.equals(rememberAccount, "remember")) {
                Cookie cookie = new Cookie("rememberAccount", account);
                response.addCookie(cookie);
            }
            return "/index";
        }
        request.setAttribute("userState", UserState.getUserStateByValue(7));
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
        return "redirect:/user/toLogin";
    }

    /**
     * 忘记密码，修改密码
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/user/forgetpwd")
    public String forgetpwd(HttpServletRequest request, @ModelAttribute User user) throws IOException {
        System.out.println("进入修改密码");
        System.out.println(user);
        // 查询用户
        User queryUser = userService.queryUser(user.getAccount());
        if (queryUser != null) {
            // 获取原密码与当前密码比较
            if (StringUtils.equals(queryUser.getPwd(), DigestUtils.md5Hex(user.getPwd()))) {
                request.setAttribute("userState", UserState.getUserStateByValue(6));
                return "/user/forgetpwd";
            }

            Boolean resetPwdFlag = userService.resetPwd(queryUser);
            if (resetPwdFlag) {
                // 修改密码后，自动退出登录
                request.getSession().invalidate();
                return "/user/login";
            } else {
                request.setAttribute("userState", UserState.getUserStateByValue(5));
            }
            //用户名对应的账号信息不存在
        } else {
            request.setAttribute("userState", UserState.getUserStateByValue(7));
        }
        return "/user/forgetpwd";
    }

    private void showAddress(HttpServletRequest request) {
        String login = String.valueOf(request.getSession().getAttribute("login"));
        if (login != null) {
            ShippingAddress address = shippingAddressService.selectOne(login);
            if (address != null) {
                request.getSession().setAttribute("address", address.getShippingAddress());
            }
        }
    }

    /**
     * 进入修改收货地址页面，设置已经存在的收货地址session
     *
     * @return
     */
    @RequestMapping("/user/toeditaddress")
    public String toEditAddress(HttpServletRequest request) {
        // 获取已登录session的用户名查询收货地址
        showAddress(request);
        return "/user/address";
    }

    /**
     * 收货地址修改
     *
     * @param request
     * @param shippingAddress
     * @return
     */
    @RequestMapping("/user/editaddress")
    public String editAddress(HttpServletRequest request, @ModelAttribute("shippingAddress") ShippingAddress shippingAddress) {
        System.out.println("进入地址提交");
        // 用户名
        String loginAccount = String.valueOf(request.getSession().getAttribute("login"));
        shippingAddress.setAccount(loginAccount);
        System.out.println(shippingAddress);
        // 添加地址
        boolean addressFlag = shippingAddressService.addAddress(shippingAddress);
        if (addressFlag) {
            // 收货地址id,自动生成的主键
            ShippingAddress address = shippingAddressService.selectOne(loginAccount);
            // 插入成功
            if (address != null) {
                // 用户名插入地址表的主键
                userService.userUpdate(loginAccount, address.getShippingId());
                // 设置地址session
                showAddress(request);
                request.setAttribute("userState", UserState.getUserStateByValue(9));
            }
        } else {
            request.setAttribute("userState", UserState.getUserStateByValue(8));
        }
        return "/user/address";
    }
}