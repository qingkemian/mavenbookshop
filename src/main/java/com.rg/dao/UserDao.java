package com.rg.dao;

import com.rg.entity.Gender;
import com.rg.entity.User;
import sun.nio.cs.ext.MacThai;

import java.sql.Date;
import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/10 16:01
 */
public interface UserDao {

    /**
     * 通过用户名和密码查询用户
     * @param uname
     * @param upwd
     * @return User
     */
    User queryUserByNameAndPassword(String uname, String upwd);

    /**
     * 通过用户名和密码查询用户
     * @param uname
     * @return User
     */
    User queryUserByName(String uname);

    /**
     * 通过用户名查询符合条件的用户列表
     * @param uname
     * @param start
     * @return List<User>
     */
    List<User> queryUserListByName(String uname, Integer start);

    /**
     * 通过名字进行模糊查询 符合条件的数据数目
     * @param uname
     * @return int
     */
    int queryUserTotalNum(String uname);

    /**
     * 通过id查询用户
     * @param uid
     * @return User
     */
    User queryUserById(Integer uid);

    /**
     * 通过id修改该用户的密码或默认收货地址
     * @param uid
     * @param upwd
     * @param address
     * @return int
     */
    int updateUser(Integer uid, String upwd, Integer address);

    /**
     * 添加用户 除了下列参数 其他由mysql的默认值得到
     * @param uname
     * @param upwd
     * @param email
     * @param sex
     * @return int
     */
    int addUser(String uname, String upwd, String phone, String email, String sex , Date registDate);

    /**
     * 通过uid删除用户
     * @param uid
     * @return int
     */
    int delUser(Integer uid);
}
