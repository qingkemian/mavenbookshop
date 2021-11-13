package com.rg.servlet;

import com.rg.service.ShoppingCartService;
import com.rg.service.impl.ShoppingCartServiceImpl;

import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 14:27
 */
public class ShoppingServlet extends BaseServlet {

    private static String classname = ShoppingServlet.class.getName();
    private static Logger log = Logger.getLogger(classname);

    ShoppingCartService shoppingCartService = new ShoppingCartServiceImpl();

}
