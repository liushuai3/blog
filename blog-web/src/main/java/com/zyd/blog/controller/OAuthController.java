package com.zyd.blog.controller;

import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TbkDgOptimusMaterialRequest;
import com.taobao.api.response.TbkDgOptimusMaterialResponse;
import com.zyd.blog.business.service.AuthService;
import com.zyd.blog.plugin.oauth.RequestFactory;
import com.zyd.blog.util.RequestUtil;
import com.zyd.blog.util.ResultUtil;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthToken;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
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
        authService.login(source, callback);
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

    public static void main(String[] args) throws Exception {
        String url = "https://eco.taobao.com/router/rest";
        String appkey = "28485666";
        String secret = "feac79d58095283addca7ab933500b89";
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        //TbkUatmFavoritesGetRequest req = new TbkUatmFavoritesGetRequest();
        //req.setPageNo(1L);
        //req.setPageSize(20L);
        //req.setFields("favorites_title,favorites_id,type");
        //req.setType(1L);
        //TbkUatmFavoritesGetResponse rsp = client.execute(req);
        //System.out.println(rsp.getBody());
        //
        //
        //TbkUatmFavoritesItemGetRequest reqx = new TbkUatmFavoritesItemGetRequest();
        //reqx.setPlatform(1L);
        //reqx.setPageSize(20L);
        //reqx.setAdzoneId(110088300188L);
        //reqx.setUnid("123456");
        //reqx.setFavoritesId(20228278L);
        //reqx.setPageNo(1L);
        //reqx.setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,user_type,provcity,item_url,seller_id,volume,nick,shop_title,zk_final_price_wap,event_start_time,event_end_time,tk_rate,status,type");
        //TbkUatmFavoritesItemGetResponse rspx = client.execute(reqx);
        //System.out.println(rspx.getBody());

        TbkDgOptimusMaterialRequest req = new TbkDgOptimusMaterialRequest();
        req.setPageSize(20L);
        req.setAdzoneId(110088300188L);
        req.setPageNo(1L);
        req.setMaterialId(32366L);
        TbkDgOptimusMaterialResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }

}
