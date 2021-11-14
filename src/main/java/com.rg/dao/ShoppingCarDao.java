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
     * 通过CartId查询购物车
     * @param cartId
     * @return
     */
    ShoppingCar querryShoppingCartByCartId(Integer cartId);

    /**
     * 查询一个用户之前有没有添加过该物品
     * @param uid
     * @param goodNo
     * @return
     */
    ShoppingCar queryShoppingCartByUserIdAndGoodNo(Integer uid, Integer goodNo);

    /**
     * 修改物品数量
     * @param cartId
     * @param goodNum
     * @return
     */
    int updateShoppingCart(Integer cartId, Integer goodNum);

    /**
     * 添加购物车记录
     * @param goodNo
     * @param goodNum
     * @param uid
     * @return
     */
    int addShoppingCart(Integer goodNo, Integer goodNum, Integer uid);

    /**
     * 删除购物车的一条商品
     * @param cartId
     * @return
     */
    int delShoppingCart(Integer cartId);

}
