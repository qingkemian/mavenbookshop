package com.rg.dao;

import com.rg.entity.Personal;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 18:25
 */
public interface PersonalDao {

    /**
     * 通过uid查询出“我的订单”中所需要的信息
     * @param uid
     * @return
     */
    List<List<Personal>> queryOrderByUserId(Integer uid);

}
