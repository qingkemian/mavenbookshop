package com.rg.servlet;

import com.rg.entity.*;
import com.rg.service.AddressService;
import com.rg.service.OrderService;
import com.rg.service.ShoppingCartService;
import com.rg.service.impl.AddressServiceImpl;
import com.rg.service.impl.OrderServiceImpl;
import com.rg.service.impl.ShoppingCartServiceImpl;
import com.rg.utils.WebUtils;
import com.sun.org.apache.xpath.internal.operations.Or;

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
 * @Describe：订单确认模块
 * @Author:ZelongChen
 * @Date:2021/11/14 9:47
 */
@WebServlet("/settlementServlet")
public class SettlementServlet extends BaseServlet {

    private static String classname = SettlementServlet.class.getName();
    private static Logger log = Logger.getLogger(classname);

    ShoppingCartService shoppingCartService = new ShoppingCartServiceImpl();
    AddressService addressService = new AddressServiceImpl();
    OrderService orderService = new OrderServiceImpl();

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
        Integer getNum = 0;
        BigDecimal totalPrice = new BigDecimal(0);
        BigDecimal discountPrice = new BigDecimal(0);
        if (checkId != null) {
            System.out.println("-----");
            for (String s : checkId) {
                System.out.println(s);
                shoppingCar.setCarId(Integer.parseInt(s));
                dbShoppingCar = shoppingCartService.querryShoppingCartByCartId(shoppingCar);
                shoppingCarList.add(dbShoppingCar);
                if (dbShoppingCar != null){
                    getNum = getNum + dbShoppingCar.getGoodNum();
                    totalPrice = totalPrice.add( ( dbShoppingCar.getPrice().multiply(  new BigDecimal( dbShoppingCar.getGoodNum().toString() ) ) ).multiply(dbShoppingCar.getDiscount()) ) ;
                    discountPrice = discountPrice.add( ( dbShoppingCar.getPrice().multiply(  new BigDecimal( dbShoppingCar.getGoodNum().toString() ) ) ).multiply(new BigDecimal(1).subtract(dbShoppingCar.getDiscount())) );
                }
            }

            System.out.println("getNum:"+getNum);

            // 获取地址
            Address address = new Address();
            address.setUid(uid);

            addressList = addressService.queryAddressListByUserId(address);

            System.out.println(shoppingCarList);

            // 将checkId添加到session中
            req.getSession().setAttribute("checkId",checkId);

            System.out.println("done");
            req.setAttribute("finalNum", getNum.toString());
            req.setAttribute("finalPrice", totalPrice.toString());
            req.setAttribute("finaldiscountPrice", discountPrice.toString());
            req.setAttribute("allTake", addressList);
            req.setAttribute("userShoppingCar", shoppingCarList);
            req.getRequestDispatcher("bookshop/settlement.jsp").forward(req, resp);
            System.out.println("done");
        } else {
            System.out.println("回到购物车");
            req.getRequestDispatcher("shoppingServlet?shoppingCart").forward(req, resp);
        }
    }

    /**
     * 添加收货地址
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
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
        // flag用于标记是否显示该地址（即用户是否删除 true表示显示，用户未删除）
        address.setFlag(true);

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

                // 移除checkId
                req.getSession().removeAttribute("checkId");

                req.getRequestDispatcher("bookshop/settlement.jsp").forward(req, resp);
            } else {
                System.out.println("回到购物车");
                req.getRequestDispatcher("shoppingServlet?shoppingCart").forward(req, resp);
            }

        }
    }

    /**
     * 确认支付 进入最终提示界面 订单入库
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void checkOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 需要theOrder.getAddressId(), theOrder.getPrice(), theOrder.getUid(), theOrder.getCartId()
        TheOrder theOrder = new TheOrder();

        User user = (User) req.getSession().getAttribute("user");
        Integer uid = 0;
        if (user!=null){
            uid = user.getUid();
        }

        String[]  checkIds= (String[]) req.getSession().getAttribute("checkId");

        String addressId = req.getParameter("addressId");
        System.out.println(addressId);

        BigDecimal totalPrice = new BigDecimal(0);
        if (checkIds != null) {
            ShoppingCar shoppingCar = new ShoppingCar();
            ShoppingCar dbShoppingCar = new ShoppingCar();
            List<ShoppingCar> shoppingCarList = new ArrayList<ShoppingCar>();
            System.out.println("-----");

            for (String s : checkIds) {
                System.out.println(s);
                shoppingCar.setCarId(Integer.parseInt(s));
                dbShoppingCar = shoppingCartService.querryShoppingCartByCartId(shoppingCar);
                shoppingCarList.add(dbShoppingCar);
                if (dbShoppingCar != null) {
                    totalPrice = totalPrice.add((dbShoppingCar.getPrice().multiply(new BigDecimal(dbShoppingCar.getGoodNum().toString()))).multiply(dbShoppingCar.getDiscount()));
                }
            }

        } else {

        }

        theOrder.setAddressId(Integer.parseInt(addressId));

        theOrder.setUid(uid);

        theOrder.setCartId(checkIds);
        // 订单总价
        theOrder.setPrice(totalPrice);

        boolean flag = orderService.addOrder(theOrder);


        Address address = new Address();
        address.setAddressId(Integer.parseInt(addressId));

        Address attAddress = addressService.queryAddressByAddressId(address);

        if (flag) {
            req.setAttribute("attAddress", attAddress);
            req.setAttribute("totalPrice",totalPrice );
            req.getRequestDispatcher("bookshop/checkout.jsp").forward(req, resp);
        }

    }
}
