package com.zr.utils;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DataConvert implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        if(s.contains("/")&& !s.contains("-")){
            //格式化日期
            DateFormat df=new SimpleDateFormat("yyyy/MM/dd");
            try {
                return  df.parse(s);
            }catch (Exception e){
                throw new RuntimeException("数据类型转换异常");
            }
        }
        if(s.contains("-")&& !s.contains("/")){
            //格式化日期
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            try {
                return  df.parse(s);
            }catch (Exception e){
                throw new RuntimeException("数据类型转换异常");
            }
        }
        return null;
    }
}
