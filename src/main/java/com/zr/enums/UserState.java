package com.zr.enums;

import org.apache.commons.lang3.math.NumberUtils;

public enum UserState {

    REGISTER_SUCCESS("注册成功", 0),
    LOGIN_SUCCESS("登陆成功", 1),
    REGISTER_FAIL("注册失败", 2),
    LOGIN_FAIL("登陆失败", 3),
    REGISTER_FAIL_ACCOUNT_EXIST("用户已注册",4),
    USER_RESET_FAIL("密码修改失败",5),
    USER_PWD_REPEAT("要修改的密码与原密码相同",6),
    USER_ACCOUNT_NOEXIST("用户名不存在",7),
    ORDER_ADD_FAIL("下单失败",8);

    private String name;
    private int value;

    UserState(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public static UserState getUserStateByValue(int value) {
        for (UserState userState : UserState.values()) {
            if (NumberUtils.compare(value, userState.getValue()) == 0) {
                return userState;
            }
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public int getValue() {
        return value;
    }
}
