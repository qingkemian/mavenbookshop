package com.rg.dao;

import com.mysql.cj.x.protobuf.MysqlxCrud;
import com.rg.entity.Address;
import com.rg.entity.OrderDetails;
import com.rg.entity.TheOrder;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 14:41
 */
public interface OrderDao {

    /**
     * 通过订单号查询该订单的所有详情
     * @param orderNo
     * @return
     */
    List<OrderDetails> queryOneOrderDetails(Integer orderNo);

    /**
     * 通过uid查询一个用户的所有订单
     * @param uid
     * @return
     */
    List<TheOrder> queryUsersOrder(Integer uid);

    /**
     * 添加新订单
     * @param addressId
     * @param price
     * @param uid
     * @return
     */
    int addOrder(Integer addressId, BigDecimal price, Integer uid, String[] cartId);
}
