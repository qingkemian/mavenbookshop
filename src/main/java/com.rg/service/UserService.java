package com.rg.service;

import com.rg.entity.User;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 9:40
 */
public interface UserService {

    /**
     * 用户登录
     * @param user
     * @return User
     */
    User login(User user);

    /**
     * 查询用户是否已经存在
     * @param user
     * @return boolean
     */
    boolean existUserName(User user);

    /**
     * 通过用户名和start进行分页查询
     * @param user
     * @param start
     * @return List<Usr>
     */
    List<User> queryUserByName(User user, Integer start);

    /**
     * 查询符合条件的用户多少
     * @param user
     * @return int
     */
    int queryUserTotalNum(User user);

    /**
     * 通过id查询用户
     * @param user
     * @return User
     */
    User queryUserById(User user);

    /**
     * 更新用户信息 成功返回true 失败false
     * @param user
     * @return boolean
     */
    boolean updateUser(User user);

    /**
     * 添加用户
     * @param user
     * @return boolean
     */
    boolean addUser(User user);

    /**
     * 删除用户
     * @param user
     * @return
     */
    boolean delUser(User user);

}
