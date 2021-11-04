/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : blog_db

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2021-03-21 15:37:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bbstype`
-- ----------------------------
DROP TABLE IF EXISTS `bbstype`;
CREATE TABLE `bbstype` (
  `id` int(11) NOT NULL auto_increment,
  `typename` varchar(255) default NULL,
  `fatherid` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbstype
-- ----------------------------
INSERT INTO `bbstype` VALUES ('13', '校园生活', '0', '0');
INSERT INTO `bbstype` VALUES ('14', '学习娱乐', '0', '0');
INSERT INTO `bbstype` VALUES ('15', '影音漫游', '0', '0');
INSERT INTO `bbstype` VALUES ('16', '计算机基础', '0', '0');
INSERT INTO `bbstype` VALUES ('17', '.NET基础', '16', '0');
INSERT INTO `bbstype` VALUES ('18', 'java基础', '16', '0');
INSERT INTO `bbstype` VALUES ('19', '图片摄影', '15', '0');
INSERT INTO `bbstype` VALUES ('20', '音乐殿堂', '15', '0');
INSERT INTO `bbstype` VALUES ('21', '游戏国度', '14', '0');
INSERT INTO `bbstype` VALUES ('22', '文学地带', '13', '0');
INSERT INTO `bbstype` VALUES ('23', '灌水乐园', '13', '0');
INSERT INTO `bbstype` VALUES ('24', '测试', '0', '1');
INSERT INTO `bbstype` VALUES ('25', '11', '24', '1');
INSERT INTO `bbstype` VALUES ('26', '测试', '0', '1');
INSERT INTO `bbstype` VALUES ('27', '11', '26', '1');

-- ----------------------------
-- Table structure for `chat`
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(20) NOT NULL auto_increment,
  `msg` text,
  `hfmsg` text,
  `savetime` varchar(255) default NULL,
  `memberid` int(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES ('31', '111', '222', '2021-03-20 18:56:12', '43');
INSERT INTO `chat` VALUES ('32', '666', '999', '2021-03-21 15:33:59', '45');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` varchar(255) default NULL,
  `photoid` int(11) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('3', '45', '3', '111', '2021-03-20 18:52:53');
INSERT INTO `comment` VALUES ('4', '44', '3', '漂亮', '2021-03-21 15:32:52');

-- ----------------------------
-- Table structure for `fans`
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `gzmemberid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fans
-- ----------------------------
INSERT INTO `fans` VALUES ('10', '44', '45');
INSERT INTO `fans` VALUES ('11', '44', '43');
INSERT INTO `fans` VALUES ('12', '45', '47');

-- ----------------------------
-- Table structure for `fav`
-- ----------------------------
DROP TABLE IF EXISTS `fav`;
CREATE TABLE `fav` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `tzid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fav
-- ----------------------------
INSERT INTO `fav` VALUES ('2', '47', '36');
INSERT INTO `fav` VALUES ('3', '45', '37');

-- ----------------------------
-- Table structure for `imgadv`
-- ----------------------------
DROP TABLE IF EXISTS `imgadv`;
CREATE TABLE `imgadv` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgadv
-- ----------------------------
INSERT INTO `imgadv` VALUES ('5', '1613663453350.jpg', 'newsDetail?id=5');
INSERT INTO `imgadv` VALUES ('6', '1613663501598.jpg', 'tzDetail?id=36');

