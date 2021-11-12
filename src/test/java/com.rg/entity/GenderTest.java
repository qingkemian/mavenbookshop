package com.rg.entity;

import org.junit.Test;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 9:02
 */
public class GenderTest {

    @Test
    public void test1(){
        Gender myGender = Gender.MALE;

        switch (myGender){
            case MALE:System.out.println("男");break;
            case FEMALE:System.out.println("女");break;
        }

    }

}
