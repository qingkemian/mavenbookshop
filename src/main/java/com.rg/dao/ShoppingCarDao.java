package com.rg.dao;

import com.rg.entity.ShoppingCar;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 14:30
 */
public interface ShoppingCarDao {

    /**
     * 通过uid查询购物车
     * @param uid
     * @return
     */
    List<ShoppingCar> queryShoppingCartByUserId(Integer uid, Integer start);

    /**
     * 查询一个用户之前有没有添加过该物品
     * @param uid
     * @param goodNo
     * @return
     */
    ShoppingCar queryShoppingCartByUserIdAndGoodNo(Integer uid, Integer goodNo);

    /**
     * 修改物品数量
     * @param cardId
     * @param goodNum
     * @return
     */
    int updateShoppingCart(Integer cardId, Integer goodNum);

    /**
     * 删除购物车的一条商品
     * @param cardId
     * @return
     */
    int delShoppingCart(Integer cardId);

}
