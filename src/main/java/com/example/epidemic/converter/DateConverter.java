package com.example.epidemic.converter;

/**
 * @author
 * @email
 * @description
 */
// 这个类的功能是：在表单中能自定义日期时间格式，
// 提交到服务器后，服务器能够识别，能够将字符串转换为Date对象。


import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 转换日期类型的数据
 * S : 页面传递过来的类型
 * T ：转换后的类型
 */
public class DateConverter implements Converter<String, Date> {

    public Date convert(String source) {
        // TODO Auto-generated method stub
        try {
            if (null != source) {
                // 把字符串转换为日期类型
                SimpleDateFormat simpleDateFormat =
                        new SimpleDateFormat("yyyy-MM-dd");
                return simpleDateFormat.parse(source);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }
}
