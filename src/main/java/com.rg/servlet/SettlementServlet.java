package com.rg.servlet;

import com.rg.entity.ShoppingCar;
import com.rg.service.ShoppingCartService;
import com.rg.service.impl.ShoppingCartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/14 9:47
 */
@WebServlet("/settlementServlet")
public class SettlementServlet extends BaseServlet {

    private static String classname = SettlementServlet.class.getName();
    private static Logger log = Logger.getLogger(classname);

    ShoppingCartService shoppingCartService = new ShoppingCartServiceImpl();

    protected void initSettlement(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] checkId = req.getParameterValues("checkId") ;
        System.out.println("checkId:"+checkId);
        ShoppingCar shoppingCar = new ShoppingCar();
        ShoppingCar dbShoppingCar = new ShoppingCar();
        List<ShoppingCar> shoppingCarList = new ArrayList<ShoppingCar>();
        if (checkId != null) {
            System.out.println("-----");
            for (String s : checkId) {
                System.out.println(s);
                shoppingCar.setCarId(Integer.parseInt(s));
                dbShoppingCar = shoppingCartService.querryShoppingCartByCartId(shoppingCar);
                shoppingCarList.add(dbShoppingCar);
            }
            System.out.println(shoppingCarList);
            req.setAttribute("userShoppingCar", shoppingCarList);
            req.getRequestDispatcher("bookshop/settlement.jsp").forward(req, resp);
        } else {
            System.out.println("回到购物车");
            req.getRequestDispatcher("shoppingServlet?shoppingCart").forward(req, resp);
        }
    }

}
