package com.rg.servlet;

import com.rg.entity.Address;
import com.rg.entity.Personal;
import com.rg.entity.ShoppingCar;
import com.rg.entity.User;
import com.rg.service.AddressService;
import com.rg.service.PersonalService;
import com.rg.service.impl.AddressServiceImpl;
import com.rg.service.impl.PersonalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Describe：个人信息模块
 * @Author:ZelongChen
 * @Date:2021/11/15 16:58
 */
@WebServlet("/personalServlet")
public class PersonalServlet extends BaseServlet {

    PersonalService personalService = new PersonalServiceImpl();
    AddressService addressService = new AddressServiceImpl();

    /**
     * 查询用户订单
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
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

    /**
     * 初始化地址栏 显示所有地址
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void initAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        Integer uid = 0;
        if (user!=null){
            uid = user.getUid();
        }

            // 获取地址
        Address address = new Address();
        address.setUid(uid);
        List<Address> addressList = new ArrayList<Address>();
        addressList = addressService.queryAddressListByUserId(address);

        req.setAttribute("allTake", addressList);
        req.getRequestDispatcher("bookshop/take.jsp").forward(req, resp);
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
            List<Address> addressList = new ArrayList<Address>();
            addressList = addressService.queryAddressListByUserId(address);

            req.setAttribute("allTake", addressList);
            req.getRequestDispatcher("bookshop/take.jsp").forward(req, resp);
        } else {

        }
    }

}
