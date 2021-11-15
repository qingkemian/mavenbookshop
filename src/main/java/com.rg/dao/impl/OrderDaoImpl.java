package com.rg.dao.impl;

import com.rg.dao.OrderDao;
import com.rg.dao.ShoppingCarDao;
import com.rg.entity.OrderDetails;
import com.rg.entity.ShoppingCar;
import com.rg.entity.TheOrder;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 14:33
 */
public class OrderDaoImpl extends BaseDao implements OrderDao {
    @Override
    public List<OrderDetails> queryOneOrderDetails(Integer orderNo) {
        String sql = "SELECT * FROM `orderdetails` WHERE orderNo = ?";
        return queryForList(OrderDetails.class, sql,orderNo);
    }

    @Override
    public List<TheOrder> queryUsersOrder(Integer uid) {
        String sql = "SELECT * FROM `theorder` WHERE uid = ?";
        return queryForList(TheOrder.class, sql,uid);
    }

    @Override
    public int addOrder(Integer addressId, BigDecimal price, Integer uid, String[] cartId) {
        int flag = 1;

        // 插入值到theorder表
        String sql1 = "INSERT INTO `theorder` (`stateId`,`addressId`,`price`,`uid`) VALUES (1,?,?,?)";
        int flag1 = update(sql1,addressId,price,uid);

        flag = flag * flag1;

        // 查询最后插入的id 即orderNO
        String sql2 = "select last_insert_id();";

        Integer orderNo = queryLastInsert(sql2);

        // 遍历插入order详情 并删除对应购物车
        ShoppingCarDao shoppingCarDao = new ShoppingCartDaoImpl();
        ShoppingCar shoppingCar = new ShoppingCar();
        for (String id  : cartId) {
            shoppingCar = shoppingCarDao.querryShoppingCartByCartId(Integer.parseInt(id));
            String sql3 = "INSERT INTO `orderdetails` (`orderNo`,`goodNo`,`goodNum`,`price`,`total`) VALUES (?,?,?,?,?);";
            BigDecimal totalPrice = new BigDecimal(0);
            totalPrice = totalPrice.add( ( shoppingCar.getPrice().multiply(  new BigDecimal( shoppingCar.getGoodNum().toString() ) ) ).multiply(shoppingCar.getDiscount())) ;
            int flag3 = update(sql3, orderNo, shoppingCar.getGoodNo(), shoppingCar.getGoodNum(), shoppingCar.getPrice(), totalPrice);

            String sql4 = "DELETE FROM `shoppingcar` WHERE `carId` = ?";
            int flag4 = update(sql4,id);

            flag = flag * flag3 * flag4;
        }

        return flag;
    }
}
