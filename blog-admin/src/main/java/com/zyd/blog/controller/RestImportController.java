package com.zyd.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.UatmTbkItem;
import com.taobao.api.request.TbkUatmFavoritesGetRequest;
import com.taobao.api.request.TbkUatmFavoritesItemGetRequest;
import com.taobao.api.response.TbkUatmFavoritesGetResponse;
import com.taobao.api.response.TbkUatmFavoritesItemGetResponse;
import com.zyd.blog.business.annotation.BussinessLog;
import com.zyd.blog.business.entity.Article;
import com.zyd.blog.business.service.BizArticleService;
import com.zyd.blog.business.vo.ArticleConditionVO;
import com.zyd.blog.framework.object.PageResult;
import com.zyd.blog.framework.object.ResponseVO;
import com.zyd.blog.framework.property.TaoBaoProperties;
import com.zyd.blog.util.ResultUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 文章标签管理
 *
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @website https://www.zhyd.me
 * @date 2018/4/24 14:37
 * @since 1.0
 */
@RestController
@RequestMapping("/import")
public class RestImportController {
    @Autowired
    TaoBaoProperties taoBaoProperties;
    @Autowired
    private BizArticleService articleService;

    @RequiresPermissions("imports")
    @PostMapping("/list")
    public PageResult list(Map vo) {
        String url = taoBaoProperties.url;
        String appkey = taoBaoProperties.appkey;
        String secret = taoBaoProperties.secret;
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkUatmFavoritesGetRequest req = new TbkUatmFavoritesGetRequest();
        req.setPageNo(1L);
        req.setPageSize(20L);
        req.setFields("favorites_title,favorites_id,type");
        req.setType(1L);
        List<Map> list = new ArrayList();
        try{
            TbkUatmFavoritesGetResponse rsp = client.execute(req);
            JSONObject jsonObjectBody = JSON.parseObject(rsp.getBody());
            JSONArray jsonArray = jsonObjectBody.getJSONObject("tbk_uatm_favorites_get_response").getJSONObject("results").getJSONArray("tbk_favorites");

            for (int i=0 ; i<jsonArray.size() ; i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                Map map = JSON.parseObject(jsonObject.toJSONString());
                list.add(map);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        PageInfo bean = new PageInfo<Map>(list);
        bean.setList(list);
        return ResultUtil.tablePage(bean);
    }

    @RequiresPermissions("import:add")
    @PostMapping(value = "/add")
    @BussinessLog("数据导入")
    public ResponseVO add(String favoritesId) {
        String url = taoBaoProperties.url;
        String appkey = taoBaoProperties.appkey;
        String secret = taoBaoProperties.secret;
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkUatmFavoritesItemGetRequest req = new TbkUatmFavoritesItemGetRequest();
        req.setPlatform(1L);
        req.setPageSize(20L);
        req.setAdzoneId(110088300188L);
        req.setUnid(String.valueOf(System.currentTimeMillis()));
        req.setFavoritesId(Long.valueOf(favoritesId));
        req.setPageNo(1L);
        req.setFields("num_iid,title,pict_url,click_url,volume,status,coupon_click_url,reserve_price,zk_final_price,coupon_info");
        int count = 0;
        try {
            TbkUatmFavoritesItemGetResponse rsp = client.execute(req);
            List<UatmTbkItem> list = rsp.getResults();
            for (int i = 0; i < list.size(); i++) {
                UatmTbkItem uatmTbkItem = list.get(i);
                //商品ID
                Long num_iid = uatmTbkItem.getNumIid();
                //商品标题
                String title = uatmTbkItem.getTitle();
                //商品主图
                String pict_url = uatmTbkItem.getPictUrl();
                //淘客地址
                String click_url = uatmTbkItem.getClickUrl();
                //30天销量
                Long volume = uatmTbkItem.getVolume();
                //宝贝状态，0失效，1有效；注：失效可能是宝贝已经下线或者是被处罚不能在进行推广
                Long status = uatmTbkItem.getStatus();
                //商品优惠券推广链接
                String coupon_click_url = uatmTbkItem.getCouponClickUrl();
                //商品一口价格
                String reserve_price = uatmTbkItem.getReservePrice();
                //商品折扣价格
                String zk_final_price = uatmTbkItem.getZkFinalPrice();
                //优惠卷面额
                String coupon_info =uatmTbkItem.getCouponInfo();
                if(status==1){
                    ArticleConditionVO vo = new ArticleConditionVO();
                    Article article = new Article();
                    Long userId = (Long)SecurityUtils.getSubject().getPrincipal();
                    article.setUserId(userId);
                    article.setTitle(title);
                    vo.setArticle(article);
                    PageInfo<Article> pageInfo = articleService.findPageBreakByCondition(vo);
                    if(pageInfo==null){
                        StringBuilder stringContent = new StringBuilder();
                        stringContent.append("<p><img src=\"").append(pict_url).append("\" alt=\"\" style=\"box-sizing: inherit; border-style: none; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; background-color: rgb(238, 238, 238);\"><br mxs=\"pub-threeaU:c\" style=\"box-sizing: inherit; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; background-color: rgb(238, 238, 238);\"></p><pre style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; white-space: pre-wrap; font-size: 12px; background-color: rgb(238, 238, 238);\">【爆款推荐】").append(title).append(" \n" +
                                "30天销量达").append(volume).append("件 \n" +
                                "原价").append(reserve_price).append("元，优惠价").append(zk_final_price).append("元");
                        if(coupon_info!=null && coupon_click_url!=null){
                            stringContent.append(",还有(").append(coupon_info).append(")的优惠卷可以领取哟！！！\n");
                        }else {
                            stringContent.append("\n");
                        }
                        stringContent.append("-----------------\n" +
                                "<p style=\"margin-top: 0px; margin-bottom: 16px;\">【立即领券】点击链接即可领券购买:<a href=\"").append(coupon_click_url==null?"":coupon_click_url).append("\" target=\"_blank\" style=\"color: rgb(3, 102, 214);\">").append(coupon_click_url==null?"无":coupon_click_url).append("</a></p><p style=\"margin-top: 0px; margin-bottom: 16px;\">【立即下单】点击链接立即下单：<a href=\"").append(click_url).append("\" target=\"_blank\" style=\"color: rgb(3, 102, 214);\">").append(click_url).append("</a></p></pre>");
                        count++;
                        article.setCoverImage(pict_url);
                        article.setIsMarkdown(false);
                        article.setContent(stringContent.toString());
                        article.setTop(false);
                        article.setTypeId(6L);
                        article.setStatus(1);
                        article.setRecommended(false);
                        article.setOriginal(true);
                        article.setDescription(title);
                        article.setKeywords(title);
                        article.setComment(true);
                        Long[] tags = {11L};
                        articleService.publish(article, tags, null);
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ResultUtil.success("数据导入成功！共导入"+count+"条数据");
    }
}
