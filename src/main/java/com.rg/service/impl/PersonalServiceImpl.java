package com.rg.service.impl;

import com.rg.dao.PersonalDao;
import com.rg.dao.impl.PersoalDaoImpl;
import com.rg.entity.Personal;
import com.rg.entity.User;
import com.rg.service.PersonalService;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 19:05
 */
public class PersonalServiceImpl implements PersonalService {

    PersonalDao personalDao = new PersoalDaoImpl();

    @Override
    public List<List<Personal>> queryOrderByUserId(User user) {
        return personalDao.queryOrderByUserId(user.getUid());
    }
}
