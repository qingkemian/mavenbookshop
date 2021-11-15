package com.rg.service;

import com.rg.entity.Personal;
import com.rg.entity.User;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 19:04
 */
public interface PersonalService {

    /**
     * 通过uid查询"我的订单所有内容"
     */
    List<List<Personal>> queryOrderByUserId(User user);

}
