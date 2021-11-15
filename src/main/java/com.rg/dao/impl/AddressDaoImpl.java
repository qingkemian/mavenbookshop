package com.rg.dao.impl;

import com.rg.dao.AddressDao;
import com.rg.entity.Address;

import java.util.List;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/14 21:10
 */
public class AddressDaoImpl extends BaseDao implements AddressDao {

    /*
     * log
     * */
    private static String classname = AddressDaoImpl.class.getName();
    private static Logger log = Logger.getLogger(classname);

    @Override
    public List<Address> queryAddressListByUserId(Integer uid) {
        String sql = "SELECT * FROM address WHERE uid = ? AND flag = 1";
        return queryForList(Address.class, sql,uid);
    }

    @Override
    public int addAddress(Integer uid, String name, String province, String city, String district, String detailed, String phone, boolean flag) {
//        INSERT INTO `address` (`uid`, `name`, `province`, `city`, `district`, `detailed`, `phone`, `flag`) VALUES (1,'qkm','江苏省','苏州市','虎丘区','苏州科技大学',18650448823,1);
        String sql = "INSERT INTO `address` (`uid`, `name`, `province`, `city`, `district`, `detailed`, `phone`, `flag`) VALUES (?,?,?,?,?,?,?,?);";
        return update(sql,uid, name, province, city, district, detailed, phone, flag);
    }

    @Override
    public int delAddress(Integer addressId) {
        String sql = "UPDATE address SET `flag` = 0 WHERE `addressId` = ?";
        return update(sql,addressId);
    }


}
