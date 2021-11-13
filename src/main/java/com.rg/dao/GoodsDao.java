package com.rg.dao;

import com.rg.entity.Goods;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 19:16
 */
public interface GoodsDao {
    /**
     * 通过名称查询物品
     * @param goodName
     * @return
     */
    List<Goods> queryGoodsListByName(String goodName, Integer start);

    /**
     * 通过名字查询物品 符合条件的数量
     * @param goodName
     * @return
     */
    int queryGoodsTotalNum(String goodName);

    /**
     * 通过id查询物品
     * @param goodNo
     * @return
     */
    Goods queryGoodById(Integer goodNo);

    /**
     * 更新物品信息
     * @param goodNo
     * @param goodName
     * @param producer
     * @param stateId
     * @param price
     * @param discount
     * @param clssifyId
     * @param detailId
     * @param describe
     * @param imgSrc
     * @return
     */
    int updateGood(Integer goodNo, String goodName, String producer, Integer stateId, BigDecimal price, BigDecimal discount, Integer clssifyId,Integer detailId, String describe, String imgSrc);

    /**
     * 添加物品
     * @param goodName
     * @param producer
     * @param price
     * @param discount
     * @param classifyId
     * @param describe
     * @param imgSrc
     * @return
     */
    int addGood(String goodName, String producer, BigDecimal price, BigDecimal discount, Integer classifyId, String describe, String imgSrc);

    /**
     * 通过id删除物品 标记下架
     * @param goodNo
     * @return
     */
    int delGood(Integer goodNo);

}
