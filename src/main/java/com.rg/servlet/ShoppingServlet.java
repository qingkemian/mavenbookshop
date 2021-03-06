package com.rg.servlet;

import com.google.gson.Gson;
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
import java.io.PrintWriter;
import java.io.Writer;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 * @Describe：购物车模块
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
    protected void calculate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String[] checkId = req.getParameterValues("checkId") ;
        ShoppingCar shoppingCar = new ShoppingCar();
        ShoppingCar dbShoppingCar = new ShoppingCar();
        Integer getNum = 0;
        BigDecimal totalPrice = new BigDecimal(0);
        BigDecimal discountPrice = new BigDecimal(0);
        if (checkId != null) {
            for (String s : checkId) {
                shoppingCar.setCarId(Integer.parseInt(s));
                dbShoppingCar = shoppingCartService.querryShoppingCartByCartId(shoppingCar);
                if (dbShoppingCar != null){
                    getNum = getNum + dbShoppingCar.getGoodNum();
                    totalPrice = totalPrice.add( ( dbShoppingCar.getPrice().multiply(  new BigDecimal( dbShoppingCar.getGoodNum().toString() ) ) ).multiply(dbShoppingCar.getDiscount()) ) ;
                    discountPrice = discountPrice.add( ( dbShoppingCar.getPrice().multiply(  new BigDecimal( dbShoppingCar.getGoodNum().toString() ) ) ).multiply(new BigDecimal(1).subtract(dbShoppingCar.getDiscount())) );
                }
            }
        }

        System.out.println("getNum:" + getNum);
        System.out.println("totalPrice:" + totalPrice);
        System.out.println("discountPrice:"+ discountPrice);

        // 向ajax返回数据
        PrintWriter out =null;
        try {
            out = resp.getWriter();
            resp.setContentType("text/html;charset=utf-8");
            resp.setHeader("cache-control", "no-cache");
            // JSON官方明确规定，JSON数据的key与value必须使用双引号""包裹，否则在转换过程中会导致错误。
//            String str = "{\"getNum\":\"" + getNum + "\",\"totalPrice\":\"" + totalPrice + "\",\"discountPrice\":\""+ discountPrice + "\"}";
            Gson gson = new Gson();
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("getNum", getNum);
            map.put("totalPrice", totalPrice);
            map.put("discountPrice", discountPrice);
            String str = gson.toJson(map);

            out.print(str);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if (out!=null) {
                out.flush();
                out.close();
            }
        }
    }

    /**
     * 修改购物车某个物品的数量
     * @param req
     * @param resp
     * @throws IOException
     */
    protected void editorGoodCount(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String cartId = req.getParameter("cartId");
        String goodNum = req.getParameter("goodNum");

        ShoppingCar shoppingCar = new ShoppingCar();

        if (cartId !=null && !"".equals(cartId) && goodNum != null && !"".equals(goodNum)) {
            shoppingCar.setCarId(Integer.parseInt(cartId));
            shoppingCar.setGoodNum(Integer.parseInt(goodNum));
            boolean flag = shoppingCartService.updateShoppingCart(shoppingCar);
            System.out.println("cardId:"+cartId);
            System.out.println("goodNum:"+goodNum);
            if (flag) {
                calculate(req, resp);
            }
        }

    }

    /**
     * 删除购物车内容
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void delShoppingCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String carId = req.getParameter("carId");
        ShoppingCar shoppingCar = new ShoppingCar();

        if (carId !=null && !"".equals(carId)){
            shoppingCar.setCarId(Integer.parseInt(carId));
            boolean flag = shoppingCartService.delShoppingCart(shoppingCar);
            if (flag) {
                req.getRequestDispatcher("shoppingServlet?action=shoppingCart").forward(req, resp);
            }
        }
    }

}
