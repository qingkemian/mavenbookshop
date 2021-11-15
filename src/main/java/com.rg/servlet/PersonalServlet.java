package com.rg.servlet;

import com.rg.entity.Personal;
import com.rg.entity.User;
import com.rg.service.PersonalService;
import com.rg.service.impl.PersonalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Describe：个人信息模块
 * @Author:ZelongChen
 * @Date:2021/11/15 16:58
 */
@WebServlet("/personalServlet")
public class PersonalServlet extends BaseServlet {

    PersonalService personalService = new PersonalServiceImpl();

    protected void queryPersonalOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");

        Integer uid = 0;
        if (user!=null){
            uid = user.getUid();
        }

        User queryUser = new User();
        queryUser.setUid(uid);

        List<List<Personal>> personalListList = personalService.queryOrderByUserId(queryUser);

        req.setAttribute("personalLists", personalListList);
        req.getRequestDispatcher("bookshop/personal.jsp").forward(req, resp);

    }

}
