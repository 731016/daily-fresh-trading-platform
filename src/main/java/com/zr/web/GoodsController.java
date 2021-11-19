package com.zr.web;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zr.pojo.Goods;
import com.zr.pojo.GoodsType;
import com.zr.result.Result;
import com.zr.service.GoodsService;
import com.zr.service.GoodsTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class GoodsController {
    @Resource
    private GoodsService service;

    @Resource
    private GoodsTypeService typeService;

    /**
     * 主页面异步获取商品类别
     *
     * @return
     */
    @PostMapping("/goodsTypeRedis")
    @ResponseBody
    public Result<Goods> goodsTypeRedis() {
        Result<Goods> result = new Result<>();
        result.setResultListJson(typeService.selectAllRedis());
        return result;
    }

    /**
     * 主页面异步获取对应商品类别的销量前四的商品信息
     *
     * @param typeId
     * @return
     */
    @PostMapping("/goodsShow/{typeId}")
    @ResponseBody
    public Result<Goods> goodsShow(@PathVariable("typeId") Integer typeId) {
        Result<Goods> result = new Result<>();
        result.setResultListObject(service.selectSortSalesByType(typeId, 4));
        return result;
    }

    /**
     * 对应类别的所有商品信息
     *
     * @param pageNum
     * @param typeId
     * @return
     */
    @PostMapping("/allGoods/{typeId}/{pageNum}")
    @ResponseBody
    public Result<Goods> allGoods(@PathVariable("pageNum") Integer pageNum, @PathVariable("typeId") Integer typeId) {
        Result<Goods> result = new Result<>();
        QueryWrapper<Goods> wrapper = new QueryWrapper<>();
        wrapper.eq("type_id", typeId);
        result.setResultPageInfoObject(service.selectPage(pageNum, 2, wrapper));
        return result;
    }

    /**
     * 所有商品信息中转页面
     *
     * @param typeId
     * @param model
     * @return
     */
    @GetMapping("/toAllGoods")
    public String toAllGoods(Integer typeId, Model model) {
        List<Goods> hotGoods = service.selectSortSalesByType(typeId, 2);
        String s = typeService.selectAllRedis();
        List<GoodsType> goodsTypes = JSON.parseArray(s, GoodsType.class);
        model.addAttribute("goodsType", goodsTypes);
        model.addAttribute("hotGoods", hotGoods);
        model.addAttribute("typeId", typeId);
        return "/shop/readmoreshop";
    }

    /**
     * 商品详情页面
     *
     * @param typeId
     * @param goodsId
     * @param model
     * @return
     */
    @GetMapping("/goodsDetailed/{typeId}/{goodsId}")
    public String goodsDetailed(@PathVariable("typeId") Integer typeId, @PathVariable("goodsId") Integer goodsId, Model model) {
        Goods goods = service.selectOne(goodsId);
        List<Goods> hotGoods = service.selectSortSalesByType(typeId, 2);
        GoodsType goodsType = typeService.selectOne(typeId);
        model.addAttribute("goodsType", goodsType);
        model.addAttribute("goods", goods);
        model.addAttribute("hotGoods", hotGoods);
        return "/shop/shop_message";
    }

    /**
     * 商品查询界面中转页面
     *
     * @param goodsName
     * @return
     */
    @PostMapping("/toSelectGoods")
    public String toSelectGoods(String goodsName, Model model) {
        List<Goods> hotGoods = service.selectSortSalesByType(2);
        String s = typeService.selectAllRedis();
        List<GoodsType> goodsTypes = JSON.parseArray(s, GoodsType.class);
        model.addAttribute("goodsType", goodsTypes);
        model.addAttribute("hotGoods", hotGoods);
        model.addAttribute("goodsName", goodsName);
        return "/shop/selectgoods";
    }

    /**
     * 商品查询显示
     *
     * @param pageNum
     * @param goodsName
     * @return
     */
    @PostMapping("/selectGoods/{goodsName}/{pageNum}")
    @ResponseBody
    public Result<Goods> selectGoods(@PathVariable("pageNum") Integer pageNum, @PathVariable("goodsName") String goodsName) {
        Result<Goods> result = new Result<>();
        QueryWrapper<Goods> wrapper = new QueryWrapper<>();
        wrapper.like("goods_name", goodsName);
        result.setResultPageInfoObject(service.selectPage(pageNum, 2, wrapper));
        return result;
    }
}
