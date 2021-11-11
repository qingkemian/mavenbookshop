package com.rg.service.impl;

import com.rg.dao.AdminDao;
import com.rg.dao.impl.AdminDaoImpl;
import com.rg.entity.Admin;
import com.rg.service.AdminService;

import java.util.List;

/**
 * @Describe：AdminService接口的实现类
 * @Author:ZelongChen
 * @Date:2021/11/10 16:51
 */
public class AdminServiceImpl implements AdminService {
    /*
    * admin实例
    * */
    AdminDao adminDao = new AdminDaoImpl();

    /**
     * 调用adminDao中的方法，将获得的admin对象的name和password作为参数传入
     * @param admin
     * @return Admin
     */
    public Admin login(Admin admin) {
        return adminDao.queryAdminByNameAndPassword(admin.getName(), admin.getPassword());
    }

    /**
     * 通过name查询Admin
     * @param admin
     * @param start
     * @return List<Admin>
     */
    @Override
    public List<Admin> queryAdminByName(Admin admin, Integer start) {
        return adminDao.queryAdminListByName(admin.getName() , start);
    }

    /**
     * 查询符合的Admin总数
     * @param admin
     * @return int
     */
    @Override
    public int queryAdminTotalNum(Admin admin) {
        return adminDao.queryAdminTotalNum(admin.getName());
    }

    /**
     * 通过id查询
     * @param admin
     * @return Admin
     */
    @Override
    public Admin queryAdminById(Admin admin) {
        return adminDao.queryAdminById(admin.getId());
    }

    public boolean updateAdmin(Admin admin) {
        int flag = adminDao.updateAdmin(admin.getId(), admin.getPassword());
        if (flag > 0) {
            return true;
        }
        return false;
    }
}
