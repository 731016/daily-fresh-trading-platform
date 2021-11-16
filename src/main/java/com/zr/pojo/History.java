package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class History {
    @TableId(value = "historyId")
    private Integer historyId;  //浏览记录编号
    private String account;     //用户账号
    private Integer goodId;     //商品编号
}