-- ----------------------------
-- Table structure for `imgdetails`
-- ----------------------------
DROP TABLE IF EXISTS `imgdetails`;
CREATE TABLE `imgdetails` (
  `id` int(11) NOT NULL auto_increment,
  `photoid` int(11) default NULL,
  `filename` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_imgdetails_photo` (`photoid`),
  CONSTRAINT `fk_imgdetails_photo` FOREIGN KEY (`photoid`) REFERENCES `photo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgdetails
-- ----------------------------
INSERT INTO `imgdetails` VALUES ('1', '3', '1616204874430.jpg');
INSERT INTO `imgdetails` VALUES ('7', '3', '1616207022935.jpg');
INSERT INTO `imgdetails` VALUES ('8', '3', '1616207055658.jpg');
INSERT INTO `imgdetails` VALUES ('9', '3', '1616207064634.jpg');
INSERT INTO `imgdetails` VALUES ('11', '6', '1616312000781.jpg');
INSERT INTO `imgdetails` VALUES ('12', '6', '1616312008064.jpg');

-- ----------------------------
-- Table structure for `jbrecord`
-- ----------------------------
DROP TABLE IF EXISTS `jbrecord`;
CREATE TABLE `jbrecord` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(255) default NULL,
  `jbmemberid` int(255) default NULL,
  `note` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbrecord
-- ----------------------------
INSERT INTO `jbrecord` VALUES ('4', '45', '47', '11');

-- ----------------------------
-- Table structure for `lab`
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES ('1', '编程语言', '0');
INSERT INTO `lab` VALUES ('2', '程序员', '0');
INSERT INTO `lab` VALUES ('3', '书单', '0');
INSERT INTO `lab` VALUES ('4', '11222', '1');
INSERT INTO `lab` VALUES ('5', '11', '1');
INSERT INTO `lab` VALUES ('6', '测试1', '1');
INSERT INTO `lab` VALUES ('7', '测试1', '1');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(20) NOT NULL auto_increment,
  `uname` varchar(255) default NULL,
  `upass` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `qq` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  `isjy` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `isfh` varchar(255) default NULL,
  `shstatus` varchar(255) default NULL,
  `lev` int(11) default NULL,
  `money` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('43', 'H001', '123', 'H001@126.com', 'H001', '女', '湖北武汉', '3820983209', '13899007721', '0', '2021-03-19 11:09:32', 'no', '1607656142725.jpg', 'no', '通过审核', '9', '94');
INSERT INTO `member` VALUES ('44', 'H002', '123', 'H002@126.com', 'H002', '男', '湖北武汉', '47348304', '13788665544', '0', '2021-03-19 15:33:03', 'no', '1611991964465.png', 'no', '通过审核', '9', '103');
INSERT INTO `member` VALUES ('45', 'H003', '123', 'H003@126.com', 'H003', '男', '湖北宜昌', '4380948309', '13877665500', '0', '2021-03-19 15:43:40', 'no', '1611992596815.jpg', 'no', '通过审核', '9', '101');
INSERT INTO `member` VALUES ('46', 'H004', '123', 'H004@126.com', 'H004', '女', '湖北武汉', '483098403', '13877664411', '0', '2021-03-19 21:08:42', 'no', '1612098500864.png', 'no', '通过审核', '1', '5');
INSERT INTO `member` VALUES ('47', 'H005', '123', 'H005@126.com', '你先上我断后', '女', '北京', '48309843', '13877665512', '0', '2021-03-19 15:42:32', 'no', '1613720528689.jpg', 'no', '通过审核', '1', '3');

-- ----------------------------
-- Table structure for `mgword`
-- ----------------------------
DROP TABLE IF EXISTS `mgword`;
CREATE TABLE `mgword` (
  `id` int(11) NOT NULL auto_increment,
  `wordnote` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mgword
-- ----------------------------
INSERT INTO `mgword` VALUES ('3', '密码');

-- ----------------------------
-- Table structure for `music`
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES ('1', 'Bandari', '1616209920326.mp3');
INSERT INTO `music` VALUES ('2', '半阳', '1616210087163.mp3');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(20) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` text,
  `filename` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('4', '毕志飞起诉豆瓣被全部驳回', '<span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">据北京法院审判信息网判决书公示，《纯洁心灵·逐梦演艺圈》片方诉豆网公司侵权案一审，法院判决驳回原告全部诉讼请求。据悉，因《逐梦演艺圈》上映当日被豆瓣平台“锁定”为2.0分，毕志飞认为豆瓣涉嫌人工改评分操控删帖，人为制造舆论，故将其诉至法院。法院认为，毕志飞方在本案中提交的证据不足以证明豆瓣方存在锁定评分等刻意诽谤、诋毁毕志飞方名誉等行为，法院就其诉求不予支持。</span>', '', '2021-03-18 13:25:55');
INSERT INTO `news` VALUES ('5', '2021年抖音TikTok占全球移动应用收入榜首', '<span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">2月9日，Sensor Tower 商店情报数据显示，2021年1月抖音及海外版TikTok在全球App Store和Google Play吸金近1.28亿美元，是去年1月的3.8倍，再次蝉联全球移动应用(非游戏)收入榜冠军。其中，大约82%的收入来自中国版本抖音；美国市场排名第二，贡献了8%的收入；土耳其市场排名第三，占2%。</span>', '', '2021-03-18 13:26:11');
INSERT INTO `news` VALUES ('6', '普通人如何实现财务自由？', '<span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">财务自由是指人无需为生活开销而努力为钱工作的状态。简单地说，一个人的资产产生的被动收入至少要等于或超过他的日常开支，如果进入这种状态，就可以称之为财务自由。</span>', '', '2021-03-18 13:26:25');
INSERT INTO `news` VALUES ('7', '2020胡润报告：千万资产高净值家庭调查', '<span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">胡润研究院8日上午发布《财富报告》，揭示目前中国拥有600万人民币资产、千万人民币资产、亿元人民币资产和3000万美金资产的家庭数量和地域分布情况，北京仍然是国内高净值家庭第一城，广东紧随其后。</span>', '', '2021-03-18 13:26:37');

-- ----------------------------
-- Table structure for `pbinfo`
-- ----------------------------
DROP TABLE IF EXISTS `pbinfo`;
CREATE TABLE `pbinfo` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(255) default NULL,
  `pbmemberid` int(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pbinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `photo`
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('1', '43', '我的家乡');
INSERT INTO `photo` VALUES ('2', '43', '美景');
INSERT INTO `photo` VALUES ('3', '43', '美景1');
INSERT INTO `photo` VALUES ('6', '44', '人物');

-- ----------------------------
-- Table structure for `signin`
-- ----------------------------
DROP TABLE IF EXISTS `signin`;
CREATE TABLE `signin` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of signin
-- ----------------------------
INSERT INTO `signin` VALUES ('2', '43', '2021-03-20');
INSERT INTO `signin` VALUES ('3', '45', '2021-03-20');
INSERT INTO `signin` VALUES ('4', '45', '2021-03-21');

-- ----------------------------
-- Table structure for `sxinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sxinfo`;
CREATE TABLE `sxinfo` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(255) default NULL,
  `sxmemberid` int(255) default NULL,
  `note` text,
  `hfnote` text,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sxinfo
-- ----------------------------
INSERT INTO `sxinfo` VALUES ('6', '44', '45', '在吗', '在的', '2021-03-21 15:31:50');

-- ----------------------------
-- Table structure for `tzhtinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tzhtinfo`;
CREATE TABLE `tzhtinfo` (
  `id` int(11) NOT NULL auto_increment,
  `tzid` int(255) default NULL,
  `note` text,
  `author` int(255) default NULL,
  `savetime` varchar(255) default NULL,
  `dznum` int(11) default NULL,
  `canht` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tzhtinfo
-- ----------------------------
INSERT INTO `tzhtinfo` VALUES ('49', '41', '666', '44', '2021-03-21 15:30:34', '0', '');
INSERT INTO `tzhtinfo` VALUES ('50', '37', '**二个字', '45', '2021-03-21 15:34:21', '0', '');

-- ----------------------------
-- Table structure for `tzinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tzinfo`;
CREATE TABLE `tzinfo` (
  `id` int(11) NOT NULL auto_increment,
  `fid` varchar(255) default NULL,
  `sid` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `note` text,
  `author` int(11) default NULL,
  `savetime` varchar(255) default NULL,
  `dznum` int(11) default NULL,
  `looknum` int(11) default NULL,
  `plnum` int(11) default NULL,
  `isjh` varchar(255) default NULL,
  `istop` varchar(255) default NULL,
  `updatetime` varchar(255) default NULL,
  `canht` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `isfb` varchar(255) default NULL,
  `labids` varchar(255) default NULL,
  `shstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tzinfo
-- ----------------------------
INSERT INTO `tzinfo` VALUES ('33', '16', '18', '重写 多态 向上转型和向下转型 究极易理解篇', '前言：在看完狂神说Java的关于重写 多态 向上转型和向下转型的视频之后，我感到了极大的困惑和难以理解，于是我去看了很多不同的视频，最终总结出一套究极容易理解和运用的模式<br />\r\n用心看完，你也应该会有很大的收获<br />\r\nPS：有些代码我使用图片的形式上传，为的是是结果更加清晰易懂，可以配合Ctrl+滚轮食用<br />', '43', '2021-03-19 13:10:41', '0', '10', '0', 'no', 'no', '', 'no', '', '是', '1', '未通过');
INSERT INTO `tzinfo` VALUES ('34', '16', '18', '超详解数组基础知识点很全面', '<h2 style=\"font-family:\" font-size:24px;color:#4f4f4f;background-color:#ffffff;\"=\"\">\r\n	数组（是一种引用数据类型）\r\n	</h2>\r\n<p style=\"font-size:16px;color:#4D4D4D;font-family:-apple-system, \" background-color:#ffffff;\"=\"\"> <span style=\"font-weight:700;\">一，数组定义？</span>：它是基础的线性储存结构，也可以有效的实现一组变量的关联\r\n		</p>', '43', '2021-03-19 13:22:41', '2', '89', '2', 'no', 'no', '', 'yes', '', '是', '2,1', '通过');
INSERT INTO `tzinfo` VALUES ('35', '16', '17', 'Dijkstra算法', '<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	戴克斯特拉算法（Dijkstra’s algorithm）是由荷兰计算机科学家艾兹赫尔·戴克斯特拉提出。迪科斯彻算法使用了广度优先搜索解决非负权有向图的单源最短路径问题，算法最终得到一个最短路径树。该算法常用于路由算法或者作为其他图算法的一个子模块。\r\n</p>\r\n<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	该算法的输入包含了一个有权重的有向图 G，以及G中的一个来源顶点 S。我们以 V 表示 G 中所有顶点的集合。每一个图中的边，都是两个顶点所形成的有序元素对。(u, v) 表示从顶点 u 到 v 有路径相连。我们以 E 表示G中所有边的集合，而边的权重则由权重函数 w: E → [0, ∞] 定义。因此，w(u, v) 就是从顶点 u 到顶点 v 的非负权重（weight）。边的权重可以想像成两个顶点之间的距离。任两点间路径的权重，就是该路径上所有边的权重总和。已知有 V 中有顶点 s 及 t，Dijkstra 算法可以找到 s 到 t的最低权重路径(例如，最短路径)。这个算法也可以在一个图中，找到从一个顶点 s 到任何其他顶点的最短路径。对于不含负权的有向图，Dijkstra算法是目前已知的最快的单源最短路径算法。\r\n</p>\r\n<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	算法步骤：\r\n</p>\r\n<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	1. 初始时令 S={V0},T={其余顶点}，T中顶点对应的距离值\r\n</p>\r\n<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	若存在&lt;V0,Vi&gt;，d(V0,Vi)为&lt;V0,Vi&gt;弧上的权值\r\n</p>\r\n<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	若不存在&lt;V0,Vi&gt;，d(V0,Vi)为∞\r\n</p>\r\n<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	2. 从T中选取一个其距离值为最小的顶点W且不在S中，加入S\r\n</p>\r\n<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	3. 对其余T中顶点的距离值进行修改：若加进W作中间顶点，从V0到Vi的距离值缩短，则修改此距离值\r\n</p>\r\n<p style=\"font-size:16px;color:#C4C4C8;font-family:-apple-system, &quot;background-color:#262728;\">\r\n	重复上述步骤2、3，直到S中包含所有顶点，即W=Vi为止\r\n</p>', '44', '2021-03-19 13:27:41', '2', '11', '1', 'no', 'no', '', 'yes', '', '是', null, '通过');
INSERT INTO `tzinfo` VALUES ('36', '16', '17', 'Visual QA论文阅读', '<p style=\"font-size:16px;color:#4D4D4D;font-family:-apple-system, &quot;background-color:#FFFFFF;\">\r\n	本文的动机在Abstract第一句，使用视觉和文本的结构化表示提升VQA性能。作者在Introduction中总结了VQA的两个Challenge：①很多问题需要复杂的理解能力；②VQA的训练数据具有稀疏性，即：同一张图片上有很多不同的问题，但是训练集中无法完全包含这些问题。\r\n</p>\r\n<p style=\"font-size:16px;color:#4D4D4D;font-family:-apple-system, &quot;background-color:#FFFFFF;\">\r\n	本文方法如下图所示，在视觉和文本两个模态上分别建立场景图，视觉场景图初始时全连接，文本场景图基于斯坦福解析器。得到场景图后，对两张场景图分别使用GRU+pooling操作聚集邻居信息，重复4次，得到最终的结点特征。基于原文本和视觉特征计算余弦相似度，得到Matching weights。基于最终文本和视觉特征计算Combined features。将二者做element-wise乘法，在得到的矩阵上，进行特征聚集（过程如下面三行公式，<span class=\"katex--inline\"><span class=\"katex\" style=\"font-size:1.21em;line-height:1.2;font-family:KaTeX_Main, &quot;\"><span class=\"katex-mathml\">a i , j a_{i,j}</span><span class=\"katex-html\"><span class=\"strut\" style=\"vertical-align:-0.286108em;\"></span><span class=\"mord\"><span class=\"mord mathdefault\" style=\"font-family:KaTeX_Math;font-style:italic;\">a</span><span class=\"msupsub\"><span class=\"vlist-t vlist-t2\"><span class=\"vlist-r\"><span class=\"vlist\" style=\"vertical-align:bottom;\"><span class=\"\"><span class=\"pstrut\"></span><span class=\"sizing reset-size6 size3 mtight\" style=\"font-size:0.7em;\"><span class=\"mord mtight\"><span class=\"mord mathdefault mtight\" style=\"font-family:KaTeX_Math;font-style:italic;\">i</span><span class=\"mpunct mtight\">,</span><span class=\"mord mathdefault mtight\" style=\"font-family:KaTeX_Math;font-style:italic;\">j</span></span></span></span></span><span class=\"vlist-s\" style=\"vertical-align:bottom;font-size:1px;\"></span></span><span class=\"vlist-r\"><span class=\"vlist\" style=\"vertical-align:bottom;\"><span class=\"\"></span></span></span></span></span></span></span></span></span>是Matching weights中的元素），得到最终特征，用于预测答案。<br />\r\n<img src=\"https://img-blog.csdnimg.cn/20210218203426768.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L21zOTYxNTE2Nzky,size_16,color_FFFFFF,t_70\" width=\"25%\" />\r\n</p>', '44', '2021-03-19 13:28:31', '2', '37', '1', 'no', 'no', '', 'yes', '', '是', '3', '通过');
INSERT INTO `tzinfo` VALUES ('37', '16', '18', '缺省参数 函数重载', '使用cout标准输出(控制台)和cin标准输入(键盘)时，必须包含&lt; iostream &gt;头文件以及std标准命名空间。<br />\r\n注意：早期标准库将所有功能在全局域中实现，声明在.h后缀的头文件中，使用时只需包含对应头文件即可，后来将其实现在std命名空间下，为了和C头文件区分，也为了正确使用命名空间，规定C++头文件不带.h；旧编译器(vc 6.0)中还支持<iostream.h>格式，后续编译器已不支持，因此推荐使用+std的方式。<br />\r\n</iostream.h>', '47', '2021-03-19 15:44:59', '2', '46', '8', 'no', 'no', '', 'yes', '', '是', '2,1', '通过');
INSERT INTO `tzinfo` VALUES ('41', '16', '18', 'Red Hat Linux用户基础', '网上找了很多，都不能下载。发现csdn可以，三个文档，30个币太贵了。我上传一下，币便宜的。', '45', '2021-03-21 15:29:03', '1', '7', '1', 'no', 'no', '', 'yes', '', '是', '1', '通过');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL auto_increment,
  `usertype` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `userpassword` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '管理员', 'admin', '123', 'admin', '男', '13789071122', 'admin@126.com', '湖北武汉', '0', null);

-- ----------------------------
-- Table structure for `vote`
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` varchar(255) default NULL,
  `tzid` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote
-- ----------------------------
INSERT INTO `vote` VALUES ('7', '43', '35');
INSERT INTO `vote` VALUES ('8', '46', '37');
INSERT INTO `vote` VALUES ('9', '45', '37');
INSERT INTO `vote` VALUES ('10', '44', '41');

-- ----------------------------
-- Table structure for `yqlink`
-- ----------------------------
DROP TABLE IF EXISTS `yqlink`;
CREATE TABLE `yqlink` (
  `id` int(20) NOT NULL auto_increment,
  `linkname` varchar(255) default NULL,
  `linkurl` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yqlink
-- ----------------------------
INSERT INTO `yqlink` VALUES ('8', 'CSDN', 'https://www.csdn.net/?spm=1001.2100.3001.4476');
INSERT INTO `yqlink` VALUES ('9', '月光博客', 'https://www.williamlong.info');
INSERT INTO `yqlink` VALUES ('10', '百度', 'www.baidu.com');
