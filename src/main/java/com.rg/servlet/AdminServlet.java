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

    private static String classname = AdminServlet.class.getName();
    private static Logger log = Logger.getLogger(classname);

    AdminService adminService = new AdminServiceImpl();

    /**
     * 用户登录（判断并返回消息、重定向）
     * @param req
     * @param resp
     * @throws IOException
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
     * @throws ServletException
     * @throws IOException
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
            start = (Integer.parseInt(currPage) - 1) * Constants.PAGE_SIZE;
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
     * @throws ServletException
     * @throws IOException
     */
    protected void editAdminInit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Admin admin = new Admin();
        admin.setId(Integer.parseInt(id));
        Admin queryAdmin = adminService.queryAdminById(admin);
        req.setAttribute("admin", queryAdmin);
        req.getRequestDispatcher("admin/admin-edit.jsp").forward(req,resp);
    }

    /**
     * 编辑管理员类
     * @param req
     * @param resp
     * @throws IOException
     */
    protected void editAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        Admin admin = new Admin();
        admin.setId(Integer.parseInt(id));
        admin.setName(name);
        admin.setPassword(password);

        if (adminService.updateAdmin(admin)){
            resp.sendRedirect("adminServlet?action=adminList");
        } else {

        }
    }

    /**
     * 添加管理员
     * @param req
     * @param resp
     * @throws IOException
     */
    protected void addAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        System.out.println("name:"+name);
        Admin admin = new Admin();
        admin.setName(name);
        admin.setPassword(password);

        if (adminService.addAdmin(admin)){
            req.setAttribute("addMsg", "添加成功");
//            resp.sendRedirect("adminServlet?action=adminList");
        } else {
            req.setAttribute("addMsg", "添加失败");
        }
    }

    /**
     * 删除Admin
     * @param req
     * @param resp
     */
    protected void delAdmin(HttpServletRequest req, HttpServletResponse resp){
        String id = req.getParameter("id");
        Admin admin = new Admin();
        admin.setId(Integer.parseInt(id));
        if (adminService.delAdmin(admin)){
            req.setAttribute("delMsg", "删除成功");
        } else {
            req.setAttribute("delMsg", "删除失败");
        }
    }

    /**
     * 批量删除Admin
     * @param req
     * @param resp
     */
    protected void delBatch(HttpServletRequest req, HttpServletResponse resp){
        String[] checkId = req.getParameterValues("checkId") ;
        Admin admin = new Admin();
        boolean flag = true;
        for (String s : checkId) {
            admin.setId(Integer.parseInt(s));
            if (adminService.delAdmin(admin)){

            } else {
                flag = false;
            }
        }
        if (flag){
            req.setAttribute("delMsg", "删除成功");
        } else {
            req.setAttribute("delMsg", "删除失败");
        }
    }
}
