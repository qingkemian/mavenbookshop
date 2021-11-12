package com.rg.entity;

import java.math.BigDecimal;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 19:07
 */
public class OrderDetails {

    private Integer detailsNo;
    private Integer orderNo;
    private Integer goodNo;
    private Integer goodNum;
    private BigDecimal price;
    private BigDecimal total;

    public Integer getDetailsNo() {
        return detailsNo;
    }

    public void setDetailsNo(Integer detailsNo) {
        this.detailsNo = detailsNo;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
}
