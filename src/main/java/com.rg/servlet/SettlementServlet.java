package com.rg.servlet;

import com.rg.entity.Address;
import com.rg.entity.Admin;
import com.rg.entity.ShoppingCar;
import com.rg.entity.User;
import com.rg.service.AddressService;
import com.rg.service.ShoppingCartService;
import com.rg.service.impl.AddressServiceImpl;
import com.rg.service.impl.ShoppingCartServiceImpl;
import com.rg.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLDecoder;
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
    AddressService addressService = new AddressServiceImpl();

    /**
     * 初始化订单确认
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void initSettlement(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        Integer uid = 0;
        if (user!=null){
            uid = user.getUid();
        }

        String[] checkId = req.getParameterValues("checkId") ;
        System.out.println("checkId:"+checkId);
        ShoppingCar shoppingCar = new ShoppingCar();
        ShoppingCar dbShoppingCar = new ShoppingCar();
        List<ShoppingCar> shoppingCarList = new ArrayList<ShoppingCar>();
        List<Address> addressList = new ArrayList<Address>();
        if (checkId != null) {
            System.out.println("-----");
            for (String s : checkId) {
                System.out.println(s);
                shoppingCar.setCarId(Integer.parseInt(s));
                dbShoppingCar = shoppingCartService.querryShoppingCartByCartId(shoppingCar);
                shoppingCarList.add(dbShoppingCar);
            }

            // 获取地址
            Address address = new Address();
            address.setUid(uid);

            addressList = addressService.queryAddressListByUserId(address);

            System.out.println(shoppingCarList);

            req.getSession().setAttribute("checkId",checkId);

            req.setAttribute("allTake", addressList);
            req.setAttribute("userShoppingCar", shoppingCarList);
            req.getRequestDispatcher("bookshop/settlement.jsp").forward(req, resp);
        } else {
            System.out.println("回到购物车");
            req.getRequestDispatcher("shoppingServlet?shoppingCart").forward(req, resp);
        }
    }

    protected void addAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        String[] checkIds= (String []) req.getSession().getAttribute("checkId");
        System.out.println("checkIds"+checkIds);

        Integer uid = 0;
        if (user!=null){
            uid = user.getUid();
        }

        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String detailed = req.getParameter("detailed");

        Address address = new Address();
        address.setUid(uid);
        address.setName(name);
        address.setPhone(phone);
        address.setProvince(province);
        address.setCity(city);
        address.setDistrict(district);
        address.setDetailed(detailed);
        address.setFlag(false);

        boolean flag = addressService.addAddress(address);
        if (flag) {
            ShoppingCar shoppingCar = new ShoppingCar();
            ShoppingCar dbShoppingCar = new ShoppingCar();
            List<ShoppingCar> shoppingCarList = new ArrayList<ShoppingCar>();
            List<Address> addressList = new ArrayList<Address>();

            if (checkIds != null) {
                System.out.println("-----");
                for (String s : checkIds) {
                    System.out.println(s);
                    shoppingCar.setCarId(Integer.parseInt(s));
                    dbShoppingCar = shoppingCartService.querryShoppingCartByCartId(shoppingCar);
                    shoppingCarList.add(dbShoppingCar);
                }

                // 获取地址
                Address addressone = new Address();
                addressone.setUid(uid);

                addressList = addressService.queryAddressListByUserId(addressone);

                System.out.println(shoppingCarList);

                req.setAttribute("allTake", addressList);
                req.setAttribute("userShoppingCar", shoppingCarList);
                req.getRequestDispatcher("bookshop/settlement.jsp").forward(req, resp);
            } else {
                System.out.println("回到购物车");
                req.getRequestDispatcher("shoppingServlet?shoppingCart").forward(req, resp);
            }

        }
    }
}
