package com.rg.dao.impl;

import com.rg.entity.Admin;
import org.junit.Test;

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

}
