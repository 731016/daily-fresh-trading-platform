package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    @TableId(value = "goods_id")
    private Integer goodsId;    //商品编号
    private String goodsName;   //商品名称
    private String goodsDescribe;   //商品描述
    private Integer inventory; //商品库存
    private Double price;      //商品价格
    private Integer typeId;    //商品类型
    private Integer sales;     //商品销量
    private String picture;    //商品图片
    private String originPlace;//商品出产地
    private Double unit;       //商品单位
}
