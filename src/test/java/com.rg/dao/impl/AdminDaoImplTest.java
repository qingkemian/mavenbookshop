package com.rg.dao.impl;

import com.rg.entity.Admin;
import org.junit.Test;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/10 16:41
 */
public class AdminDaoImplTest {

    @Test
    public void test1(){
        AdminDaoImpl adminDao = new AdminDaoImpl();
        Admin admin = null;
        admin = adminDao.queryAdminByNameAndPassword("admin", "1234567");

        if (admin != null) {
//            System.out.println(admin.getId());
            System.out.println(admin.getName());
            System.out.println(admin.getPassword());
            System.out.println(admin==null);
        } else {
            System.out.println("it is null");
        }
    }

    @Test
    public void test2(){
        AdminDaoImpl adminDao = new AdminDaoImpl();
        List<Admin> adminList = null;
        adminList = adminDao.queryAdminListByName("oo", 0);
        for (Admin admin:adminList) {
            System.out.println(admin.getName());
            System.out.println(admin.getPassword());
        }
    }

    @Test
    public void test3(){
        AdminDaoImpl adminDao = new AdminDaoImpl();
        int num;
        num = adminDao.queryAdminTotalNum("oo");
        System.out.println("num="+num);
    }

}
