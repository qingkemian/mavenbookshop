package com.rg.utils;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @Describe：Web层工具类
 * @Author:ZelongChen
 * @Date:2021/11/10 16:31
 */
public class WebUtils {

    /**
     * 把参数Map封装到JavaBean
     * @param parameterMap  要封装的Map
     * @param entity        封装到的JavaBean对象
     * @return              封装后的JavaBean对象
     */
    public static Object copygetParameterMapToBean(Map<String,? extends Object> parameterMap, Object entity){

        //使用beanUtils进行JavaBean的封装
        try {
            BeanUtils.populate(entity,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        return entity;
    }

}
