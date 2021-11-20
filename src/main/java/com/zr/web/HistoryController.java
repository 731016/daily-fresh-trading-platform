package com.zr.web;

import com.zr.pojo.Goods;
import com.zr.pojo.History;
import com.zr.result.Result;
import com.zr.service.GoodsService;
import com.zr.service.GoodsTypeService;
import com.zr.service.HistoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class HistoryController {

    @Resource
    private GoodsService goodsService;

    @Resource
    private HistoryService historyService;

    /**
     * 进入浏览记录页面，异步请求浏览记录
     * @return
     */
    /**
     * 查询符合条件的浏览记录后，根据id查询商品信息
     *
     * @param request
     * @return
     */
    @RequestMapping("/user/history")
    @ResponseBody
    public Result<Goods> queayGoodsHistoryLimit5(HttpServletRequest request, @RequestParam("flag") String flag) {
        System.out.println("axios请求：" + flag);
        // 结果集合
        Result<Goods> result = new Result<>();
        // 查询已登录的用户的所有浏览记录
        List<History> histories = historyService.selectPage(String.valueOf(request.getSession().getAttribute("login")));
        List<Integer> goodsIdList = new ArrayList<>();
        if (histories != null && histories.size() > 0) {
            // 集合转流
            // 对日期排序，降序排序
            // 获取商品id
            // 限制5个
            // 收集所有的值
            goodsIdList = histories.stream()
                    .sorted(Comparator.comparing(History::getHistoryDate).reversed())
                    .map(History::getGoodsId)
                    .limit(5)
                    .collect(Collectors.toList());
            // 为Integer类型的list集合
            List<Goods> goods = goodsService.selectlimit5ListGoods(goodsIdList);
            result.setResultListObject(goods);
        }
        return result;
    }
}
