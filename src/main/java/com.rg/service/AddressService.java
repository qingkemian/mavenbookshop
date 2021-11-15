package com.rg.service;

import com.rg.entity.Address;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/14 21:32
 */
public interface AddressService {

    /**
     * 通过地址Id查询地址详情
     * @param address
     * @return
     */
    Address queryAddressByAddressId(Address address);

    /**
     * 通过userId查询该用户的所有地址
     * @param address
     * @return
     */
    List<Address> queryAddressListByUserId(Address address);

    /**
     * 添加地址
     * @param address
     * @return
     */
    boolean addAddress(Address address);

    /**
     * 删除地址
     * @param address
     * @return
     */
    boolean delAddress(Address address);

}
