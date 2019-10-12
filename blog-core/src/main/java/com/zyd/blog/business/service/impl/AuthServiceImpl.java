package com.zyd.blog.business.service.impl;

import com.zyd.blog.business.entity.User;
import com.zyd.blog.business.enums.UserTypeEnum;
import com.zyd.blog.business.service.AuthService;
import com.zyd.blog.business.service.SysUserRoleService;
import com.zyd.blog.business.service.SysUserService;
import com.zyd.blog.plugin.oauth.RequestFactory;
import com.zyd.blog.util.BeanConvertUtil;
import com.zyd.blog.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @website https://www.zhyd.me
 * @date 2019/5/25 14:34
 * @since 1.8
 */
@Slf4j
@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private SysUserService userService;
    @Autowired
    private SysUserRoleService userRoleService;

    @Override
    public boolean login(String source, AuthCallback callback) {
        AuthRequest authRequest = RequestFactory.getInstance(source).getRequest();
        AuthResponse response = authRequest.login(callback);
        if (response.ok()) {
            AuthUser authUser = (AuthUser) response.getData();
            log.error("authUser："+authUser.toString());
            User newUser = BeanConvertUtil.doConvert(authUser, User.class);
            newUser.setSource(authUser.getSource().toString());
            if (null != authUser.getGender()) {
                newUser.setGender(authUser.getGender().getCode());
            }
            User user = userService.getByUuidAndSource(authUser.getUuid(), authUser.getSource().toString());
            newUser.setUserType(UserTypeEnum.USER);
            if (null != user) {
                newUser.setId(user.getId());
                userService.updateSelective(newUser);
            } else {
                userService.insert(newUser);
                userRoleService.addUserRole(newUser.getId(), "4");
            }
            SessionUtil.setUser(newUser);
            return true;
        }
        log.error("[{}] {}", source, response.getMsg());
        return false;
    }

    @Override
    public boolean revoke(String source, Long userId) {
        return false;
    }

    @Override
    public void logout() {
        SessionUtil.removeUser();
    }
}
