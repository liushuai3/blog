package com.zyd.blog.framework.property;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Copyright: Copyright (c) 2020 - Asiainfo
 *
 * @ClassName: TaoBaoProperties
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: liushuai3
 * @date: 2020/3/12 16:05
 * *****
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2020/3/12     liushuai3           v1.0.0               修改原因
 */
@Component
@ConfigurationProperties(prefix = "spring.taobao")
@Data
public class TaoBaoProperties {
    public String url;
    public String appkey;
    public String secret;
}
