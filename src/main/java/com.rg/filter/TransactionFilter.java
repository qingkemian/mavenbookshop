package com.rg.filter;

import com.rg.utils.JdbcUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/11 9:41
 */
@WebFilter("/*")
public class TransactionFilter implements Filter {
    private static String name = TransactionFilter.class.getName();
    private static Logger log = Logger.getLogger(name);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.info("TransactionFilter init");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //对事务进行管理
        try {
            filterChain.doFilter(servletRequest, servletResponse);
            //提交事务并关闭连接
            JdbcUtils.commitAndClose();
            log.info("commit and close");
        }catch (Exception e){
            //回滚事务并关闭连接
            JdbcUtils.rollbackAndClose();
            log.info("roll and close");
            //打印异常
            e.printStackTrace();
            //把异常抛给tomacat服务器(然后服务器进行捕捉后，匹配对应的web.xml错误画面)
            throw new RuntimeException(e);
        }
    }

    @Override
    public void destroy() {

    }
}
