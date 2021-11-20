package com.zr.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HistoryController{

    /**
     * 进入浏览记录页面，异步请求浏览记录
     * @return
     */
    @RequestMapping("/user/history")
    @ResponseBody
    public String toUpdateHistory() {

        return "";
    }
}
