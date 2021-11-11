package com.rg.dao;

import com.rg.entity.Admin;

import javax.xml.ws.soap.MTOM;
import java.util.List;

/**
 * @Describe：AdminDao接口类
 * @Author:ZelongChen
 * @Date:2021/11/10 16:01
 */
public interface AdminDao {

    /**
     * 根据name与password查询是否有该管理员
     * @param name 管理员名
     * @param password 密码
     * @return Admin
     */
    Admin queryAdminByNameAndPassword(String name , String password);

    /**
     * 通过name进行模糊查询 返回包含该字段的Admin
     * @param name
     * @return List<Admin>
     */
    List<Admin> queryAdminListByName(String name , Integer start);

    /**
     * 通过name进行模糊查询 符合条件的数据数
     * @param name
     * @return int
     */
    int queryAdminTotalNum(String name);

}
