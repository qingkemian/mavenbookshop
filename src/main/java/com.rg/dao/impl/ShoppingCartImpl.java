package com.rg.dao.impl;

import com.rg.constants.Constants;
import com.rg.dao.ShoppingCarDao;
import com.rg.entity.Goods;
import com.rg.entity.ShoppingCar;

import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 15:18
 */
public class ShoppingCartImpl extends BaseDao implements ShoppingCarDao {

    /*
     * log
     * */
    private static String classname = ShoppingCartImpl.class.getName();
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
    public ShoppingCar queryShoppingCartByUserIdAndGoodNo(Integer uid, Integer goodNo) {
        String sql = "SELECT sc.*,g.goodName,g.producer,i.imgSrc,g.price,g.discount FROM (shoppingcar sc LEFT JOIN goods g ON sc.goodNo = g.goodNo) LEFT JOIN img i ON g.goodNo = i.goodNo WHERE sc.uid = ? AND sc.goodNo = ?";
        return queryForOne(ShoppingCar.class,sql,uid,goodNo);
    }

    @Override
    public int updateShoppingCart(Integer cardId, Integer goodNum) {
        String sql = "UPDATE shoppingcar SET `goodNum` = ? WHERTE `carId` = ?";
        return update(sql,goodNum,cardId);
    }

    @Override
    public int delShoppingCart(Integer cardId) {
        String sql = "DELETE FROM shoppingcar WHERE `carId` = ?";
        return update(sql, cardId);
    }
}
