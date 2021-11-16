package com.zr.web;

import com.zr.pojo.Goods;
import com.zr.service.GoodsService;
import com.zr.service.GoodsTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class GoodsController {
    @Resource
    private GoodsService service;

    @Resource
    private GoodsTypeService typeService;

    @PostMapping("/goodsTypeRedis")
    @ResponseBody
    public String goodsTypeRedis() {
        return typeService.selectAllRedis();
    }

    @PostMapping("/goodsShow/{typeId}")
    @ResponseBody
    public List<Goods> goodsShow(@PathVariable("typeId") Integer typeId) {
        return service.selectSortSalesByType(typeId, 4);
    }
}
