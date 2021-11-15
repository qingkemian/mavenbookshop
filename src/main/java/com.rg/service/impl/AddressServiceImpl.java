package com.rg.service.impl;

import com.rg.dao.AddressDao;
import com.rg.dao.impl.AddressDaoImpl;
import com.rg.entity.Address;
import com.rg.service.AddressService;

import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/14 21:32
 */
public class AddressServiceImpl implements AddressService {

    AddressDao addressDao = new AddressDaoImpl();

    @Override
    public Address queryAddressByAddressId(Address address) {
        return addressDao.queryAddressByAddressId(address.getAddressId());
    }

    @Override
    public List<Address> queryAddressListByUserId(Address address) {
        return addressDao.queryAddressListByUserId(address.getUid());
    }

    @Override
    public boolean addAddress(Address address) {
        int flag = addressDao.addAddress(address.getUid(), address.getName(), address.getProvince(), address.getCity(), address.getDistrict(), address.getDetailed(), address.getPhone(), address.isFlag());
        if (flag > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean delAddress(Address address) {
        int flag = addressDao.delAddress(address.getAddressId());
        if (flag > 0){
            return true;
        }
        return false;
    }
}
