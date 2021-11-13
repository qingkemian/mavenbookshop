package com.rg.service.impl;

import com.rg.dao.GoodsDao;
import com.rg.dao.impl.GoodsDaoImpl;
import com.rg.entity.Goods;
import com.rg.service.GoodsService;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/13 10:34
 */
public class GoodsServiceImpl implements GoodsService {
    GoodsDao goodsDao = new GoodsDaoImpl();

    @Override
    public List<Goods> queryGoodsByName(Goods goods) {
        return goodsDao.queryGoodsListByName(goods.getGoodName(),goods.getStart());
    }

    @Override
    public int queryGoodTotalNum(Goods goods) {
        return goodsDao.queryGoodsTotalNum(goods.getGoodName());
    }

    @Override
    public Goods queryGoodById(Goods goods) {
        return goodsDao.queryGoodById(goods.getGoodNo());
    }

    @Override
    public boolean updateGood(Goods goods) {
        int flag = goodsDao.updateGood(goods.getGoodNo(), goods.getGoodName(), goods.getProducer(), goods.getStateId(), goods.getPrice(), goods.getDiscount() ,goods.getClassifyId(), goods.getDetailId(), goods.getDescribe(), goods.getImgSrc());
        if (flag > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean addGood(Goods goods) {
        int flag = goodsDao.addGood(goods.getGoodName(), goods.getProducer(), goods.getPrice(), goods.getDiscount(), goods.getClassifyId(), goods.getDescribe(), goods.getImgSrc());
        if (flag > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean delGood(Goods goods) {
        int flag = goodsDao.delGood(goods.getGoodNo());
        if (flag > 0) {
            return true;
        }
        return false;
    }
}
