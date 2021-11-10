package com.rg.service.impl;

import com.rg.dao.impl.AdminDaoImpl;
import com.rg.entity.Admin;
import com.rg.service.AdminService;

/**
 * @Describe：AdminService接口的实现类
 * @Author:ZelongChen
 * @Date:2021/11/10 16:51
 */
public class AdminServiceImpl implements AdminService {
    /*
    * admin实例
    * */
    AdminDaoImpl adminDao = new AdminDaoImpl();

    /**
     * 调用adminDao中的方法，将获得的admin对象的name和password作为参数传入
     * @param admin
     * @return Admin
     */
    public Admin login(Admin admin) {
        return adminDao.queryAdminByNameAndPassword(admin.getName(), admin.getPassword());
    }

}
