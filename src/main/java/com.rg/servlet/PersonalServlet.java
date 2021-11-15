package com.rg.servlet;

import com.rg.service.PersonalService;
import com.rg.service.impl.PersonalServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Describe：个人信息模块
 * @Author:ZelongChen
 * @Date:2021/11/15 16:58
 */
public class PersonalServlet extends BaseServlet {

    PersonalService personalService = new PersonalServiceImpl();

    protected void queryPersonalOrder(HttpServletRequest req, HttpServletResponse resp){

    }

}
