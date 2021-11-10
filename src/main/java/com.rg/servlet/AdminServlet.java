package com.rg.servlet;

import com.rg.entity.Admin;
import com.rg.service.impl.AdminServiceImpl;
import com.rg.utils.WebUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Describe：admin在servlet的相关方法
 * @Author:ZelongChen
 * @Date:2021/11/10 17:04
 */
@WebServlet("/adminServlet")
public class AdminServlet extends BaseServlet {

    AdminServiceImpl adminService = new AdminServiceImpl();

    /**
     * 用户登录（判断并返回消息、重定向）
     * @return void
     */
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // 使用BeanUtil进行封装
        Admin admin = (Admin) WebUtils.copygetParameterMapToBean(req.getParameterMap(), new Admin());

        System.out.println(admin);

        // 调用service
        Admin dbAdmin = adminService.login(admin);

        System.out.println(dbAdmin);

        HttpSession session = req.getSession();

        if (dbAdmin != null) {
            System.out.println("登录成功");
            session.setAttribute("msg", dbAdmin.getName());
            session.removeAttribute("loginmsg");
            resp.sendRedirect("admin/index.jsp");
        } else {
            System.out.println("登录失败");
            session.setAttribute("loginmsg", "false");
            resp.sendRedirect("admin/login.jsp");
        }

    }

}
