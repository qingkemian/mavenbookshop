package com.rg.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * @Describe：订单实体类
 * @Author:ZelongChen
 * @Date:2021/11/12 18:24
 */
public class TheOrder {

    private Integer orderNo;
    private Timestamp time;
    private Integer stateId;
    private Integer addressId;
    private BigDecimal price;
    private Integer uid;

    private String[] cartId;

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getStateId() {
        return stateId;
    }

    public void setStateId(Integer stateId) {
        this.stateId = stateId;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String[] getCartId() {
        return cartId;
    }

    public void setCartId(String[] cartId) {
        this.cartId = cartId;
    }
}
