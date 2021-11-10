package com.rg.utils;

import org.junit.Test;

import java.sql.Connection;

/**
 */

public class JdbcUtilsTest {

    @Test
    public void testJdbcUtils() {
        for(int i = 0;i < 20 ;i++){
            //获取连接
            Connection conn = JdbcUtils.getConnection();
            //打印连接
            System.out.println(conn);
            //关闭连接
//            JdbcUtils.commitAndClose(conn);
        }
    }
}