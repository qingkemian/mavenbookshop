package com.rg.servlet;

import com.google.gson.Gson;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/14 9:36
 */
public class GsonTest {

    @Test
    public void test1(){
        Gson gson = new Gson();
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("1", 111);
        map.put("2", 222);
        String str = gson.toJson(map);
        System.out.println(str);
    }

}
