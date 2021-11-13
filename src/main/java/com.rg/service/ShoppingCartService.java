package com.rg.service;

import com.rg.entity.ShoppingCar;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 15:40
 */
public interface ShoppingCartService {

    /**
     * 通过uid查询其购物车
     * @param shoppingCar
     * @return
     */
    List<ShoppingCar> queryShoppingCartByUserId(ShoppingCar shoppingCar);

    /**
     * 通过cartId查询购物车
     * @param shoppingCar
     * @return
     */
    ShoppingCar querryShoppingCartByCartId(ShoppingCar shoppingCar);

    /**
     * 查询用户购物车中是否已有该商品
     * @param shoppingCar
     * @return
     */
    ShoppingCar queryShoppingCartByUserIdAndGoodNo(ShoppingCar shoppingCar);

    /**
     * 更新购物车 商品数量
     * @param shoppingCar
     * @return
     */
    boolean updateShoppingCart(ShoppingCar shoppingCar);

    /**
     * 添加购物车记录
     * @param shoppingCar
     * @return
     */
    boolean addShoppingCart(ShoppingCar shoppingCar);

    /**
     * 删除购物车中的一条记录
     * @param shoppingCar
     * @return
     */
    boolean delShoppingCart(ShoppingCar shoppingCar);

}
