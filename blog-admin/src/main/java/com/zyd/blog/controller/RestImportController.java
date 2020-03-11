package com.zyd.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TbkUatmFavoritesGetRequest;
import com.taobao.api.response.TbkUatmFavoritesGetResponse;
import com.zyd.blog.business.annotation.BussinessLog;
import com.zyd.blog.business.entity.Tags;
import com.zyd.blog.business.enums.ResponseStatus;
import com.zyd.blog.business.service.BizTagsService;
import com.zyd.blog.business.vo.TagsConditionVO;
import com.zyd.blog.framework.object.PageResult;
import com.zyd.blog.framework.object.ResponseVO;
import com.zyd.blog.persistence.beans.BizTags;
import com.zyd.blog.util.ResultUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
    private BizTagsService tagsService;

    //@RequiresPermissions("imports")
    @PostMapping("/list")
    public PageResult list(Map vo) {
        String url = "https://eco.taobao.com/router/rest";
        String appkey = "28485666";
        String secret = "feac79d58095283addca7ab933500b89";
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

    //@RequiresPermissions("import:add")
    @PostMapping(value = "/add")
    @BussinessLog("数据导入")
    public ResponseVO add(String favoritesId) {

        return ResultUtil.success("数据导入成功！"+favoritesId);
    }
}
