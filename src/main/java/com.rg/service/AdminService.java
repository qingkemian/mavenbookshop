package com.rg.service;

import com.rg.entity.Admin;

import java.util.List;

/**
 * @Describe：AdminService接口类
 * @Author:ZelongChen
 * @Date:2021/11/10 16:50
 */
public interface AdminService {
    /**
     * 传入Admin对象进行登录校验
     * @param admin
     * @return Admin
     */
    Admin login(Admin admin);

    /**
     * 通过用户名和start进行分页查询
     * @param admin
     * @param start
     * @return List<Admin>
     */
    List<Admin> queryAdminByName(Admin admin , Integer start);

    /**
     * 符合条件的分页数量
     * @param admin
     * @return int
     */
    int queryAdminTotalNum(Admin admin);

    /**
     * 传入Admin，通过id查询
     * @param admin
     * @return Admin
     */
    Admin queryAdminById(Admin admin);

    boolean updateAdmin(Admin admin);
}
