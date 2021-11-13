package com.rg.service;

import com.rg.entity.Goods;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 10:34
 */
public interface GoodsService {
    /**
     * 通过名称查询物品
     * @param goods
     * @return
     */
    List<Goods> queryGoodsByName(Goods goods);

    /**
     * 查询符合条件的物品有多少
     * @param goods
     * @return
     */
    int queryGoodTotalNum(Goods goods);

    /**
     * 通过id查找物品
     * @param goods
     * @return
     */
    Goods queryGoodById(Goods goods);

    /**
     * 更新物品
     * @param goods
     * @return
     */
    boolean updateGood(Goods goods);

    /**
     * 添加物品
     * @param goods
     * @return
     */
    boolean addGood(Goods goods);

    /**
     * 下架物品
     * @param goods
     * @return
     */
    boolean delGood(Goods goods);
}
