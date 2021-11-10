package com.rg.entity;

/**
 * @Describe：管理员实体类
 * @Author:ZelongChen
 * @Date:2021/11/10 15:55
 */
public class Admin {

    private Integer id;
    private String name;
    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
