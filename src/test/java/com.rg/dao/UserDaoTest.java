package com.rg.dao;

import org.junit.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 15:30
 */
public class UserDaoTest {

    @Test
    public void test1() throws ParseException {
        System.out.println(new Date());

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(simpleDateFormat.format(new Date()));

    }

}
