package com.rg.dao.impl;

import com.rg.constants.Constants;
import com.rg.dao.AdminDao;
import com.rg.dao.UserDao;
import com.rg.entity.Admin;

import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：AdminDao接口的实现类
 * @Author:ZelongChen
 * @Date:2021/11/10 16:26
 */
public class AdminDaoImpl extends BaseDao implements AdminDao {
    /*
    * log
    * */
    private static String name = AdminDaoImpl.class.getName();
    private static Logger log = Logger.getLogger(name);

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

    /**
     * 通过name，start分页查询
     * @param name
     * @param start
     * @return List<Admin>
     */
    @Override
    public List<Admin> queryAdminListByName(String name , Integer start) {
        String sql = "SELECT `id`,`name`,`password` FROM admin WHERE 1=1 ";
        // 动态sql
        if (name != null && !"".equals(name)) {
            sql = sql + "AND name LIKE '%" + name + "%'";
        }
        sql += "LIMIT " + start + "," + Constants.PAGE_SIZE;
        log.info(sql);

        return queryForList(Admin.class, sql);
    }

    /**
     * 通过模糊查询匹配的数据数量
     * @param name
     * @return int
     */
    @Override
    public int queryAdminTotalNum(String name) {
        String sql = "SELECT count(1) FROM admin WHERE 1=1 ";
        // 动态sql
        if (name != null && !"".equals(name)) {
            sql = sql + "AND name LIKE '%" + name + "%'";
        }
        log.info(sql);

        return ((Long)queryForSingleValue(sql)).intValue();
    }

    @Override
    public Admin queryAdminById(Integer id) {
        String sql = "SELECT `id`,`name`,`password` FROM admin WHERE `id` = ?";
        return queryForOne(Admin.class,sql,id);
    }

    @Override
    public int updateAdmin(Integer id, String password) {
        String sql = "UPDATE admin SET `password` = ? WHERE `id` = ?";
        return update(sql,password,id);
    }


}
