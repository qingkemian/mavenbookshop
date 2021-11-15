package com.rg.service;

import com.rg.entity.OrderDetails;
import com.rg.entity.TheOrder;
import com.rg.entity.User;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 14:54
 */
public interface OrderService {

    /**
     * 通过orderNo查询订单详情
     * @param theOrder
     * @return
     */
    List<OrderDetails> queryOneOrderDetails(TheOrder theOrder);

    /**
     * 通过uid查询用户订单
     * @param user
     * @return
     */
    List<TheOrder> queryUsersOrder(User user);

    /**
     * 添加订单 订单详情 删除相关购物车
     * @param theOrder
     * @return
     */
    boolean addOrder(TheOrder theOrder);

}
