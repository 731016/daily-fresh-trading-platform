package com.zr.web;

import com.zr.enums.UserState;
import com.zr.result.Result;
import com.zr.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerAdapter;

import javax.annotation.Resource;

@Controller
public class RegisterAccountExist{

    @Resource
    private UserService userService;

    /**
     * 查询账户是否已注册
     * @param account
     * @return
     */
    @RequestMapping("/user/register_accountExist")
    @ResponseBody
    public Result registerAccExist(@RequestParam("account") String account){
        Boolean accExist = userService.registerAccExist(account);
        Result result = new Result();
        if (accExist) {
            result.setMsg("用户名已存在");
            return result;
        }
        result.setMsg("用户名可以使用");
        return result;
    }

}
