package com.rg.dao.impl;

import com.rg.dao.PersonalDao;
import com.rg.entity.Personal;
import com.rg.entity.TheOrder;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/15 18:26
 */
public class PersoalDaoImpl extends BaseDao implements PersonalDao {
    @Override
    public List<List<Personal>> queryOrderByUserId(Integer uid) {

        List<List<Personal>> personalListList = new ArrayList<List<Personal>>();
        
        String sql = "SELECT orderNo FROM `theorder` WHERE uid = ?";

        List<TheOrder> objectList = queryForList(TheOrder.class, sql,uid);

        for (TheOrder o : objectList) {
            System.out.println( o.getOrderNo());
            String sql2 = "SELECT t.orderNo,t.time,d.goodNum,d.total,g.goodName,g.producer,g.price,os.state,ad.name,ad.province,ad.city,ad.district,ad.detailed,ad.phone,i.imgSrc FROM ((((`theorder` t LEFT JOIN `orderdetails` d ON t.orderNo = d.orderNo) LEFT JOIN `goods` g ON d.goodNo = g.goodNo) LEFT JOIN `orderstatus` os ON t.stateId = os.stateId) LEFT JOIN `address` ad ON ad.addressId = t.addressId) LEFT JOIN `img` i ON g.goodNo = i.goodNo WHERE t.orderNo = ?";
            List<Personal> personalList = queryForList(Personal.class, sql2,o.getOrderNo());
            personalListList.add(personalList);
        }

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        for (List<Personal> personalList : personalListList) {
            for (Personal personal : personalList) {
                System.out.println("orderNo:"+personal.getOrderNo()+",goodNum:"+personal.getGoodNum()+",time:"+sdf.format(personal.getTime()));
            }
        }

        return personalListList;
    }
}
