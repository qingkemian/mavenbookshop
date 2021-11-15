package com.rg.dao;

import com.rg.dao.impl.BaseDao;
import com.rg.dao.impl.PersoalDaoImpl;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 18:22
 */
public class PersonalDaoTest {

    @Test
    public void test1(){
        List<List<String>> aaa=new ArrayList<List<String>>();
        List<String> a = new ArrayList<String>();
        List<String> b = new ArrayList<String>();
        List<String> c = new ArrayList<String>();
        a.add("hello");
        a.add("man");
        b.add("hi");
        c.add("www");
        c.add("zzzz");

        aaa.add(a);
        aaa.add(b);
        aaa.add(c);

        for (List<String> strings : aaa) {
            for (String string : strings) {
                System.out.println(string);
            }
        }
    }

    @Test
    public void test2(){

        PersonalDao personalDao = new PersoalDaoImpl();
        personalDao.queryOrderByUserId(1);
    }

}
