package com.zyd.blog.controller;

import com.zyd.blog.business.entity.User;
import com.zyd.blog.business.service.AuthService;
import com.zyd.blog.core.shiro.credentials.UsernamePasswordTokenMe;
import com.zyd.blog.plugin.oauth.RequestFactory;
import com.zyd.blog.util.RequestUtil;
import com.zyd.blog.util.ResultUtil;
import com.zyd.blog.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthToken;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @website https://www.zhyd.me
 * @date 2019/2/19 9:28
 * @since 1.8
 */
@Slf4j
@Controller
@RequestMapping("/oauth")
public class OAuthController {

    @Autowired
    private AuthService authService;

    @RequestMapping("/render/{source}")
    public void renderAuth(@PathVariable("source") String source, HttpServletResponse response, HttpSession session) throws IOException {
        AuthRequest authRequest = RequestFactory.getInstance(source).getRequest();
        session.setAttribute("historyUrl", RequestUtil.getReferer());
        response.sendRedirect(authRequest.authorize(AuthStateUtils.createState()));
    }

    /**
     * 授权回调地址
     *
     * @param source   授权回调来源
     * @param callback 回调参数包装类
     * @return
     */
    @RequestMapping("/callback/{source}")
    public ModelAndView login(@PathVariable("source") String source, AuthCallback callback, HttpSession session) {
        boolean isLogin = authService.login(source, callback);
        log.error("isLogin：", isLogin);
        if(isLogin){
            User user = SessionUtil.getUser();
            UsernamePasswordTokenMe token = new UsernamePasswordTokenMe(user.getUsername(), "", false,true);
            //获取当前的Subject
            Subject currentUser = SecurityUtils.getSubject();
            try {
                // 在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查
                // 每个Realm都能在必要时对提交的AuthenticationTokens作出反应
                // 所以这一步在调用login(token)方法时,它会走到xxRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法
                currentUser.login(token);
            }catch (Exception e){
                log.error("登录异常:"+e.getMessage(), e);
            }
        }
        String historyUrl = (String) session.getAttribute("historyUrl");
        session.removeAttribute("historyUrl");
        if (StringUtils.isEmpty(historyUrl)) {
            return ResultUtil.redirect("/");
        }
        return ResultUtil.redirect(historyUrl);
    }

    /**
     * 收回授权
     *
     * @param source
     * @param token
     * @return
     * @throws IOException
     */
    @RequestMapping("/revoke/{source}/{token}")
    public ModelAndView revokeAuth(@PathVariable("source") String source, @PathVariable("token") String token) throws IOException {
        AuthRequest authRequest = RequestFactory.getInstance(source).getRequest();
        AuthResponse response = authRequest.revoke(AuthToken.builder().accessToken(token).build());
        if (response.getCode() == 2000) {
            return ResultUtil.redirect("/");
        }
        return ResultUtil.redirect("/login");
    }

    /**
     * 退出登录
     *
     * @throws IOException
     */
    @RequestMapping("/logout")
    public ModelAndView logout() {
        authService.logout();
        return ResultUtil.redirect("/");
    }

}
