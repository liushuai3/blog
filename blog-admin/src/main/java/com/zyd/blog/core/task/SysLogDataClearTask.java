package com.zyd.blog.core.task;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;

/**
 * Copyright: Copyright (c) 2019 -Linkage
 *
 * @ClassName: SysLogDataClearTask
 * @Description: sys_log 表日志记录定时清理类
 * @version: v1.0.0
 * @author: liushuai3
 * @date: 2019/9/21 17:43
 * *****
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/9/21     liushuai3           v1.0.0               修改原因
 */
@Slf4j
@Component
@Configuration      //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
public class SysLogDataClearTask {
    @Autowired
    DataSource dataSource;
    //3.添加定时任务
    //每月的7,14,21,28号凌晨2点20执行
    @Scheduled(cron = "0 20 2 7,14,21,28 * ?")
    //或直接指定时间间隔，例如：5秒
    //@Scheduled(fixedRate=5000)
    private void configureTasks() throws Exception{
        log.error("开始执行定时删除sys_log数据，执行时间:" + LocalDateTime.now());
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet =null;
        try{
            connection = dataSource.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT count(1) FROM sys_log");
            resultSet.next();
            long count = resultSet.getLong(1);
            long deleteCount = count -1000;
            if(deleteCount>0){
                statement.execute("DELETE FROM sys_log ORDER BY create_time LIMIT "+deleteCount);
                log.error("删除数据"+deleteCount+"条成功");
            }
        }catch (Exception e){
            log.error("定时删除数据异常:"+e.getMessage(), e);
        }finally {
            if(resultSet != null){
                resultSet.close();
            }
            if(statement != null){
                statement.close();
            }
            if(connection != null){
                connection.close();
            }
        }
    }

}
