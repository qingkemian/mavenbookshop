package com.rg.service;

import com.rg.entity.Address;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/14 21:32
 */
public interface AddressService {

    List<Address> queryAddressListByUserId(Address address);

    boolean addAddress(Address address);

    boolean updateAddress(Address address);

}
