package com.rg.servlet;

import com.rg.dao.GoodsDao;
import com.rg.dao.UserDao;
import com.rg.dao.impl.GoodsDaoImpl;
import com.rg.dao.impl.UserDaoImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
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

    GoodsDao goodsDao = new GoodsDaoImpl();

    protected void updateGood(HttpServletRequest req, HttpServletResponse resp){
        goodsDao.updateGood(1, "", "", 1, new BigDecimal(12.1), new BigDecimal(12.1), 1 ,"", "");
    }

}
