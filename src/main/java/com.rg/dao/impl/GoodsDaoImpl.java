package com.rg.dao.impl;

import com.rg.constants.Constants;
import com.rg.dao.GoodsDao;
import com.rg.entity.GoodDetail;
import com.rg.entity.Goods;
import com.rg.entity.User;

import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 19:15
 */
public class GoodsDaoImpl extends BaseDao implements GoodsDao {

    /*
     * log
     * */
    private static String classname = GoodsDaoImpl.class.getName();
    private static Logger log = Logger.getLogger(classname);

    @Override
    public List<Goods> queryGoodsListByName(String goodName, Integer start) {
        String sql = "SELECT * FROM goods WHERE 1=1 ";
        // 动态sql
        if (goodName != null && !"".equals(goodName)){
            sql = sql + "AND goodName LIKE '%" + goodName + "%'";
        }
        sql += "LIMIT " + start + "," + Constants.PAGE_SIZE;
        log.info(sql);

        return queryForList(Goods.class, sql);
    }

    @Override
    public int queryGoodsTotalNum(String goodName) {
        String sql = "SELECT count(1) FROM goods WHERE 1=1 ";
        // 动态sql
        if (goodName != null && !"".equals(goodName)) {
            sql = sql + "AND goodName LIKE '%" + goodName + "%'";
        }
        log.info(sql);

        return ((Long)queryForSingleValue(sql)).intValue();
    }

    @Override
    public Goods queryGoodById(Integer goodNo) {
        String sql = "SELECT * FROM goods WHERE `goodNO` = ?";
        return queryForOne(Goods.class,sql,goodNo);
    }

    @Override
    public int updateGood(Integer goodNo, String goodName, String producer, Integer stateId, BigDecimal price, BigDecimal discount, Integer clssifyId,Integer detailId, String describe, String imgSrc) {
        int flag = 0;

        String sql1 = "UPDATE goods SET `goodName` = ? , `producer` = ? , `stateId` = ? , `price` = ? , `discount` = ? , `classifyId` = ? WHERE `goodNo` = ?";
        int flag1 = update(sql1,goodName,producer,stateId,price,discount,clssifyId);
        String sql2 = "UPDATE gooddetail SET `describe` = ? WHERTE `detailId` = ?";
        int flag2 = update(sql2,describe,detailId);
        String sql3 = "UPDATE img SET `imgSrc` WHERE `goodNo` = goodNo";
        int flag3 = update(sql3,imgSrc,goodNo);

        flag = flag1 * flag2 * flag3;

        return flag;
    }

    @Override
    public int addGood(String goodName, String producer, BigDecimal price, BigDecimal discount, Integer classifyId, String describe, String imgSrc) {
        int flag = 0;

        String sql1 = "INSERT INTO goods (goodName,producer,price,discount,classifyId) VALUES (?,?,?,?,?)";
        int flag1 = update(sql1,goodName,producer,price,discount,classifyId);
        String sql2 = "select last_insert_id();";
        Integer goodNo = queryForOne(Integer.class,sql2);
        String sql3 = "INSERT INTO gooddetail (describe) VALUES (?)";
        int flag2 = update(sql3, describe);
        String sql4 = "select last_insert_id();";
        Integer detailId = queryForOne(Integer.class,sql3);
        String sql5 = "UPDATE goods SET `detailId` = ? WHERE `goodNo` = ?";
        int flag3 = update(sql5,detailId,goodNo);
        String sql6 = "INSERT INTO img (imgSrc,goodNo) VALUES (?,?)";
        int flag4 = update(sql6,imgSrc,goodNo);

        flag = flag1 * flag2 * flag3 * flag4;

        return flag;
    }

    @Override
    public int delGood(Integer goodNo) {

        String sql5 = "UPDATE goods SET `stateId` = 3 WHERE `goodNo` = ?";
        return update(sql5,goodNo);

    }
}
