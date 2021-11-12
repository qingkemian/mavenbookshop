package com.rg.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/11 23:33
 */
@WebServlet("/initPage")
public class InitServlet extends BaseServlet {

    /**
     * 初始化跳转页面 跳转到首页
     * @param req
     * @param resp
     * @throws IOException
     */
    protected void initPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("bookshop/index.jsp");
    }

}
