package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoodsType {
    @TableId(value = "type_id")
    private Integer typeId;  //商品类型编号
    private String typeName; //商品类型名称
    private String typeImg;  //商品类型图片
    private String typeClass;//商品类型样式
}
