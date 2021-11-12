package com.rg.entity;

/**
 * @Describe：订单状态实体类
 * @Author:ZelongChen
 * @Date:2021/11/12 18:22
 */
public class OrderStatus {

    private Integer stateId;
    private String state;

    public Integer getStateId() {
        return stateId;
    }

    public void setStateId(Integer stateId) {
        this.stateId = stateId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

}
