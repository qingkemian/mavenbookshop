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
    private BigDecimal discount;

    // 页面 -- 分页
    private Integer start;

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

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }
}
