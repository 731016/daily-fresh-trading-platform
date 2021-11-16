package com.zr.enums;

import org.apache.commons.lang3.math.NumberUtils;

public enum UserState {

    REGISTER_SUCCESS("注册成功", 0),
    LOGIN_SUCCESS("登陆成功", 1),
    REGISTER_FAIL("注册失败", 2),
    LOGIN_FAIL("登陆失败", 3);

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
