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

    /**
     * 返回商品列表 显示在购物页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void goodsList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String query_name = req.getParameter("query_name");

        Goods goods = new Goods();
        goods.setGoodName(query_name);
        goods.setStart(0);

        List<Goods> goodsList = goodsService.queryGoodsByName(goods);

        req.setAttribute("goodsList", goodsList);

        req.getRequestDispatcher("bookshop/Shopping.jsp").forward(req, resp);
    }

    /**
     * 返回单个商品 转发到商品详情页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void productDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String goodNo = req.getParameter("goodNo");
        Goods goods = new Goods();
        goods.setGoodNo(Integer.parseInt(goodNo));

        Goods good = goodsService.queryGoodById(goods);

        req.setAttribute("byIdGoods", good);

        req.getRequestDispatcher("bookshop/productDetails.jsp").forward(req, resp);

    }

}
