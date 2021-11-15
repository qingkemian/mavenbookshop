package com.rg.service.impl;

import com.rg.dao.OrderDao;
import com.rg.dao.impl.OrderDaoImpl;
import com.rg.entity.OrderDetails;
import com.rg.entity.TheOrder;
import com.rg.entity.User;
import com.rg.service.OrderService;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 14:55
 */
public class OrderServiceImpl implements OrderService {

    OrderDao orderDao = new OrderDaoImpl();

    @Override
    public List<OrderDetails> queryOneOrderDetails(TheOrder theOrder) {
        return orderDao.queryOneOrderDetails(theOrder.getOrderNo());
    }

    @Override
    public List<TheOrder> queryUsersOrder(User user) {
        return orderDao.queryUsersOrder(user.getUid());
    }

    @Override
    public boolean addOrder(TheOrder theOrder) {
        int flag = orderDao.addOrder(theOrder.getAddressId(), theOrder.getPrice(), theOrder.getUid(), theOrder.getCartId());
        if (flag > 0) {
            return true;
        }
        return false;
    }
}
