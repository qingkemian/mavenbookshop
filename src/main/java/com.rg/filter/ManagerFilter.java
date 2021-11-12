package com.rg.filter;

import com.rg.entity.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/11 9:40
 */
public class ManagerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //转换类型
        HttpServletRequest httpServletRequest = (HttpServletRequest)servletRequest;

        //获取session的user
        User user = (User) httpServletRequest.getSession().getAttribute("user");

        //用户没有登录
        if(user == null){
            httpServletRequest.getRequestDispatcher("/pages/user/login.jsp").forward(servletRequest,servletResponse);
        }else{
            //登录已完成
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
