package com.rg.dao;

import com.rg.entity.Address;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/14 21:10
 */
public interface AddressDao {

    /**
     * 通过uid查询收货地址
     * @param uid
     * @return
     */
    List<Address> queryAddressListByUserId(Integer uid);

    /**
     * 添加地址
     * @param uid
     * @param name
     * @param province
     * @param city
     * @param district
     * @param detailed
     * @param phone
     * @param flag
     * @return
     */
    int addAddress(Integer uid, String name, String province, String city, String district, String detailed, String phone , boolean flag);

    /**
     * 判断地址是不是默认地址
     * @param uid
     * @param flag
     * @return
     */
    int updateAddress(Integer uid, boolean flag);

}
