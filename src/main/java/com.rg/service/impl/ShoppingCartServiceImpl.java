package com.rg.service.impl;

import com.rg.dao.ShoppingCarDao;
import com.rg.dao.impl.ShoppingCartImpl;
import com.rg.entity.ShoppingCar;
import com.rg.service.ShoppingCartService;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 15:40
 */
public class ShoppingCartServiceImpl implements ShoppingCartService {

    ShoppingCarDao shoppingCarDao = new ShoppingCartImpl();

    @Override
    public List<ShoppingCar> queryShoppingCartByUserId(ShoppingCar shoppingCar) {
        return shoppingCarDao.queryShoppingCartByUserId(shoppingCar.getUid(), shoppingCar.getStart());
    }

    @Override
    public ShoppingCar queryShoppingCartByUserIdAndGoodNo(ShoppingCar shoppingCar) {
        return shoppingCarDao.queryShoppingCartByUserIdAndGoodNo(shoppingCar.getUid(), shoppingCar.getGoodNo());
    }

    @Override
    public boolean updateShoppingCart(ShoppingCar shoppingCar) {
        int flag = shoppingCarDao.updateShoppingCart(shoppingCar.getCardId(), shoppingCar.getGoodNum());
        if (flag > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean delShoppingCart(ShoppingCar shoppingCar) {
        int flag = shoppingCarDao.delShoppingCart(shoppingCar.getCardId());
        if (flag > 0) {
            return true;
        }
        return false;
    }
}
