package com.rg.service.impl;

import com.rg.dao.UserDao;
import com.rg.dao.impl.UserDaoImpl;
import com.rg.entity.Gender;
import com.rg.entity.User;
import com.rg.service.UserService;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 9:48
 */
public class UserServiceImpl implements UserService {

    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(User user) {
        return userDao.queryUserByNameAndPassword(user.getUname(), user.getUpwd());
    }

    @Override
    public boolean existUserName(User user) {
        if (userDao.queryUserByName(user.getUname()) != null){
            return true;
        }
        return false;
    }

    @Override
    public List<User> queryUserByName(User user, Integer start) {
        return userDao.queryUserListByName(user.getUname(), start);
    }

    @Override
    public int queryUserTotalNum(User user) {
        return userDao.queryUserTotalNum(user.getUname());
    }

    @Override
    public User queryUserById(User user) {
        return userDao.queryUserById(user.getUid());
    }

    @Override
    public boolean updateUser(User user) {
        int flag = userDao.updateUser(user.getUid(), user.getUpwd(), user.getAddress());
        if (flag > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean addUser(User user) {
        String sex = "";
        switch (user.getSex()){
            case MALE:sex = "male";break;
            case FEMALE:sex = "female";break;
        }

//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        String registDate = simpleDateFormat.format(user.getRegistDate());
        Date registDate = new Date(user.getRegistDate().getTime());

        int flag = userDao.addUser(user.getUname(), user.getUpwd(), user.getPhone(), user.getEmail(), sex, registDate);
        if (flag > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean delUser(User user) {
        int flag = userDao.delUser(user.getUid());
        if (flag > 0) {
            return true;
        }
        return false;
    }
}
