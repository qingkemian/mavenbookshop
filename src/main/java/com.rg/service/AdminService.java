package com.rg.service;

import com.rg.entity.Admin;

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

}
