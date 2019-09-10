/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50721
Source Host           : 118.24.120.220:3306
Source Database       : dblog

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-09-10 15:53:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `biz_article`
-- ----------------------------
DROP TABLE IF EXISTS `biz_article`;
CREATE TABLE `biz_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章标题',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章封面图片',
  `qrcode_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章专属二维码地址',
  `is_markdown` tinyint(1) unsigned DEFAULT '1',
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '文章内容',
  `content_md` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'markdown版的文章内容',
  `top` tinyint(1) DEFAULT '0' COMMENT '是否置顶',
  `type_id` bigint(20) unsigned NOT NULL COMMENT '类型',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `recommended` tinyint(1) unsigned DEFAULT '0' COMMENT '是否推荐',
  `original` tinyint(1) unsigned DEFAULT '1' COMMENT '是否原创',
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章简介，最多200字',
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章关键字，优化搜索',
  `comment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否开启评论',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_article
-- ----------------------------
INSERT INTO `biz_article` VALUES ('1', 'OneBlog简介', '1', 'zhyd/cover/20180613092017699.jpg', null, '1', '<h1 id=\"dblog-\">OneBlog简介</h1>\r\n<p>OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。</p>\r\n<p><strong>网站预览</strong>    </p>\r\n<p><a href=\"https://www.zhyd.me\">https://www.zhyd.me</a>  </p>\r\n<p><strong>开源地址</strong>   </p>\r\n<ol>\r\n<li><a href=\"https://gitee.com/yadong.zhang/DBlog\">Gitee</a>    </li>\r\n<li><a href=\"https://github.com/zhangyd-c/DBlog\">Github</a>    </li>\r\n</ol>\r\n<h2 id=\"-\">写在前面的话</h2>\r\n<p>ps: 虽然我知道，大部分人都是来了<strong>直接下载源代码</strong>后就潇洒的离开，并且只有等到下次<strong>突然想到</strong>“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：    </p>\r\n<p>发现更新代码了 --&gt; 下载源码后重复上面的步骤<br>发现没更新代码 --&gt; 直接关闭浏览器</p>\r\n<p>虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：</p>\r\n<p><strong>如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！</strong></p>\r\n<h3 id=\"-\">开发环境</h3>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>工具</th>\r\n<th>版本或描述</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>Windows 7</td>\r\n</tr>\r\n<tr>\r\n<td>JDK</td>\r\n<td>1.7+</td>\r\n</tr>\r\n<tr>\r\n<td>IDE</td>\r\n<td>IntelliJ IDEA 2017.3</td>\r\n</tr>\r\n<tr>\r\n<td>Maven</td>\r\n<td>3.3.1</td>\r\n</tr>\r\n<tr>\r\n<td>MySQL</td>\r\n<td>5.6.4</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3 id=\"-\">模块划分</h3>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>模块</th>\r\n<th>释义</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>blog-core</td>\r\n<td>核心业务类模块，提供基本的数据操作、工具处理等</td>\r\n</tr>\r\n<tr>\r\n<td>blog-admin</td>\r\n<td>后台管理模块</td>\r\n</tr>\r\n<tr>\r\n<td>blog-web</td>\r\n<td>前台模块</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3 id=\"-\">技术栈</h3>\r\n<ul>\r\n<li>Springboot 1.5.9</li>\r\n<li>Apache Shiro 1.2.2</li>\r\n<li>Logback</li>\r\n<li>Redis</li>\r\n<li>Lombok</li>\r\n<li>Websocket</li>\r\n<li>MySQL、Mybatis、Mapper、Pagehelper</li>\r\n<li>Freemarker</li>\r\n<li>Bootstrap 3.3.0</li>\r\n<li>wangEditor</li>\r\n<li>jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck</li>\r\n<li>阿里云OSS</li>\r\n<li>kaptcha</li>\r\n<li>Qiniu</li>\r\n<li>...</li>\r\n</ul>\r\n<h3 id=\"-\">使用方法</h3>\r\n<ol>\r\n<li>使用IDE导入本项目</li>\r\n<li>新建数据库<code>CREATE DATABASE dblog;</code></li>\r\n<li>导入数据库<code>docs/db/dblog.sql</code></li>\r\n<li>修改(<code>resources/application.yml</code>)配置文件<ol>\r\n<li>数据库链接属性(可搜索<code>datasource</code>或定位到L.19) </li>\r\n<li>redis配置(可搜索<code>redis</code>或定位到L.69)</li>\r\n<li>mail配置(可搜索<code>mail</code>或定位到L.89)</li>\r\n<li>【<a href=\"http://qiniu.com\">七牛云</a>】配置(见sys<em>config表中qiniu</em>*开头的字段)<br>注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的<code>系统配置</code>页面修改相关配置内容</li>\r\n</ol>\r\n</li>\r\n<li>运行项目(三种方式)<ol>\r\n<li>项目根目录下执行<code>mvn -X clean package -Dmaven.test.skip=true</code>编译打包，然后执行<code>java -jar target/blog-web.jar</code></li>\r\n<li>项目根目录下执行<code>mvn springboot:run</code></li>\r\n<li>直接运行<code>BlogWebApplication.java</code></li>\r\n</ol>\r\n</li>\r\n<li>浏览器访问<code>http://127.0.0.1:8443</code></li>\r\n</ol>\r\n<p><strong>后台用户</strong></p>\r\n<p><em>超级管理员</em>： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）</p>\r\n<p><em>普通管理员</em>： 账号：admin  密码：123456</p>\r\n<p><em>评论审核管理员</em>： 账号：comment-admin  密码：123456</p>\r\n<p>注：后台用户的创建，尽可能做到<strong>权限最小化</strong></p>\r\n<p>更多详情，请参考【<a href=\"https://gitee.com/yadong.zhang/DBlog/wikis\">Wiki</a>】</p>\r\n<h3 id=\"-\">更新日志</h3>\r\n<p>2018-06-10</p>\r\n<p><strong>修改功能：</strong></p>\r\n<p>新增：<br>    markdown版的编辑器、评论框<br>    控制文章的评论框是否显示<br>    修改密码功能<br>优化：相关页面进行优化    </p>\r\n<p>2018-06-05</p>\r\n<p><strong>修改功能：</strong></p>\r\n<p>修复： admin用户首页报错的问题    </p>\r\n<p>优化：</p>\r\n<ol>\r\n<li>ROOT用户默认拥有所有权限</li>\r\n<li>admin页面改为macro引用的方式</li>\r\n<li>登录界面</li>\r\n<li>日志记录</li>\r\n</ol>\r\n<p>2018-05-25</p>\r\n<p><strong>修改功能：</strong></p>\r\n<ol>\r\n<li>修复后台标签等分页失败的问题</li>\r\n<li>修复前台自动申请友链失败的问题</li>\r\n<li>其他一些问题</li>\r\n</ol>\r\n<p>2018-05-22</p>\r\n<p><strong>修改功能：</strong></p>\r\n<ol>\r\n<li>完善shiro权限（数据库、页面）。注：需要重新执行下<code>sys_resources</code>和<code>sys_role_resources</code>两张表的<code>insert</code>语句</li>\r\n<li>redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 <strong>强烈建议</strong>设置下密码）</li>\r\n</ol>\r\n<p>2018-05-18</p>\r\n<p><strong>修复bug：</strong></p>\r\n<ol>\r\n<li>web端自动申请友链后不显示的问题</li>\r\n<li>config表修改后不能实时刷新的问题</li>\r\n</ol>\r\n<p><strong>增加功能：</strong></p>\r\n<ol>\r\n<li>网站赞赏码</li>\r\n<li>百度推送功能(链接提交到百度站长平台)</li>\r\n</ol>\r\n<p><strong>修改功能：</strong></p>\r\n<ol>\r\n<li>百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理</li>\r\n<li>admin模块菜单通过标签实时获取</li>\r\n<li>弹窗工具类js结构调整</li>\r\n</ol>\r\n<p>你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群<a href=\"http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60\">190886500</a>，进群可以选择性的备注：<del>欧巴群主我爱你</del>(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：<code>我猜群主一定很帅</code></p>\r\n<h3 id=\"-\">图片预览</h3>\r\n<p><strong>前台页面</strong><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0\" alt=\"PC-首页\"><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0\" alt=\"PC-文章详情页\"><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0\" alt=\"手机\"><br><strong>后台页面</strong><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0\" alt=\"首页\"><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0\" alt=\"菜单\"><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0\" alt=\"文章列表\"><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0\" alt=\"发表文章\"><br><img src=\"https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0\" alt=\"markdown版的编辑器\" title=\"markdown版的编辑器\"><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role.png?v=1.0\" alt=\"角色列表\"><br><img src=\"https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role2.png?v=1.0\" alt=\"角色分配\"></p>\r\n<h3 id=\"-\">生命不息，折腾不止！ 更多信息，请关注：</h3>\r\n<ol>\r\n<li><a href=\"https://www.zhyd.me\">我的博客</a></li>\r\n<li><a href=\"http://weibo.com/211230415\">我的微博</a></li>\r\n<li><a href=\"http://www.toutiao.com/c/user/3286958681/\">我的头条号</a></li>\r\n<li><p><a href=\"http://www.imooc.com/u/1175248/articles\">我的mooc</a></p>\r\n<h3 id=\"-\">有任何问题可以</h3>\r\n<ul>\r\n<li><a href=\"https://www.zhyd.me/guestbook\">给我留言</a></li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<h3 id=\"-\">开源协议</h3>\r\n<p> <a href=\"https://gitee.com/yadong.zhang/DBlog/blob/master/LICENSE\">MIT</a></p>\r\n', '# OneBlog简介\r\nOneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\r\n  \r\n**网站预览**    \r\n \r\n[https://www.zhyd.me](https://www.zhyd.me)  \r\n\r\n**开源地址**   \r\n1. [Gitee](https://gitee.com/yadong.zhang/DBlog)    \r\n2. [Github](https://github.com/zhangyd-c/DBlog)    \r\n\r\n## 写在前面的话\r\nps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：    \r\n\r\n发现更新代码了 --> 下载源码后重复上面的步骤    \r\n发现没更新代码 --> 直接关闭浏览器\r\n\r\n虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\r\n\r\n**如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\r\n\r\n\r\n### 开发环境\r\n\r\n| 工具    | 版本或描述                |\r\n| ----- | -------------------- |\r\n| OS    | Windows 7            |\r\n| JDK   | 1.7+                 |\r\n| IDE   | IntelliJ IDEA 2017.3 |\r\n| Maven | 3.3.1                |\r\n| MySQL | 5.6.4                |\r\n\r\n### 模块划分\r\n\r\n| 模块         | 释义                      |\r\n| ---------- | ----------------------- |\r\n| blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\r\n| blog-admin | 后台管理模块                  |\r\n| blog-web   | 前台模块                    |\r\n\r\n\r\n### 技术栈\r\n\r\n- Springboot 1.5.9\r\n- Apache Shiro 1.2.2\r\n- Logback\r\n- Redis\r\n- Lombok\r\n- Websocket\r\n- MySQL、Mybatis、Mapper、Pagehelper\r\n- Freemarker\r\n- Bootstrap 3.3.0\r\n- wangEditor\r\n- jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\r\n- 阿里云OSS\r\n- kaptcha\r\n- Qiniu\r\n- ...\r\n\r\n\r\n### 使用方法\r\n\r\n1. 使用IDE导入本项目\r\n2. 新建数据库`CREATE DATABASE dblog;`\r\n3. 导入数据库`docs/db/dblog.sql`\r\n4. 修改(`resources/application.yml`)配置文件\r\n   1. 数据库链接属性(可搜索`datasource`或定位到L.19) \r\n   2. redis配置(可搜索`redis`或定位到L.69)\r\n   3. mail配置(可搜索`mail`或定位到L.89)\r\n   4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)    \r\n   注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\r\n5. 运行项目(三种方式)\r\n   1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\r\n   2. 项目根目录下执行`mvn springboot:run`\r\n   3. 直接运行`BlogWebApplication.java`\r\n6. 浏览器访问`http://127.0.0.1:8443`\r\n\r\n\r\n**后台用户**\r\n\r\n_超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\r\n\r\n_普通管理员_： 账号：admin  密码：123456\r\n\r\n_评论审核管理员_： 账号：comment-admin  密码：123456\r\n\r\n注：后台用户的创建，尽可能做到**权限最小化**\r\n\r\n更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】\r\n\r\n### 更新日志\r\n\r\n2018-06-10\r\n\r\n**修改功能：**\r\n\r\n新增：    \r\n	markdown版的编辑器、评论框    \r\n	控制文章的评论框是否显示    \r\n	修改密码功能    \r\n优化：相关页面进行优化    \r\n\r\n2018-06-05\r\n\r\n**修改功能：**\r\n\r\n修复： admin用户首页报错的问题    \r\n\r\n优化：\r\n1. ROOT用户默认拥有所有权限\r\n2. admin页面改为macro引用的方式\r\n3. 登录界面\r\n4. 日志记录\r\n\r\n2018-05-25\r\n\r\n**修改功能：**\r\n\r\n1. 修复后台标签等分页失败的问题\r\n2. 修复前台自动申请友链失败的问题\r\n3. 其他一些问题\r\n\r\n\r\n2018-05-22\r\n\r\n**修改功能：**\r\n\r\n1. 完善shiro权限（数据库、页面）。注：需要重新执行下`sys_resources`和`sys_role_resources`两张表的`insert`语句\r\n2. redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 **强烈建议**设置下密码）\r\n\r\n2018-05-18\r\n\r\n**修复bug：**\r\n\r\n1. web端自动申请友链后不显示的问题\r\n2. config表修改后不能实时刷新的问题\r\n	\r\n**增加功能：**\r\n1. 网站赞赏码\r\n2. 百度推送功能(链接提交到百度站长平台)\r\n	\r\n**修改功能：**\r\n1. 百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理\r\n3. admin模块菜单通过标签实时获取\r\n3. 弹窗工具类js结构调整\r\n\r\n你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群[190886500](http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60)，进群可以选择性的备注：~~欧巴群主我爱你~~(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：`我猜群主一定很帅`\r\n\r\n### 图片预览\r\n\r\n**前台页面**\r\n![PC-首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0)\r\n![PC-文章详情页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0)\r\n![手机](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0)\r\n**后台页面**\r\n![首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0)\r\n![菜单](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0)\r\n![文章列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0)\r\n![发表文章](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0)\r\n![markdown版的编辑器](https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0 \"markdown版的编辑器\")\r\n![角色列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role.png?v=1.0)\r\n![角色分配](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role2.png?v=1.0)\r\n\r\n\r\n ### 生命不息，折腾不止！ 更多信息，请关注：\r\n 1. [我的博客](https://www.zhyd.me)\r\n 2. [我的微博](http://weibo.com/211230415)\r\n 3. [我的头条号](http://www.toutiao.com/c/user/3286958681/)\r\n 4. [我的mooc](http://www.imooc.com/u/1175248/articles)\r\n\r\n ### 有任何问题可以\r\n- [给我留言](https://www.zhyd.me/guestbook)\r\n\r\n\r\n### 开源协议\r\n\r\n [MIT](https://gitee.com/yadong.zhang/OneBlog/blob/master/LICENSE)', '0', '3', '1', '0', '1', 'OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。', 'OneBlog,开源博客', '1', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_article` VALUES ('2', 'OneBlog简介（未开启评论）', '1', 'zhyd/cover/20180613092017699.jpg', null, '1', '<h1 id=\"dblog-\">OneBlog简介</h1>\n<p>OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。</p>\n<p><strong>网站预览</strong>    </p>\n<p><a href=\"https://www.zhyd.me\">https://www.zhyd.me</a>  </p>\n<p><strong>开源地址</strong>   </p>\n<ol>\n<li><a href=\"https://gitee.com/yadong.zhang/DBlog\">Gitee</a>    </li>\n<li><a href=\"https://github.com/zhangyd-c/DBlog\">Github</a>    </li>\n</ol>\n<h2 id=\"-\">写在前面的话</h2>\n<p>ps: 虽然我知道，大部分人都是来了<strong>直接下载源代码</strong>后就潇洒的离开，并且只有等到下次<strong>突然想到</strong>“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：    </p>\n<p>发现更新代码了 --&gt; 下载源码后重复上面的步骤<br>发现没更新代码 --&gt; 直接关闭浏览器</p>\n<p>虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：</p>\n<p><strong>如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！</strong></p>\n<h3 id=\"-\">开发环境</h3>\n<table>\n<thead>\n<tr>\n<th>工具</th>\n<th>版本或描述</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>OS</td>\n<td>Windows 7</td>\n</tr>\n<tr>\n<td>JDK</td>\n<td>1.7+</td>\n</tr>\n<tr>\n<td>IDE</td>\n<td>IntelliJ IDEA 2017.3</td>\n</tr>\n<tr>\n<td>Maven</td>\n<td>3.3.1</td>\n</tr>\n<tr>\n<td>MySQL</td>\n<td>5.6.4</td>\n</tr>\n</tbody>\n</table>\n<h3 id=\"-\">模块划分</h3>\n<table>\n<thead>\n<tr>\n<th>模块</th>\n<th>释义</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>blog-core</td>\n<td>核心业务类模块，提供基本的数据操作、工具处理等</td>\n</tr>\n<tr>\n<td>blog-admin</td>\n<td>后台管理模块</td>\n</tr>\n<tr>\n<td>blog-web</td>\n<td>前台模块</td>\n</tr>\n</tbody>\n</table>\n<h3 id=\"-\">技术栈</h3>\n<ul>\n<li>Springboot 1.5.9</li>\n<li>Apache Shiro 1.2.2</li>\n<li>Logback</li>\n<li>Redis</li>\n<li>Lombok</li>\n<li>Websocket</li>\n<li>MySQL、Mybatis、Mapper、Pagehelper</li>\n<li>Freemarker</li>\n<li>Bootstrap 3.3.0</li>\n<li>wangEditor</li>\n<li>jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck</li>\n<li>阿里云OSS</li>\n<li>kaptcha</li>\n<li>Qiniu</li>\n<li>...</li>\n</ul>\n<h3 id=\"-\">使用方法</h3>\n<ol>\n<li>使用IDE导入本项目</li>\n<li>新建数据库<code>CREATE DATABASE dblog;</code></li>\n<li>导入数据库<code>docs/db/dblog.sql</code></li>\n<li>修改(<code>resources/application.yml</code>)配置文件<ol>\n<li>数据库链接属性(可搜索<code>datasource</code>或定位到L.19) </li>\n<li>redis配置(可搜索<code>redis</code>或定位到L.69)</li>\n<li>mail配置(可搜索<code>mail</code>或定位到L.89)</li>\n<li>【<a href=\"http://qiniu.com\">七牛云</a>】配置(见sys<em>config表中qiniu</em>*开头的字段)<br>注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的<code>系统配置</code>页面修改相关配置内容</li>\n</ol>\n</li>\n<li>运行项目(三种方式)<ol>\n<li>项目根目录下执行<code>mvn -X clean package -Dmaven.test.skip=true</code>编译打包，然后执行<code>java -jar target/blog-web.jar</code></li>\n<li>项目根目录下执行<code>mvn springboot:run</code></li>\n<li>直接运行<code>BlogWebApplication.java</code></li>\n</ol>\n</li>\n<li>浏览器访问<code>http://127.0.0.1:8443</code></li>\n</ol>\n<p><strong>后台用户</strong></p>\n<p><em>超级管理员</em>： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）</p>\n<p><em>普通管理员</em>： 账号：admin  密码：123456</p>\n<p><em>评论审核管理员</em>： 账号：comment-admin  密码：123456</p>\n<p>注：后台用户的创建，尽可能做到<strong>权限最小化</strong></p>\n<p>更多详情，请参考【<a href=\"https://gitee.com/yadong.zhang/DBlog/wikis\">Wiki</a>】</p>\n', '# OneBlog简介\nDBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\n  \n**网站预览**    \n \n[https://www.zhyd.me](https://www.zhyd.me)  \n\n**开源地址**   \n1. [Gitee](https://gitee.com/yadong.zhang/DBlog)    \n2. [Github](https://github.com/zhangyd-c/DBlog)    \n\n## 写在前面的话\nps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：    \n\n发现更新代码了 --> 下载源码后重复上面的步骤    \n发现没更新代码 --> 直接关闭浏览器\n\n虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\n\n**如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\n\n\n### 开发环境\n\n| 工具    | 版本或描述                |\n| ----- | -------------------- |\n| OS    | Windows 7            |\n| JDK   | 1.7+                 |\n| IDE   | IntelliJ IDEA 2017.3 |\n| Maven | 3.3.1                |\n| MySQL | 5.6.4                |\n\n### 模块划分\n\n| 模块         | 释义                      |\n| ---------- | ----------------------- |\n| blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\n| blog-admin | 后台管理模块                  |\n| blog-web   | 前台模块                    |\n\n\n### 技术栈\n\n- Springboot 1.5.9\n- Apache Shiro 1.2.2\n- Logback\n- Redis\n- Lombok\n- Websocket\n- MySQL、Mybatis、Mapper、Pagehelper\n- Freemarker\n- Bootstrap 3.3.0\n- wangEditor\n- jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\n- 阿里云OSS\n- kaptcha\n- Qiniu\n- ...\n\n\n### 使用方法\n\n1. 使用IDE导入本项目\n2. 新建数据库`CREATE DATABASE dblog;`\n3. 导入数据库`docs/db/dblog.sql`\n4. 修改(`resources/application.yml`)配置文件\n   1. 数据库链接属性(可搜索`datasource`或定位到L.19) \n   2. redis配置(可搜索`redis`或定位到L.69)\n   3. mail配置(可搜索`mail`或定位到L.89)\n   4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)    \n   注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\n5. 运行项目(三种方式)\n   1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\n   2. 项目根目录下执行`mvn springboot:run`\n   3. 直接运行`BlogWebApplication.java`\n6. 浏览器访问`http://127.0.0.1:8443`\n\n\n**后台用户**\n\n_超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\n\n_普通管理员_： 账号：admin  密码：123456\n\n_评论审核管理员_： 账号：comment-admin  密码：123456\n\n注：后台用户的创建，尽可能做到**权限最小化**\n\n更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】', '0', '3', '1', '0', '1', 'OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。', 'OneBlog,开源博客', '0', '2019-09-06 01:21:57', '2019-09-07 17:40:49');
INSERT INTO `biz_article` VALUES ('9', 'test', '1', 'https://lcools-blog.oss-cn-chengdu.aliyuncs.com/oneblog/qrcode/20190910154718156.png', null, '0', '<p>test</p>', null, '0', '3', '1', '0', '1', 'test', 'test', '1', '2019-09-10 15:50:33', '2019-09-10 15:50:33');

