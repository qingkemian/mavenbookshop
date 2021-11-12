package com.rg.dao.impl;

import com.rg.constants.Constants;
import com.rg.dao.UserDao;
import com.rg.entity.Admin;
import com.rg.entity.Gender;
import com.rg.entity.User;

import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 9:27
 */
public class UserDaoImpl extends BaseDao implements UserDao {
    /*
     * log
     * */
    private static String classname = UserDaoImpl.class.getName();
    private static Logger log = Logger.getLogger(classname);

    @Override
    public User queryUserByNameAndPassword(String uname, String upwd) {
        String sql = "SELECT `uname`,`upwd` FROM user WHERE `uname` = ? AND `upwd` = ?";
        return queryForOne(User.class,sql,uname,upwd);
    }

    @Override
    public User queryUserByName(String uname) {
        String sql = "SELECT `uname`,`upwd` FROM user WHERE `uname` = ?";
        return queryForOne(User.class,sql,uname);
    }

    @Override
    public List<User> queryUserListByName(String uname, Integer start) {
        String sql = "SELECT `uid`,`uname`,`upwd` FROM user WHERE 1=1 ";
        // 动态sql
        if (uname != null && !"".equals(uname)) {
            sql = sql + "AND uname LIKE '%" + uname + "%'";
        }
        sql += "LIMIT " + start + "," + Constants.PAGE_SIZE;
        log.info(sql);

        return queryForList(User.class, sql);
    }

    @Override
    public int queryUserTotalNum(String uname) {
        String sql = "SELECT count(1) FROM user WHERE 1=1 ";
        // 动态sql
        if (uname != null && !"".equals(uname)) {
            sql = sql + "AND uname LIKE '%" + uname + "%'";
        }
        log.info(sql);

        return ((Long)queryForSingleValue(sql)).intValue();
    }

    @Override
    public User queryUserById(Integer uid) {
        String sql = "SELECT * FROM user WHERE `uid` = ?";
        return queryForOne(User.class,sql,uid);
    }

    @Override
    public int updateUser(Integer uid, String upwd, Integer address) {
        String sql = "UPDATE user SET `upwd` = ? , `address` = ? WHERE `uid` = ?";
        return update(sql,upwd,address,uid);
    }

    @Override
    public int addUser(String uname, String upwd, String phone, String email, String sex, String registDate) {
        String sql = "INSERT INTO user (uname,upwd,phone,email,sex,registDate) VALUES (?,?,?,?,?,?)";
        return update(sql,uname,upwd,phone,email,sex,registDate);
    }

    @Override
    public int delUser(Integer uid) {
        String sql = "DELETE FROM user WHERE uid = ?";
        return update(sql,uid);
    }
}
