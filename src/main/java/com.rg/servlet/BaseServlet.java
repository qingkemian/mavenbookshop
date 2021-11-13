package com.rg.servlet;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.logging.Logger;

/**
 * @Describe：提取出Servlet中的相同部分
 * @Author:ZelongChen
 * @Date:2021/11/10 16:58
 */
public class BaseServlet extends HttpServlet {

    private static String name = BaseServlet.class.getName();
    private static Logger log = Logger.getLogger(name);

    /**
     * 对get请求进行action的获取和业务的分发。
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    /**
     * 对post请求进行action的获取和业务的分发。
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取action的值 即调用的方法
        String action = req.getParameter("action");

        log.info("action:"+action);

        //解决响应的中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        //使用反射进行业务的分离
        try {
            Method method = this.getClass().getDeclaredMethod(action,HttpServletRequest.class,HttpServletResponse.class);
            method.invoke(this,req,resp);

        } catch (Exception e) {
            e.printStackTrace();
            //继续往外抛异常让Filter的事务管理器进行捕捉
            throw new RuntimeException(e);
        }
    }
}
