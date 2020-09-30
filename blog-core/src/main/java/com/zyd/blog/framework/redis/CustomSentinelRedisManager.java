package com.zyd.blog.framework.redis;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.crazycake.shiro.RedisManager;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisSentinelPool;

import java.util.Set;

/**
 * 自定义org.crazycake.shiro.RedisManager。<br/>
 * 该自定义的Manager扩展的功能：<br/>
 * 1.增加database参数，可跟随配置文件的数据库索引选择redis数据库保存相关数据，避免了多个项目共用一个redis database所潜在的问题<br/>
 * 2.修改expire参数，默认值为30天 = 2592000s <br/>
 *
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @website https://www.zhyd.me
 * @date 2018/6/12 14:22
 * @since 1.0
 */
public class CustomSentinelRedisManager extends RedisManager {
    private static JedisSentinelPool jedisPool = null;
    private String masterName = null;
    Set<String> sentinels = null;
    private int expire = 2592000;
    private int timeout = 2000;
    private int database = 0;
    private String password = null;

    public CustomSentinelRedisManager() {
    }

    @Override
    public void init() {
        if (jedisPool == null) {
            jedisPool = new JedisSentinelPool(masterName, sentinels, new GenericObjectPoolConfig(), timeout, password, database);
        }
    }

    @Override
    public byte[] get(byte[] key) {
        byte[] value = null;

        try (Jedis jedis = jedisPool.getResource()) {
            value = jedis.get(key);
        }

        return value;
    }

    @Override
    public byte[] set(byte[] key, byte[] value) {

        try (Jedis jedis = jedisPool.getResource()) {
            jedis.set(key, value);
            if (this.expire != 0) {
                jedis.expire(key, this.expire);
            }
        }

        return value;
    }

    @Override
    public byte[] set(byte[] key, byte[] value, int expire) {

        try (Jedis jedis = jedisPool.getResource()) {
            jedis.set(key, value);
            if (expire != 0) {
                jedis.expire(key, expire);
            }
        }

        return value;
    }

    @Override
    public void del(byte[] key) {

        try (Jedis jedis = jedisPool.getResource()) {
            jedis.del(key);
        }

    }

    @Override
    public void flushDB() {

        try (Jedis jedis = jedisPool.getResource()) {
            jedis.flushDB();
        }

    }

    @Override
    public Long dbSize() {
        Long dbSize = 0L;

        try (Jedis jedis = jedisPool.getResource()) {
            dbSize = jedis.dbSize();
        }

        return dbSize;
    }

    @Override
    public Set<byte[]> keys(String pattern) {
        Set<byte[]> keys = null;

        try (Jedis jedis = jedisPool.getResource()) {
            keys = jedis.keys(pattern.getBytes());
        }

        return keys;
    }

    @Override
    public int getExpire() {
        return this.expire;
    }

    @Override
    public void setExpire(int expire) {
        this.expire = expire;
    }

    @Override
    public int getTimeout() {
        return this.timeout;
    }

    @Override
    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public void setPassword(String password) {
        this.password = password;
    }

    public int getDatabase() {
        return database;
    }

    public void setDatabase(Integer database) {
        if (null == database) {
            return;
        }
        this.database = database;
    }

    public String getMasterName() {
        return masterName;
    }

    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }

    public Set<String> getSentinels() {
        return sentinels;
    }

    public void setSentinels(Set<String> sentinels) {
        this.sentinels = sentinels;
    }
}
