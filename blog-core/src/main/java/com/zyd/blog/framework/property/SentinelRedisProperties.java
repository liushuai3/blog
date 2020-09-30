package com.zyd.blog.framework.property;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * sentinelRedis属性配置文件
 * @author liushuai3
 */
@Component
@ConfigurationProperties(prefix = "spring.redis.sentinel")
@Data
@EqualsAndHashCode(callSuper = false)
@Order(-1)
public class SentinelRedisProperties {
    private String nodes;
    private String master;
}
