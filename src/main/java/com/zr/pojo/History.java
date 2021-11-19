package com.zr.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class History {
    @TableId
    private Integer historyId;  //浏览记录编号
    private String account;     //用户账号
    private Integer goodsId;    //商品编号
    private Date historyDate;   //历史记录时间
}
