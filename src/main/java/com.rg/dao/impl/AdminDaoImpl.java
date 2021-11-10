package com.rg.dao.impl;

import com.rg.dao.AdminDao;
import com.rg.entity.Admin;

/**
 * @Describe：AdminDao接口的实现类
 * @Author:ZelongChen
 * @Date:2021/11/10 16:26
 */
public class AdminDaoImpl extends BaseDao implements AdminDao {
    /**
     * 通过BaseDao的方法查询是否有符合要求的用户
     * @param name 姓名
     * @param password 密码
     * @return Admin 若没有则为空对象
     */
    @Override
    public Admin queryAdminByNameAndPassword(String name, String password) {
        String sql = "SELECT `name`,`password` FROM admin WHERE `name` = ? AND `password` = ?";
        return queryForOne(Admin.class,sql,name,password);
    }
}
