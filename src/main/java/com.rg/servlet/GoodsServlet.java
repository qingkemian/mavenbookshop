package com.rg.servlet;

import com.rg.dao.GoodsDao;
import com.rg.dao.UserDao;
import com.rg.dao.impl.GoodsDaoImpl;
import com.rg.dao.impl.UserDaoImpl;
import com.rg.entity.Goods;
import com.rg.service.GoodsService;
import com.rg.service.impl.GoodsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 9:26
 */
@WebServlet("/goodsServlet")
public class GoodsServlet extends BaseServlet {

    private static String classname = GoodsServlet.class.getName();
    private static Logger log = Logger.getLogger(classname);

    GoodsService goodsService = new GoodsServiceImpl();

    protected void goodsList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String query_name = req.getParameter("query_name");

        Goods goods = new Goods();
        goods.setGoodName(query_name);
        goods.setStart(0);

        List<Goods> goodsList = goodsService.queryGoodsByName(goods);

        req.setAttribute("goodsList", goodsList);

        req.getRequestDispatcher("bookshop/Shopping.jsp").forward(req, resp);
    }

}
