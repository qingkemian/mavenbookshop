package com.rg.entity;

import java.math.BigDecimal;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 19:03
 */
public class Goods {

    private Integer goodNo;
    private String goodName;
    private String producer;
    private Integer stateId;
    private Integer detailId;
    private BigDecimal price;
    private BigDecimal discount;
    private Integer classifyId;

    public Integer getGoodNo() {
        return goodNo;
    }

    public void setGoodNo(Integer goodNo) {
        this.goodNo = goodNo;
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

    public Integer getStateId() {
        return stateId;
    }

    public void setStateId(Integer stateId) {
        this.stateId = stateId;
    }

    public Integer getDetailId() {
        return detailId;
    }

    public void setDetailId(Integer detailId) {
        this.detailId = detailId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }
}
