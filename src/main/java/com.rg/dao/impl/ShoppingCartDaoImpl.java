package com.rg.dao.impl;

import com.rg.constants.Constants;
import com.rg.dao.ShoppingCarDao;
import com.rg.entity.ShoppingCar;

import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 15:18
 */
public class ShoppingCartDaoImpl extends BaseDao implements ShoppingCarDao {

    /*
     * log
     * */
    private static String classname = ShoppingCartDaoImpl.class.getName();
    private static Logger log = Logger.getLogger(classname);

    @Override
    public List<ShoppingCar> queryShoppingCartByUserId(Integer uid, Integer start) {
        String sql = "SELECT sc.*,g.goodName,g.producer,i.imgSrc,g.price,g.discount FROM (shoppingcar sc LEFT JOIN goods g ON sc.goodNo = g.goodNo) LEFT JOIN img i ON g.goodNo = i.goodNo WHERE 1=1 ";
        // 动态sql
        if (uid != null && !"".equals(uid)){
            sql = sql + "AND sc.uid = '" + uid + "'";
        }
        sql += "LIMIT " + start + "," + Constants.BIG_PAGE_SIZE;
        log.info(sql);

        return queryForList(ShoppingCar.class, sql);
    }

    @Override
    public ShoppingCar querryShoppingCartByCartId(Integer cartId) {
        String sql = "SELECT sc.*,g.goodName,g.producer,i.imgSrc,g.price,g.discount FROM (shoppingcar sc LEFT JOIN goods g ON sc.goodNo = g.goodNo) LEFT JOIN img i ON g.goodNo = i.goodNo WHERE sc.carId = ?";
        log.info(sql);

        return queryForOne(ShoppingCar.class, sql,cartId);
    }

    @Override
    public ShoppingCar queryShoppingCartByUserIdAndGoodNo(Integer uid, Integer goodNo) {
        String sql = "SELECT sc.*,g.goodName,g.producer,i.imgSrc,g.price,g.discount FROM (shoppingcar sc LEFT JOIN goods g ON sc.goodNo = g.goodNo) LEFT JOIN img i ON g.goodNo = i.goodNo WHERE sc.uid = ? AND sc.goodNo = ?";
        return queryForOne(ShoppingCar.class,sql,uid,goodNo);
    }

    @Override
    public int updateShoppingCart(Integer cardId, Integer goodNum) {
        String sql = "UPDATE shoppingcar SET `goodNum` = ? WHERE `carId` = ?";
        return update(sql,goodNum,cardId);
    }

    @Override
    public int addShoppingCart(Integer goodNo, Integer goodNum, Integer uid) {
        ShoppingCar shoppingCar = queryShoppingCartByUserIdAndGoodNo(uid, goodNo);
        if (shoppingCar == null) {
            String sql = "INSERT INTO shoppingcar (goodNo,goodNum,uid) VALUES (?,?,?)";
            return update(sql,goodNo,goodNum,uid);
        } else {
            return updateShoppingCart(shoppingCar.getCarId(), goodNum);
        }
    }

    @Override
    public int delShoppingCart(Integer cardId) {
        String sql = "DELETE FROM shoppingcar WHERE `carId` = ?";
        return update(sql, cardId);
    }
}
