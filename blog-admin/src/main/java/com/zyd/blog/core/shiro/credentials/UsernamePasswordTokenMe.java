package com.zyd.blog.core.shiro.credentials;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * Copyright: Copyright (c) 2019 -Linkage
 *
 * @ClassName: UsernamePasswordTokenMe
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: liushuai3
 * @date: 2019/10/12 18:02
 * *****
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/10/12     liushuai3           v1.0.0               修改原因
 */
public class UsernamePasswordTokenMe extends UsernamePasswordToken {
    /**
     *是否是第三方登录
     *
    **/
    private boolean isOAuth;

    public UsernamePasswordTokenMe(String username, String password, boolean rememberMe,boolean isOAuth) {
        super(username,password,rememberMe);
        this.isOAuth = isOAuth;
    }
    public boolean isOAuth() {
        return isOAuth;
    }

    public void setOAuth(boolean OAuth) {
        isOAuth = OAuth;
    }
}
