package com.rg.servlet;

import com.rg.constants.Constants;
import com.rg.entity.Admin;
import com.rg.service.AdminService;
import com.rg.service.impl.AdminServiceImpl;
import com.rg.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：admin在servlet的相关方法
 * @Author:ZelongChen
 * @Date:2021/11/10 17:04
 */
@WebServlet("/adminServlet")
public class AdminServlet extends BaseServlet {

    private static String name = AdminServlet.class.getName();
    private static Logger log = Logger.getLogger(name);

    AdminService adminService = new AdminServiceImpl();

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

    /**
     * 列出admin列表
     * @param req
     * @param resp
     * @return void
     */
    protected void adminList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String currPage = req.getParameter("currPage");
        log.info("beforecurrpage" + currPage);
        if (currPage == null || "".equals(currPage)){
            currPage = "1";
        }

        log.info("currpage" + currPage);

        int start = (Integer.parseInt(currPage) - 1) * Constants.PAGE_SIZE;


        String query_name = req.getParameter("query_name");

        Admin admin = new Admin();
        admin.setName(query_name);

        List<Admin> adminList = adminService.queryAdminByName(admin, start);
        int total = adminService.queryAdminTotalNum(admin);
        int totalPage = total%Constants.PAGE_SIZE == 0 ? total / Constants.PAGE_SIZE : total / Constants.PAGE_SIZE + 1;

        // 不传参数 发起新的请求 所以currpage置空 不需要手动归一
        // 传入参数 可能出现不一致现象 需再次查询
        if (Integer.parseInt(currPage) > totalPage) {
            currPage = Integer.toString(totalPage);
            totalPage = (Integer.parseInt(currPage) - 1) * Constants.PAGE_SIZE;
            adminList = adminService.queryAdminByName(admin, start);
        }

        log.info("totalPage="+totalPage);

        req.setAttribute("adminlist", adminList);
        req.setAttribute("query_name", query_name);
        req.setAttribute("currPage", currPage);
        req.setAttribute("total",total);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("pageSize", Constants.PAGE_SIZE);

        req.getRequestDispatcher("admin/admin-list.jsp").forward(req, resp);
    }

    /**
     * 编辑管理员的初始类
     * @param req
     * @param resp
     * @return void
     */
    protected void editAdminInit(HttpServletRequest req, HttpServletResponse resp){

    }

    /**
     * 删除Admin
     * @param req
     * @param resp
     * @return void
     */
    protected void delAdmin(HttpServletRequest req, HttpServletResponse resp){

    }
}
