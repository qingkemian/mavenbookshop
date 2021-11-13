package com.rg.servlet;

import com.rg.entity.ShoppingCar;
import com.rg.entity.User;
import com.rg.service.ShoppingCartService;
import com.rg.service.impl.ShoppingCartServiceImpl;
import com.rg.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 14:27
 */
@WebServlet("/shoppingServlet")
public class ShoppingServlet extends BaseServlet {

    private static String classname = ShoppingServlet.class.getName();
    private static Logger log = Logger.getLogger(classname);

    ShoppingCartService shoppingCartService = new ShoppingCartServiceImpl();

    /**
     * 商品成功添加到购物车
     * @param req
     * @param resp
     */
    protected void cartAddSuccess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 传过来的时候中文乱码了 所以后面重新获取对象
        ShoppingCar shoppingCar = (ShoppingCar) WebUtils.copygetParameterMapToBean(req.getParameterMap(), new ShoppingCar());

        boolean flag = shoppingCartService.addShoppingCart(shoppingCar);

        ShoppingCar shoppingCarTrans = shoppingCartService.queryShoppingCartByUserIdAndGoodNo(shoppingCar);

        if (flag) {
            req.setAttribute("usc", shoppingCarTrans);
            req.getRequestDispatcher("bookshop/cartAddSuccess.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("goodsServlet?action=productDetails&goodNo="+shoppingCar.getGoodNo());
        }

    }

    /**
     * 跳转购物车 初始化购物车
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void shoppingCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");

        if (user!=null){
            System.out.println(user.getUname());
            System.out.println(user.getUid());

            ShoppingCar shoppingCar = new ShoppingCar();
            shoppingCar.setUid(user.getUid());
            shoppingCar.setStart(new Integer(0));

            List<ShoppingCar> shoppingCarList = shoppingCartService.queryShoppingCartByUserId(shoppingCar);
            req.setAttribute("userShoppingCar", shoppingCarList);

            req.getRequestDispatcher("bookshop/shoppingcart.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("bookshop/login.jsp");
        }

    }

    /**
     * 计算
     * @param req
     * @param resp
     */
    protected void calculate(HttpServletRequest req, HttpServletResponse resp){
        String[] checkId = req.getParameterValues("checkId") ;
        ShoppingCar shoppingCar = new ShoppingCar();
        for (String s : checkId) {
            System.out.println(s);
        }
    }

}