-- ----------------------------
-- Table structure for `biz_article_look`
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_look`;
CREATE TABLE `biz_article_look` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) DEFAULT NULL COMMENT '用户IP',
  `look_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '浏览时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_article_look
-- ----------------------------
INSERT INTO `biz_article_look` VALUES ('2', '1', null, '117.157.99.114', '2019-09-09 09:16:42', '2019-09-09 09:16:42', '2019-09-09 09:16:42');
INSERT INTO `biz_article_look` VALUES ('8', '2', null, '117.157.99.114', '2019-09-10 15:00:28', '2019-09-10 15:00:28', '2019-09-10 15:00:28');
INSERT INTO `biz_article_look` VALUES ('9', '2', null, '117.157.99.114', '2019-09-10 15:01:03', '2019-09-10 15:01:03', '2019-09-10 15:01:03');
INSERT INTO `biz_article_look` VALUES ('10', '1', null, '117.157.99.114', '2019-09-10 15:01:09', '2019-09-10 15:01:09', '2019-09-10 15:01:09');

-- ----------------------------
-- Table structure for `biz_article_love`
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_love`;
CREATE TABLE `biz_article_love` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) DEFAULT NULL COMMENT '用户IP',
  `love_time` datetime DEFAULT NULL COMMENT '浏览时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_article_love
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_article_tags`
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_tags`;
CREATE TABLE `biz_article_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL COMMENT '标签表主键',
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_article_tags
-- ----------------------------
INSERT INTO `biz_article_tags` VALUES ('1', '5', '1', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_article_tags` VALUES ('2', '1', '2', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_article_tags` VALUES ('9', '5', '9', '2019-09-10 15:50:34', '2019-09-10 15:50:34');

-- ----------------------------
-- Table structure for `biz_comment`
-- ----------------------------
DROP TABLE IF EXISTS `biz_comment`;
CREATE TABLE `biz_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) DEFAULT NULL COMMENT '被评论的文章或者页面的ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '评论人的ID',
  `pid` bigint(20) unsigned DEFAULT NULL COMMENT '父级评论的id',
  `qq` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的QQ（未登录用户）',
  `nickname` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的昵称（未登录用户）',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的邮箱地址（未登录用户）',
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的网站地址（未登录用户）',
  `status` enum('VERIFYING','APPROVED','REJECT','DELETED') COLLATE utf8mb4_unicode_ci DEFAULT 'VERIFYING' COMMENT '评论的状态',
  `ip` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的ip',
  `lng` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的地址',
  `os` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的系统类型',
  `os_short_name` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的系统的简称',
  `browser` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的浏览器类型',
  `browser_short_name` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的浏览器的简称',
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论的内容',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注（审核不通过时添加）',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持（赞）',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对（踩）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_file`
-- ----------------------------
DROP TABLE IF EXISTS `biz_file`;
CREATE TABLE `biz_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `storage_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `suffix` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_start_time` datetime DEFAULT NULL,
  `upload_end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_file
-- ----------------------------
INSERT INTO `biz_file` VALUES ('1', '1', 'aliyun', '11.png', '737007', '.png', '935', '704', 'oneblog/qrcode/20190910154712176.png', 'https://lcools-blog.oss-cn-chengdu.aliyuncs.com/oneblog/qrcode/20190910154712176.png', 'd41d8cd98f00b204e9800998ecf8427e', 'oneblog/qrcode/', '2019-09-10 15:47:12', '2019-09-10 15:47:18', '2019-09-10 15:47:18', '2019-09-10 15:47:18');
INSERT INTO `biz_file` VALUES ('2', '1', 'aliyun', '11.png', '737007', '.png', '935', '704', 'oneblog/qrcode/20190910154718156.png', 'https://lcools-blog.oss-cn-chengdu.aliyuncs.com/oneblog/qrcode/20190910154718156.png', 'd41d8cd98f00b204e9800998ecf8427e', 'oneblog/qrcode/', '2019-09-10 15:47:18', '2019-09-10 15:47:24', '2019-09-10 15:47:24', '2019-09-10 15:47:24');

-- ----------------------------
-- Table structure for `biz_tags`
-- ----------------------------
DROP TABLE IF EXISTS `biz_tags`;
CREATE TABLE `biz_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '书签名',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_tags
-- ----------------------------
INSERT INTO `biz_tags` VALUES ('1', 'Linux', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_tags` VALUES ('2', 'Java', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_tags` VALUES ('3', 'Spring', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_tags` VALUES ('4', 'Spring Boot', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_tags` VALUES ('5', '其他', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');

-- ----------------------------
-- Table structure for `biz_type`
-- ----------------------------
DROP TABLE IF EXISTS `biz_type`;
CREATE TABLE `biz_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '文章类型名',
  `description` varchar(200) DEFAULT NULL COMMENT '类型介绍',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `available` tinyint(1) unsigned DEFAULT '1' COMMENT '是否可用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_type
-- ----------------------------
INSERT INTO `biz_type` VALUES ('1', null, '前端技术', '主要收集、整理的基础前端类文章，包括JS、jQuery和CSS等Web开发所需的基础的文章总结', '1', 'fa fa-css3', '1', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_type` VALUES ('2', null, '后端技术', '网站中记录的后端类文章，包括Java、SSM、MySQL和其他在日常工作学习中所用的后端技术', '2', 'fa fa-coffee', '1', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `biz_type` VALUES ('3', null, '其他文章', '记录网站建设以及日常工作、学习中的闲言碎语和个人笔记等文章', '3', 'fa fa-folder-open-o', '1', '2019-09-06 01:21:57', '2019-09-06 01:21:57');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) DEFAULT NULL COMMENT '配置关键字',
  `config_value` text COMMENT '配置项内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'homeDesc', 'OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('2', 'homeKeywords', 'OneBlog,开源博客', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('3', 'domain', 'lcools.cn', '2019-09-06 01:21:57', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('4', 'cmsUrl', 'http://www.lcools.cn:8085', '2019-09-06 01:21:57', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('5', 'siteUrl', 'http://www.lcools.cn:8443', '2019-09-06 01:21:57', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('6', 'siteName', 'OneBlog开源博客', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('7', 'siteDesc', 'OneBlog是一款简洁美观、自适应的Java博客系统', '2019-09-06 01:21:57', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('8', 'siteFavicon', 'http://www.lcools.cn:8443/img/favicon.ico', '2019-09-06 01:21:57', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('9', 'staticWebSite', 'http://www.lcools.cn:8443', '2019-09-06 01:21:57', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('10', 'authorName', '刘帅', '2019-09-06 01:21:57', '2019-09-10 10:35:09');
INSERT INTO `sys_config` VALUES ('11', 'authorEmail', 'liushuailscool@126.com', '2019-09-06 01:21:57', '2019-09-10 10:35:09');
INSERT INTO `sys_config` VALUES ('12', 'wxCode', 'http://www.lcools.cn/static/imgs/wechat_account.png', '2019-09-06 01:21:57', '2019-09-10 10:35:10');
INSERT INTO `sys_config` VALUES ('13', 'qq', '1432678620', '2019-09-06 01:21:57', '2019-09-10 10:35:10');
INSERT INTO `sys_config` VALUES ('14', 'weibo', 'https://weibo.com/u/5546741029', '2019-09-06 01:21:57', '2019-09-10 10:35:10');
INSERT INTO `sys_config` VALUES ('15', 'github', 'https://github.com/liushuai3', '2019-09-06 01:21:57', '2019-09-10 10:35:10');
INSERT INTO `sys_config` VALUES ('16', 'maintenance', '0', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('17', 'maintenanceDate', '2019-09-06 01:21:57', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('18', 'comment', '1', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('19', 'qiniuBasePath', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('20', 'qiniuAccessKey', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('21', 'qiniuSecretKey', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('22', 'qiniuBucketName', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('23', 'baiduPushToken', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('24', 'wxPraiseCode', 'https://lcools-blog.oss-cn-chengdu.aliyuncs.com/oneblog/qrcode/20190910154712176.png', '2019-09-06 01:21:57', '2019-09-10 15:47:18');
INSERT INTO `sys_config` VALUES ('25', 'zfbPraiseCode', 'https://lcools-blog.oss-cn-chengdu.aliyuncs.com/oneblog/qrcode/20190910154718156.png', '2019-09-06 01:21:57', '2019-09-10 15:47:24');
INSERT INTO `sys_config` VALUES ('26', 'baiduApiAk', 'NwHaYlGalDEpgxm46xBaC3T9', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('27', 'spiderConfig', '{\r\n            imooc: {\r\n                domain: \"www.imooc.com\",\r\n                titleRegex: \"//span[@class=js-title]/html()\",\r\n                authorRegex: \"//div[@class=name_con]/p[@class=name]/a[@class=nick]/html()\",\r\n                releaseDateRegex: \"//div[@class=\'dc-profile\']/div[@class=\'l\']/span[@class=\'spacer\']/text()\",\r\n                contentRegex: \"//div[@class=detail-content]/html()\",\r\n                targetLinksRegex: \"/article/[0-9]{1,10}\",\r\n                tagRegex: \"//div[@class=cat-box]/div[@class=cat-wrap]/a[@class=cat]/html()\",\r\n                header: [\r\n                    \"Host=www.imooc.com\",\r\n                    \"Referer=https://www.imooc.com\"\r\n                ],\r\n                entryUrls: \'https://www.imooc.com/u/{uid}/articles?page={curPage}\'\r\n            },\r\n            csdn: {\r\n                domain: \"blog.csdn.net\",\r\n                titleRegex: \"//h1[@class=title-article]/html()\",\r\n                authorRegex: \"//a[@class=follow-nickName]/html()\",\r\n                releaseDateRegex: \"//div[@class=\'article-bar-top\']/span[@class=\'time\']/text()\",\r\n                contentRegex: \"//div[@class=article_content]/html()\",\r\n                targetLinksRegex: \".*blog\\\\.csdn\\\\.net/{uid}/article/details/[0-9a-zA-Z]{1,15}\",\r\n                tagRegex: \"//span[@class=artic-tag-box]/a[@class=tag-link]/html()\",\r\n                header: [\r\n                    \"Host=blog.csdn.net\",\r\n                    \"Referer=https://blog.csdn.net/{uid}/article/list/1\"\r\n                ],\r\n                entryUrls: \'https://blog.csdn.net/{uid}/article/list/{curPage}\'\r\n            },\r\n            iteye: {\r\n                domain: \"{uid}.iteye.com\",\r\n                titleRegex: \"//div[@class=blog_title]/h3/a/html()\",\r\n                authorRegex: \"//div[@id=blog_owner_name]/html()\",\r\n                releaseDateRegex: \"//div[@class=blog_bottom]/ul/li/html()\",\r\n                contentRegex: \"//div[@class=blog_content]/html()\",\r\n                targetLinksRegex: \".*{uid}\\\\.iteye\\\\.com/blog/[0-9]+\",\r\n                tagRegex: \"//div[@class=news_tag]/a/html()\",\r\n                header: [\r\n                    \"Host={uid}.iteye.com\",\r\n                    \"Referer=http://{uid}.iteye.com/\"\r\n                ],\r\n                entryUrls: \'http://{uid}.iteye.com/?page={curPage}\'\r\n            },\r\n            csblogs: {\r\n                domain: \"www.cnblogs.com\",\r\n                titleRegex: \"//a[@id=cb_post_title_url]/html()\",\r\n                authorRegex: \"//div[@class=postDesc]/a[1]/html()\",\r\n                releaseDateRegex: \"//span[@id=post-date]/html()\",\r\n                contentRegex: \"//div[@id=cnblogs_post_body]/html()\",\r\n                targetLinksRegex: \".*www\\\\.cnblogs\\\\.com/{uid}/p/[\\\\w\\\\d]+\\\\.html\",\r\n                tagRegex: \"//div[@id=EntryTag]/a/html()\",\r\n                header: [\r\n                    \"Host=www.cnblogs.com\",\r\n                    \"Referer=https://www.cnblogs.com/\"\r\n                ],\r\n                entryUrls: \'https://www.cnblogs.com/{uid}/default.html?page={curPage}\'\r\n            }\r\n        }', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('28', 'anonymous', '1', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('29', 'editorPlaceholder', '说点什么吧', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('30', 'editorAlert', '讲文明、要和谐', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('31', 'defaultUserAvatar', '[\r\n	\"http://localhost:8443/img/random/user/1.jpg\",\r\n	\"http://localhost:8443/img/random/user/2.jpg\",\r\n	\"http://localhost:8443/img/random/user/3.jpg\",\r\n	\"http://localhost:8443/img/random/user/4.jpg\",\r\n	\"http://localhost:8443/img/random/user/5.jpg\",\r\n	\"http://localhost:8443/img/random/user/6.jpg\",\r\n	\"http://localhost:8443/img/random/user/7.jpg\",\r\n	\"http://localhost:8443/img/random/user/8.jpg\",\r\n	\"http://localhost:8443/img/random/user/9.jpg\",\r\n	\"http://localhost:8443/img/random/user/10.jpg\",\r\n	\"http://localhost:8443/img/random/user/11.jpg\",\r\n	\"http://localhost:8443/img/random/user/12.jpg\",\r\n	\"http://localhost:8443/img/random/user/13.jpg\",\r\n	\"http://localhost:8443/img/random/user/14.jpg\",\r\n	\"http://localhost:8443/img/random/user/15.jpg\",\r\n	\"http://localhost:8443/img/random/user/16.jpg\",\r\n	\"http://localhost:8443/img/random/user/17.jpg\",\r\n	\"http://localhost:8443/img/random/user/18.jpg\",\r\n	\"http://localhost:8443/img/random/user/19.jpg\",\r\n	\"http://localhost:8443/img/random/user/20.jpg\"\r\n]', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('32', 'sessionTimeOut', '5', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('33', 'sessionTimeOutUnit', 'MINUTES', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('34', 'loginRetryNum', '5', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('35', 'installdate', '2019-09-19 01:21:57', '2019-09-06 01:21:57', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('36', 'copyright', 'Copyright lcools.cn', '2019-09-06 01:21:57', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('37', 'dynamicTitle', '您有一条新消息', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_config` VALUES ('38', 'recordNumber', '', '2019-09-08 10:55:37', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('39', 'lazyloadPath', '', '2019-09-08 10:55:37', '2019-09-10 14:37:37');
INSERT INTO `sys_config` VALUES ('40', 'storageType', 'aliyun', '2019-09-10 15:46:54', '2019-09-10 15:46:54');
INSERT INTO `sys_config` VALUES ('41', 'aliyunBucketName', 'lcools-blog', '2019-09-10 15:46:55', '2019-09-10 15:46:55');
INSERT INTO `sys_config` VALUES ('42', 'aliyunEndpoint', 'oss-cn-chengdu.aliyuncs.com', '2019-09-10 15:46:55', '2019-09-10 15:46:55');
INSERT INTO `sys_config` VALUES ('43', 'aliyunFileUrl', 'https://lcools-blog.oss-cn-chengdu.aliyuncs.com/', '2019-09-10 15:46:55', '2019-09-10 15:46:55');
INSERT INTO `sys_config` VALUES ('44', 'aliyunAccessKey', 'i3qbwoJswJeyijge', '2019-09-10 15:46:55', '2019-09-10 15:46:55');
INSERT INTO `sys_config` VALUES ('45', 'aliyunAccessKeySecret', 'FFrg1WevavTyMwv9Nm6flsAQC9wdGP', '2019-09-10 15:46:55', '2019-09-10 15:46:55');

-- ----------------------------
-- Table structure for `sys_link`
-- ----------------------------
DROP TABLE IF EXISTS `sys_link`;
CREATE TABLE `sys_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL COMMENT '链接地址',
  `name` varchar(50) DEFAULT NULL COMMENT '链接名',
  `description` varchar(300) DEFAULT NULL COMMENT '链接介绍',
  `email` varchar(100) DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(13) DEFAULT NULL COMMENT '友链站长QQ',
  `favicon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态',
  `home_page_display` tinyint(1) unsigned DEFAULT '1' COMMENT '是否首页显示',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `source` enum('ADMIN','AUTOMATIC') DEFAULT 'ADMIN' COMMENT '来源：管理员添加、自动申请',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_link
-- ----------------------------
INSERT INTO `sys_link` VALUES ('1', 'http://www.lcools.cn:8443', '刘帅的博客', '一个程序员的个人博客', 'liushuailscool@126.com', '1432678620', 'https://www.lcools.cn/static/imgs/favicon.ico', '1', '1', null, 'ADMIN', '2019-09-06 01:21:57', '2019-09-06 01:21:57');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `type` enum('SYSTEM','VISIT','ERROR') NOT NULL DEFAULT 'SYSTEM' COMMENT '日志类型（系统操作日志，用户访问日志，异常记录日志）',
  `log_level` enum('ERROR','WARN','INFO') NOT NULL DEFAULT 'INFO' COMMENT '日志级别',
  `content` varchar(2000) DEFAULT NULL COMMENT '日志内容（业务操作）',
  `params` varchar(2000) DEFAULT NULL COMMENT '请求参数（业务操作）',
  `spider_type` varchar(20) DEFAULT NULL COMMENT '爬虫类型（当访问者被鉴定为爬虫时该字段表示爬虫的类型）',
  `ip` varchar(64) DEFAULT NULL COMMENT '操作用户的ip',
  `ua` varchar(500) DEFAULT NULL COMMENT '操作用户的user_agent',
  `os` varchar(64) DEFAULT NULL COMMENT '评论时的系统类型',
  `browser` varchar(64) DEFAULT NULL COMMENT '评论时的浏览器类型',
  `request_url` varchar(3000) DEFAULT NULL COMMENT '请求的路径',
  `referer` varchar(3000) DEFAULT NULL COMMENT '请求来源地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', null, 'VISIT', 'INFO', '访客: [117.157.99.114] | 操作: 进入首页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8443/', null, '2019-09-10 15:00:23', '2019-09-10 15:00:23');
INSERT INTO `sys_log` VALUES ('2', null, 'VISIT', 'INFO', '访客: [117.157.99.114] | 操作: 进入文章[2]详情页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8443/article/2', 'http://www.lcools.cn:8443/', '2019-09-10 15:00:28', '2019-09-10 15:00:28');
INSERT INTO `sys_log` VALUES ('3', null, 'VISIT', 'INFO', '访客: [117.157.99.114] | 操作: 进入文章[2]详情页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8443/article/2', 'http://www.lcools.cn:8443/article/2', '2019-09-10 15:01:03', '2019-09-10 15:01:03');
INSERT INTO `sys_log` VALUES ('4', null, 'VISIT', 'INFO', '访客: [117.157.99.114] | 操作: 进入文章分类[3]列表页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8443/type/3', 'http://www.lcools.cn:8443/article/2', '2019-09-10 15:01:06', '2019-09-10 15:01:06');
INSERT INTO `sys_log` VALUES ('5', null, 'VISIT', 'INFO', '访客: [117.157.99.114] | 操作: 进入文章[1]详情页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8443/article/1', 'http://www.lcools.cn:8443/type/3', '2019-09-10 15:01:09', '2019-09-10 15:01:09');
INSERT INTO `sys_log` VALUES ('6', null, 'VISIT', 'INFO', '访客: [117.157.99.114] | 操作: 进入首页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8443/', 'http://localhost:8085/notice', '2019-09-10 15:25:47', '2019-09-10 15:25:47');
INSERT INTO `sys_log` VALUES ('7', null, 'SYSTEM', 'INFO', '访客: [117.157.99.114] | 操作: 进入登录页面', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/passport/login/;JSESSIONID=fbd580a1-40d2-403c-a03c-e4c2bc3333f9', null, '2019-09-10 15:38:24', '2019-09-10 15:38:24');
INSERT INTO `sys_log` VALUES ('8', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: [\"root\"]登录系统', '{\"username\":[\"root\"],\"password\":[\"ls@123456\"]}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/passport/signin', 'http://www.lcools.cn:8085/passport/login/;JSESSIONID=fbd580a1-40d2-403c-a03c-e4c2bc3333f9', '2019-09-10 15:38:50', '2019-09-10 15:38:50');
INSERT INTO `sys_log` VALUES ('9', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入首页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/', 'http://www.lcools.cn:8085/passport/login/;JSESSIONID=fbd580a1-40d2-403c-a03c-e4c2bc3333f9', '2019-09-10 15:38:51', '2019-09-10 15:38:51');
INSERT INTO `sys_log` VALUES ('10', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入系统配置页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/config', 'http://www.lcools.cn:8085/', '2019-09-10 15:43:33', '2019-09-10 15:43:33');
INSERT INTO `sys_log` VALUES ('11', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 修改系统配置', '{\"storageType\":[\"aliyun\"],\"aliyunBucketName\":[\"lcools-blog\"],\"aliyunEndpoint\":[\"oss-cn-chengdu.aliyuncs.com\"],\"aliyunFileUrl\":[\"https://lcools-blog.oss-cn-chengdu.aliyuncs.com/\"],\"aliyunAccessKey\":[\"i3qbwoJswJeyijge\"],\"aliyunAccessKeySecret\":[\"FFrg1WevavTyMwv9Nm6flsAQC9wdGP\"]}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/config/save', 'http://www.lcools.cn:8085/config', '2019-09-10 15:46:55', '2019-09-10 15:46:55');
INSERT INTO `sys_log` VALUES ('12', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 修改系统配置', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/config/save', 'http://www.lcools.cn:8085/config', '2019-09-10 15:47:24', '2019-09-10 15:47:24');
INSERT INTO `sys_log` VALUES ('13', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入系统配置页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/config', 'http://www.lcools.cn:8085/', '2019-09-10 15:47:34', '2019-09-10 15:47:34');
INSERT INTO `sys_log` VALUES ('14', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入资源列表页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/resources', 'http://www.lcools.cn:8085/config', '2019-09-10 15:49:00', '2019-09-10 15:49:00');
INSERT INTO `sys_log` VALUES ('15', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入用户列表页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/users', 'http://www.lcools.cn:8085/resources', '2019-09-10 15:49:16', '2019-09-10 15:49:16');
INSERT INTO `sys_log` VALUES ('16', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 获取用户详情', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/user/get/1', 'http://www.lcools.cn:8085/users', '2019-09-10 15:49:22', '2019-09-10 15:49:22');
INSERT INTO `sys_log` VALUES ('17', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/articles', 'http://www.lcools.cn:8085/users', '2019-09-10 15:49:31', '2019-09-10 15:49:31');
INSERT INTO `sys_log` VALUES ('18', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入发表文章页[html]', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/article/publish', 'http://www.lcools.cn:8085/articles', '2019-09-10 15:49:36', '2019-09-10 15:49:36');
INSERT INTO `sys_log` VALUES ('19', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 发布文章', '{\"isMarkdown\":[\"0\"],\"id\":[\"\"],\"title\":[\"test\"],\"original\":[\"on\"],\"content\":[\"<p>test</p>\"],\"file\":[\"\"],\"coverImage\":[\"https://lcools-blog.oss-cn-chengdu.aliyuncs.com/oneblog/qrcode/20190910154718156.png\"],\"typeId\":[\"3\"],\"tags\":[\"5\"],\"status\":[\"1\"],\"comment\":[\"on\"],\"description\":[\"test\"],\"keywords\":[\"test\"]}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/article/save', 'http://www.lcools.cn:8085/article/publish', '2019-09-10 15:50:34', '2019-09-10 15:50:34');
INSERT INTO `sys_log` VALUES ('20', '1', 'SYSTEM', 'INFO', '用户: [root] | 操作: 进入文章列表页', '{}', null, '117.157.99.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', 'Chrome', 'http://www.lcools.cn:8085/articles', 'http://www.lcools.cn:8085/article/publish', '2019-09-10 15:50:35', '2019-09-10 15:50:35');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '被通知的用户ID',
  `status` enum('RELEASE','NOT_RELEASE') DEFAULT 'NOT_RELEASE' COMMENT '通知状态',
  `title` varchar(200) DEFAULT NULL COMMENT '通知的标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '通知的内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '1', 'RELEASE', 'OneBlog开源博客', 'OneBlog开源博客，一款超好用的Java版开源博客', '2019-09-06 01:21:57', '2019-09-06 01:21:57');

-- ----------------------------
-- Table structure for `sys_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT '0',
  `sort` int(10) unsigned DEFAULT NULL,
  `external` tinyint(1) unsigned DEFAULT NULL COMMENT '是否外部链接',
  `available` tinyint(1) unsigned DEFAULT '0',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_resource_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', '用户管理', 'menu', '', '', '0', '4', '0', '1', 'fa fa-users', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('2', '用户列表', 'menu', '/users', 'users', '1', '1', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('3', '新增用户', 'button', null, 'user:add', '2', '2', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('4', '批量删除用户', 'button', null, 'user:batchDelete', '2', '3', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('5', '编辑用户', 'button', null, 'user:edit,user:get', '2', '4', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('6', '删除用户', 'button', null, 'user:delete', '2', '5', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('7', '分配用户角色', 'button', null, 'user:allotRole', '2', '6', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('8', '权限管理', 'menu', '', '', '0', '3', '0', '1', 'fa fa-cogs', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('9', '资源管理', 'menu', '/resources', 'resources', '8', '1', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('10', '新增资源', 'button', null, 'resource:add', '9', '2', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('11', '批量删除资源', 'button', null, 'resource:batchDelete', '9', '3', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('12', '编辑资源', 'button', null, 'resource:edit,resource:get', '9', '4', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('13', '删除资源', 'button', null, 'resource:delete', '9', '5', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('14', '角色管理', 'menu', '/roles', 'roles', '8', '2', '0', '1', '', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('15', '新增角色', 'button', null, 'role:add', '14', '2', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('16', '批量删除角色', 'button', null, 'role:batchDelete', '14', '3', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('17', '编辑角色', 'button', null, 'role:edit,role:get', '14', '4', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('18', '删除角色', 'button', null, 'role:delete', '14', '5', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('19', '分配角色资源', 'button', null, 'role:allotResource', '14', '6', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('20', '文章管理', 'menu', '', '', '0', '1', '0', '1', 'fa fa-list', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('21', '文章列表', 'menu', '/articles', 'articles', '20', '1', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('22', '发表文章', 'button', null, 'article:publish', '21', '2', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('23', '批量删除文章', 'button', null, 'article:batchDelete', '21', '3', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('24', '批量推送文章', 'button', null, 'article:batchPush', '21', '4', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('25', '推送文章', 'button', null, 'article:push', '21', '5', '0', '1', null, '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_resources` VALUES ('26', '置顶文章', 'button', null, 'article:top', '21', '6', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('27', '推荐文章', 'button', null, 'article:recommend', '21', '7', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('28', '编辑文章', 'button', null, 'article:edit,article:get', '21', '8', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('29', '删除文章', 'button', null, 'article:delete', '21', '9', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('30', '分类列表', 'menu', '/article/types', 'types', '20', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('31', '添加分类', 'button', null, 'type:add', '30', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('32', '批量删除分类', 'button', null, 'type:batchDelete', '30', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('33', '编辑分类', 'button', null, 'type:edit,type:get', '30', '4', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('34', '删除分类', 'button', null, 'type:delete', '30', '5', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('35', '标签列表', 'menu', '/article/tags', 'tags', '20', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('36', '添加标签', 'button', null, 'tag:add', '35', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('37', '批量删除标签', 'button', null, 'tag:batchDelete', '35', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('38', '编辑标签', 'button', null, 'tag:edit,tag:get', '35', '4', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('39', '删除标签', 'button', null, 'tag:delete', '35', '5', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('40', '网站管理', 'menu', '', '', '0', '2', '0', '1', 'fa fa-globe', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('41', '友情链接', 'menu', '/links', 'links', '40', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('42', '添加友情链接', 'button', null, 'link:add', '41', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('43', '批量删除友情链接', 'button', null, 'link:batchDelete', '41', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('44', '编辑友情链接', 'button', null, 'link:edit,link:get', '41', '4', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('45', '删除友情链接', 'button', null, 'link:delete', '41', '5', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('46', '评论管理', 'menu', '/comments', 'comments', '40', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('47', '批量删除评论', 'button', null, 'comment:batchDelete', '46', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('48', '回复评论', 'button', null, 'comment:reply', '46', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('49', '审核评论', 'button', null, 'comment:audit', '46', '4', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('50', '删除评论', 'button', null, 'comment:delete', '46', '5', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('51', '模板管理', 'menu', '/templates', 'templates', '40', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('52', '添加模板', 'button', null, 'template:add', '51', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('53', '批量删除模板', 'button', null, 'template:batchDelete', '51', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('54', '编辑模板', 'button', null, 'template:edit,template:get', '51', '4', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('55', '删除模板', 'button', null, 'template:delete', '51', '5', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('56', '更新日志', 'menu', '/updates', 'updateLogs', '40', '4', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('57', '添加更新日志', 'button', null, 'updateLog:add', '51', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('58', '批量删除更新日志', 'button', null, 'updateLog:batchDelete', '51', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('59', '编辑更新日志', 'button', null, 'updateLog:edit,updateLog:get', '51', '4', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('60', '删除更新日志', 'button', null, 'updateLog:delete', '51', '5', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('61', '公告管理', 'menu', '/notices', 'notices', '40', '5', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('62', '添加公告', 'button', null, 'notice:add', '61', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('63', '批量删除公告', 'button', null, 'notice:batchDelete', '61', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('64', '编辑公告', 'button', null, 'notice:edit,notice:get', '61', '4', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('65', '删除公告', 'button', null, 'notice:delete', '61', '5', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('66', '发布公告', 'button', null, 'notice:release', '61', '6', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('67', '撤回公告', 'button', null, 'notice:withdraw', '61', '7', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('68', '测试页面', 'menu', '', '', '0', '6', '0', '1', 'fa fa-desktop', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('69', 'icons图标', 'menu', '/icons', 'icons', '68', '2', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('70', 'shiro测试', 'menu', '/shiro', 'shiro', '68', '3', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('71', '推送消息', 'menu', '/notice', 'notice', '72', null, '0', '1', '', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('72', '实验室', 'menu', '', '', '0', '5', '0', '1', 'fa fa-flask', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('73', '文章搬运工', 'menu', '/remover', 'remover', '72', null, '0', '1', '', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('74', '编辑器', 'menu', '/editor', 'editor', '68', null, '0', '1', '', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_resources` VALUES ('75', '文件管理', 'menu', '/files', 'files', '40', '6', '0', '1', null, '2019-09-06 01:21:58', '2019-09-06 01:21:58');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'role:root', '超级管理员', '1', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role` VALUES ('2', 'role:admin', '管理员', '1', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role` VALUES ('3', 'role:comment', '评论审核管理员', '1', '2019-09-06 01:21:58', '2019-09-06 01:21:58');

-- ----------------------------
-- Table structure for `sys_role_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `resources_id` bigint(20) unsigned NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES ('1', '1', '1', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('2', '1', '2', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('3', '1', '3', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('4', '1', '4', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('5', '1', '5', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('6', '1', '6', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('7', '1', '7', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('8', '1', '8', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('9', '1', '9', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('10', '1', '10', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('11', '1', '11', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('12', '1', '12', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('13', '1', '13', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('14', '1', '14', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('15', '1', '15', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('16', '1', '16', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('17', '1', '17', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('18', '1', '18', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('19', '1', '19', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('20', '1', '20', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('21', '1', '21', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('22', '1', '22', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('23', '1', '23', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('24', '1', '24', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('25', '1', '25', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('26', '1', '26', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('27', '1', '27', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('28', '1', '28', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('29', '1', '29', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('30', '1', '30', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('31', '1', '31', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('32', '1', '32', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('33', '1', '33', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('34', '1', '34', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('35', '1', '35', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('36', '1', '36', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('37', '1', '37', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('38', '1', '38', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('39', '1', '39', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('40', '1', '40', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('41', '1', '41', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('42', '1', '42', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('43', '1', '43', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('44', '1', '44', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('45', '1', '45', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('46', '1', '46', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('47', '1', '47', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('48', '1', '48', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('49', '1', '49', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('50', '1', '50', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('51', '1', '51', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('52', '1', '52', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('53', '1', '57', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('54', '1', '53', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('55', '1', '58', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('56', '1', '54', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('57', '1', '59', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('58', '1', '55', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('59', '1', '60', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('60', '1', '56', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('61', '1', '61', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('62', '1', '62', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('63', '1', '63', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('64', '1', '64', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('65', '1', '65', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('66', '1', '66', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('67', '1', '67', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('68', '1', '68', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('84', '2', '20', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('85', '2', '21', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('86', '2', '24', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('87', '2', '25', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('88', '2', '26', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('89', '2', '27', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('93', '3', '40', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('94', '3', '46', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('95', '3', '48', '2019-09-06 01:21:58', '2019-09-06 01:21:58');
INSERT INTO `sys_role_resources` VALUES ('96', '3', '49', '2019-09-06 01:21:58', '2019-09-06 01:21:58');

-- ----------------------------
-- Table structure for `sys_template`
-- ----------------------------
DROP TABLE IF EXISTS `sys_template`;
CREATE TABLE `sys_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ref_key` varchar(100) DEFAULT NULL COMMENT '键',
  `ref_value` text COMMENT '模板内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_template
-- ----------------------------
INSERT INTO `sys_template` VALUES ('1', 'TM_SITEMAP_XML', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\r\n	<url>\r\n		<loc>${config.siteUrl}</loc>\r\n		<priority>1.0</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/about</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/links</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/guestbook</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/updateLog</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/recommended</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<#list articleList as item>\r\n		<url>\r\n			<loc>${config.siteUrl}/article/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	<#list articleTypeList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/type/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	\r\n	<#list articleTagsList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/tag/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n</urlset>', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('2', 'TM_SITEMAP_TXT', '${config.siteUrl}\r\n${config.siteUrl}/about\r\n${config.siteUrl}/links\r\n${config.siteUrl}/guestbook\r\n${config.siteUrl}/updateLog\r\n${config.siteUrl}/recommended\r\n<#list articleList as item>\r\n${config.siteUrl}/article/${item.id}\r\n</#list>\r\n<#list articleTypeList as item>\r\n${config.siteUrl}/type/${item.id}\r\n</#list>\r\n<#list articleTagsList as item>\r\n${config.siteUrl}/tag/${item.id}\r\n</#list>', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('3', 'TM_SITEMAP_HTML', '<!DOCTYPE html>\r\n<html lang=\"zh-CN\">\r\n<head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n    <title>${config.siteName} 网站地图</title>\r\n    <meta name=\"author\" content=\"SiteMapX.com\"/>\r\n    <meta name=\"robots\" content=\"index,follow\"/>\r\n    <style type=\"text/css\">\r\n        body {\r\n            color: #000000;\r\n            background: #ffffff;\r\n            margin: 20px;\r\n            font-family: Verdana, Arial, Helvetica, sans-serif;\r\n            font-size: 12px;\r\n        }\r\n\r\n        #myTable {\r\n            list-style: none;\r\n            margin: 10px 0px 10px 0px;\r\n            padding: 0px;\r\n            width: 100%;\r\n            min-width: 804px;\r\n        }\r\n\r\n        #myTable li {\r\n            list-style-type: none;\r\n            width: 100%;\r\n            min-width: 404px;\r\n            height: 20px;\r\n            line-height: 20px;\r\n        }\r\n\r\n        .pull-left{\r\n            float: left!important;\r\n        }\r\n        .pull-right{\r\n            float: right!important;\r\n        }\r\n\r\n        #myTable li .T1-h {\r\n            font-weight: bold;\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T3-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T4-h {\r\n            width: 100px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T1 {\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T3 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T4 {\r\n            width: 100px;\r\n        }\r\n\r\n        #footer {\r\n            padding: 2px;\r\n            margin: 0px;\r\n            font-size: 8pt;\r\n            color: gray;\r\n            min-width: 900px;\r\n        }\r\n\r\n        #footer a {\r\n            color: gray;\r\n        }\r\n\r\n        .myClear {\r\n            clear: both;\r\n        }\r\n\r\n        #nav, #content, #footer {padding: 8px; border: 1px solid #EEEEEE; clear: both; width: 95%; margin: auto; margin-top: 10px;}\r\n\r\n    </style>\r\n</head>\r\n<body>\r\n<h2 style=\"text-align: center; margin-top: 20px\">${config.siteName?if_exists} 网站地图 </h2>\r\n<div id=\"nav\"><a href=\"${config.siteUrl?if_exists}\"><strong>${config.siteName?if_exists}</strong></a> &raquo; <a href=\"${config.siteUrl?if_exists}/sitemap.html\">站点地图</a></div>\r\n<div id=\"content\">\r\n    <h3>最新文章</h3>\r\n    <ul id=\"myTable\">\r\n        <li>\r\n            <div class=\"T1-h pull-left\">URL</div>\r\n            <div class=\"T2-h pull-right\">Last Change</div>\r\n            <div class=\"T3-h pull-right\">Change Frequency</div>\r\n            <div class=\"T4-h pull-right\">Priority</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName} | 一个程序员的个人博客</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">1</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/about\" title=\"${config.siteName}\">关于 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/links\" title=\"${config.siteName}\">友情链接 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/guestbook\" title=\"${config.siteName}\">留言板 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/updateLog\" title=\"${config.siteName}\">网站更新记录 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n		<div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/recommended\" title=\"${config.siteName}\">站长推荐 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <#list articleList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/article/${item.id}\" title=\"${item.title}\">${item.title} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>分类目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTypeList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/type/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>标签目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTagsList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/tag/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"footer\">\r\n    该文件由<a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName}</a>网站自动生成。\r\n</div>\r\n</body>\r\n</html>', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('4', 'TM_ROBOTS', 'Crawl-delay: 5\r\nSitemap: ${config.cmsUrl}/sitemap.txt\r\nSitemap: ${config.cmsUrl}/sitemap.xml\r\nSitemap: ${config.cmsUrl}/sitemap.html\r\n', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('5', 'TM_LINKS', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>站长<a href=\"${link.url?if_exists}\" target=\"_blank\">${link.name?if_exists}</a>，您好!</p>\r\n        <p>您于 ${link.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 提交的友链申请已通过系统审核。以下为您提交的信息，请确认（如有误，请联系我）！</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <li>${link.email?if_exists}</li>\r\n            <li>${link.qq?if_exists}</li>\r\n            <li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li>\r\n        </ul>\r\n        </p>\r\n        <p>本站会不定期检查连接有效性，如果因为贵站改版、服务到期等原因导致无法正常访问的，我会暂时停掉贵站友链，待贵站可以正常访问后，本站会继续启用贵站友链。</p>\r\n        <p>特别注意：以下情况，本站将在不做任何通知下，<strong>取消友链</strong>！</p>\r\n        <ul>\r\n            <li>私自取消本站友情链接</li>\r\n            <li>更换域名且未通知本站</li>\r\n            <li>网站内容长期不更新</li>\r\n            <li>友链上使用诸如nofollow之类的属性</li>\r\n        </ul>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl?if_exists}\" target=\"_blank\">${config.siteName?if_exists}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('6', 'TM_COMMENT_AUDIT', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论审核结果通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论审核结果通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname?if_exists}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl?if_exists}${comment.sourceUrl?if_exists}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <#if comment.status == \'APPROVED\'>\r\n        <p>已通过管理员审核并显示。</p>\r\n        <p>\r\n            您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <#elseif comment.status == \'REJECT\'>\r\n        <p>审核失败！失败原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#elseif comment.status == \'DELETED\'>\r\n        <p>已被管理员删除！删除原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#else>\r\n        <p>管理员正在审核中！审核通过后将给您及时发送通知！</p>\r\n        </#if>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('7', 'TM_COMMENT_REPLY', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论回复通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论回复通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl}${comment.sourceUrl}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <p>\r\n            有了 <strong>新的回复</strong>！您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('8', 'TM_LINKS_TO_ADMIN', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>有新的友情链接加入，信息如下</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <#if link.favicon?exists><li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li></#if>\r\n        </ul>\r\n        </p>\r\n        <p><a style=\"text-decoration:none;\" href=\"${config.cmsUrl}\" target=\"_blank\">去后台继续审核</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('9', 'TM_NEW_COMMENT', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>新评论通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            新评论通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>\r\n            评论内容：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\"><#if comment?exists>${comment.content}<#else>**无评论内容**</#if></div>\r\n        <p>\r\n            <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">查看完整评论</a>\r\n        </p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2019-09-06 01:21:57', '2019-09-06 01:21:57');
INSERT INTO `sys_template` VALUES ('10', 'TM_NGINX_FILE_SERVER', 'server {\r\n    listen 80;\r\n    server_name serverName;\r\n    root serverPath;\r\n	error_page 403 /error.html;\r\n	location = /error.html {\r\n		return 404;\r\n	}\r\n	autoindex off; \r\n	autoindex_exact_size off; \r\n	autoindex_localtime off; \r\n	\r\n	location ^~ / {\r\n		proxy_set_header Host $host:$server_port;\r\n    }\r\n	\r\n	location ~*\\.(jpg|gif|png|swf|flv|wma|wmv|asf|mp3|mmf|zip|rar|js|css)$ {\r\n		expires 30d;\r\n		valid_referers serverReferers;\r\n		if ($invalid_referer) {\r\n			rewrite ^/ serverLogoPath;\r\n		}\r\n    }\r\n}\r\n', '2019-09-06 01:21:57', '2019-09-06 01:21:57');

-- ----------------------------
-- Table structure for `sys_update_recorde`
-- ----------------------------
DROP TABLE IF EXISTS `sys_update_recorde`;
CREATE TABLE `sys_update_recorde` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(20) DEFAULT NULL COMMENT '更新版本',
  `description` varchar(2500) DEFAULT NULL COMMENT '更新记录备注',
  `recorde_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '项目更新时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_update_recorde
-- ----------------------------
INSERT INTO `sys_update_recorde` VALUES ('1', '1.0.1', '第一版', '2019-09-06 01:21:57', '2019-09-06 01:21:57', '2019-09-06 01:21:57');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `nickname` varchar(30) DEFAULT '' COMMENT '昵称',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `gender` smallint(2) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `user_type` enum('ROOT','ADMIN','USER') DEFAULT 'ADMIN' COMMENT '超级管理员、管理员、普通用户',
  `company` varchar(100) DEFAULT NULL COMMENT '公司',
  `blog` varchar(255) DEFAULT NULL COMMENT '个人博客地址',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `source` enum('GITHUB','GITEE','WEIBO','DINGTALK','BAIDU','CSDN','CODING','OSCHINA','TENCENT_CLOUD','ALIPAY','TAOBAO','QQ','WECHAT','GOOGLE','FACEBOOK') DEFAULT NULL COMMENT '用户来源',
  `uuid` varchar(50) DEFAULT NULL COMMENT '用户唯一表示(第三方网站)',
  `privacy` tinyint(2) DEFAULT NULL COMMENT '隐私（1：公开，0：不公开）',
  `notification` tinyint(2) unsigned DEFAULT NULL COMMENT '通知：(1：通知显示消息详情，2：通知不显示详情)',
  `score` int(10) unsigned DEFAULT '0' COMMENT '金币值',
  `experience` int(10) unsigned DEFAULT '0' COMMENT '经验值',
  `reg_ip` varchar(30) DEFAULT NULL COMMENT '注册IP',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '最近登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `login_count` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `status` int(1) unsigned DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'root', 'jcO6Vuy9TByPv+6olUAagA==', '超级管理员', '18408234575', '1432678620@qq.com', '1432678620', null, null, 'http://lcools.cn/static/imgs/favicon.ico', 'ROOT', null, null, null, null, null, null, null, '0', '0', null, '117.157.99.114', '2019-09-10 15:38:50', '288', null, '1', '2019-09-06 01:21:59', '2019-09-10 15:38:50');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '2019-09-06 01:21:59', '2019-09-06 01:21:59');
