package com.rg.entity;

import java.util.Date;

/**
 * @Describe：用户实体类
 * @Author:ZelongChen
 * @Date:2021/11/10 15:55
 */
public class User {

    private Integer uid;
    private String uname;
    private String upwd;
    private String idcard;
    private Integer age;
    private Date birth;

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    private Integer idcardtype;

    private Integer start;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Integer getIdcardtype() {
        return idcardtype;
    }

    public void setIdcardtype(Integer idcardtype) {
        this.idcardtype = idcardtype;
    }
}