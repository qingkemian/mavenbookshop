package com.rg.entity;

import java.math.BigDecimal;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 19:10
 */
public class ShoppingCar {

    private Integer cardId;
    private Integer goodNo;
    private Integer goodNum;
    private Integer uid;

    // 将其它属性也加入到该实体类中
    private String goodName;
    private String producer;
    private String imgSrc;
    private BigDecimal price;


    public Integer getCardId() {
        return cardId;
    }

    public void setCardId(Integer cardId) {
        this.cardId = cardId;
    }

    public Integer getGoodNo() {
        return goodNo;
    }

    public void setGoodNo(Integer goodNo) {
        this.goodNo = goodNo;
    }

    public Integer getGoodNum() {
        return goodNum;
    }

    public void setGoodNum(Integer goodNum) {
        this.goodNum = goodNum;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
