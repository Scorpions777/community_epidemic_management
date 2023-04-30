/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50742 (5.7.42-log)
 Source Host           : localhost:3306
 Source Schema         : community_epidemic_management

 Target Server Type    : MySQL
 Target Server Version : 50742 (5.7.42-log)
 File Encoding         : 65001

 Date: 30/04/2023 09:39:28
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`
(
  `address_id`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `community_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小区名称',
  `building_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼号',
  `room_number`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单元号+门牌号',
  `houser`          varchar(555) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住户的户主',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address`
VALUES ('1496436103761235968', '恒大绿洲', '1栋', '201', '444');
INSERT INTO `address`
VALUES ('1496436866013073408', '恒大绿洲', '1栋', '202', '555');
INSERT INTO `address`
VALUES ('1496437187783299072', '恒大绿洲', '1栋', '203', NULL);
INSERT INTO `address`
VALUES ('1496437270801158144', '恒大绿洲', '1栋', '204', NULL);
INSERT INTO `address`
VALUES ('1496437520735539200', '恒大绿洲', '1栋', '301', NULL);
INSERT INTO `address`
VALUES ('1496437520735539201', '恒大绿洲', '1栋', '302', NULL);
INSERT INTO `address`
VALUES ('1496437520735539202', '恒大绿洲', '1栋', '303', NULL);
INSERT INTO `address`
VALUES ('1496437520735539203', '恒大绿洲', '1栋', '304', NULL);
INSERT INTO `address`
VALUES ('1496437520735539204', '恒大绿洲', '1栋', '401', NULL);
INSERT INTO `address`
VALUES ('1496437520735539205', '恒大绿洲', '1栋', '402', NULL);
INSERT INTO `address`
VALUES ('1496437520735539206', '恒大绿洲', '1栋', '403', NULL);
INSERT INTO `address`
VALUES ('1496437520735539207', '恒大绿洲', '1栋', '404', NULL);
INSERT INTO `address`
VALUES ('1496437520735539208', '恒大绿洲', '1栋', '501', NULL);
INSERT INTO `address`
VALUES ('1496437520735539209', '恒大绿洲', '1栋', '502', NULL);
INSERT INTO `address`
VALUES ('1496437520735539210', '恒大绿洲', '1栋', '503', NULL);
INSERT INTO `address`
VALUES ('1496437520735539301', '恒大绿洲', '1栋', '504', NULL);
INSERT INTO `address`
VALUES ('1496437520735539302', '恒大绿洲', '2栋', '201', '1');
INSERT INTO `address`
VALUES ('1496437520735539303', '恒大绿洲', '2栋', '202', '1');
INSERT INTO `address`
VALUES ('1496437520735539304', '恒大绿洲', '2栋', '203', NULL);
INSERT INTO `address`
VALUES ('1496437520735539305', '恒大绿洲', '2栋', '204', NULL);
INSERT INTO `address`
VALUES ('1496437520735539306', '恒大绿洲', '2栋', '301', NULL);
INSERT INTO `address`
VALUES ('1496437520735539307', '恒大绿洲', '2栋', '302', NULL);
INSERT INTO `address`
VALUES ('1496437520735539308', '恒大绿洲', '2栋', '303', NULL);
INSERT INTO `address`
VALUES ('1496437520735539309', '恒大绿洲', '2栋', '304', NULL);
INSERT INTO `address`
VALUES ('1496437520735539310', '恒大绿洲', '2栋', '401', NULL);
INSERT INTO `address`
VALUES ('1496437520735539311', '恒大绿洲', '2栋', '402', NULL);
INSERT INTO `address`
VALUES ('1496437520735539312', '恒大绿洲', '2栋', '403', NULL);
INSERT INTO `address`
VALUES ('1496437520735539313', '恒大绿洲', '2栋', '404', NULL);
INSERT INTO `address`
VALUES ('1496437520735539314', '恒大绿洲', '2栋', '501', NULL);
INSERT INTO `address`
VALUES ('1496437520735539315', '恒大绿洲', '2栋', '502', NULL);
INSERT INTO `address`
VALUES ('1496437520735539316', '恒大绿洲', '2栋', '503', NULL);
INSERT INTO `address`
VALUES ('1496437520735539317', '恒大绿洲', '2栋', '504', NULL);
INSERT INTO `address`
VALUES ('1496437520735539318', '恒大绿洲', '2栋', '601', NULL);
INSERT INTO `address`
VALUES ('1496437520735539319', '恒大绿洲', '2栋', '602', NULL);
INSERT INTO `address`
VALUES ('1496437520735539320', '恒大绿洲', '2栋', '603', NULL);
INSERT INTO `address`
VALUES ('1496437520735539321', '恒大绿洲', '2栋', '604', NULL);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`
(
  `admin_id`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loginname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone`     varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin`
VALUES ('1', 'xiaomi', '小米', '18812345678', '12345678');
INSERT INTO `admin`
VALUES ('2', 'xiaohei', '小黑', '18812345677', '12345678');
INSERT INTO `admin`
VALUES ('3', 'xiaoyu', '小鱼', '18812345676', '12345678');
INSERT INTO `admin`
VALUES ('4', 'xiaoxin', '小新', '18812345675', '12345678');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`
(
  `news_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title`   varchar(555) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news`
VALUES ('1649732068957097984', '紧急通知', '新十条规定');
INSERT INTO `news`
VALUES ('1649732396079255552', '新十条规定',
        '12月7日，国务院联防联控机制综合组发布《关于进一步优化落实新冠肺炎疫情防控措施的通知》。具体如下： （一）科学精准划分风险区域  按楼栋、单元、楼层、住户划定高风险区，不得随意扩大到小区、社区和街道（乡镇）等区域。不得采取各种形式的临时封控。  （二）进一步优化核酸检测 不按行政区域开展全员核酸检测，进一步缩小核酸检测范围、减少频次。根据防疫工作需要，可开展抗原检测。 对高风险岗位从业人员和高风险区人员按照有关规定进行核酸检测，其他人员愿检尽检。  除养老院、福利院、医疗机构、托幼机构、中小学等特殊场所外，不要求提供核酸检测阴性证明，不查验健康码。  重要机关、大型企业及一些特定场所可由属地自行确定防控措施。  不再对跨地区流动人员查验核酸检测阴性证明和健康码，不再开展落地检。');

-- ----------------------------
-- Table structure for resident
-- ----------------------------
DROP TABLE IF EXISTS `resident`;
CREATE TABLE `resident`
(
  `resident_id`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender`        tinyint(4) NULL DEFAULT NULL COMMENT '性别。0：女，1：男',
  `id_card`       varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone`         varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_in_time` date NULL DEFAULT NULL,
  `address_id`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status`        int(11) NULL DEFAULT NULL COMMENT '状态值。1：正常。2：低风险。3：中风险。4：高风险',
  `password`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`resident_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '住户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resident
-- ----------------------------
INSERT INTO `resident`
VALUES ('1497039458380419072', '李威', 1, '456661199001011234', '15012345678', '2021-02-01', '1496436103761235968', '',
        3, '123abc');
INSERT INTO `resident`
VALUES ('1497040302194692096', '张帅', 1, '456661200012124567', '15812345670', '2020-02-04', '1496436866013073408', '',
        4, NULL);
INSERT INTO `resident`
VALUES ('1497040601034657792', '张伟', 1, '456661199512124561', '15812345671', '2020-01-06', '1496437187783299072', '',
        2, NULL);
INSERT INTO `resident`
VALUES ('1497040752386117632', '王薇', 0, '456661196012120124', '15612345678', '2020-12-07', '1496437187783299072', '',
        1, NULL);
INSERT INTO `resident`
VALUES ('1497040923849265152', '郑军', 1, '456661199810107894', '15712345678', '2019-02-20', '1496437270801158144', '',
        1, NULL);
INSERT INTO `resident`
VALUES ('1497041122147569664', '周文', 0, '456661198801021234', '15212345678', '2019-12-17', '1496437520735539200', '',
        1, NULL);
INSERT INTO `resident`
VALUES ('1497041274824429568', '冯章', 1, '456661198612014561', '17612345678', '2019-12-17', '1496437270801158144', '',
        1, NULL);
INSERT INTO `resident`
VALUES ('1497041548444045312', '李明', 1, '456661198602011234', '16112345678', '2019-10-28', '1496437520735539203', '',
        1, NULL);
INSERT INTO `resident`
VALUES ('1497041917593128960', '张维', 1, '456661198705011234', '17012345678', '2020-01-08', '1496437520735539206', '',
        1, NULL);
INSERT INTO `resident`
VALUES ('1652345785649598464', '高启强', 1, '456661209512124561', '15812345651', '2023-04-30', '1496437520735539302',
        '', 1, NULL);
INSERT INTO `resident`
VALUES ('1652346118702501888', '高启盛', 1, '456661209812124561', '15812345171', '2023-04-30', '1496437520735539302',
        'ss', 3, NULL);

-- ----------------------------
-- Table structure for resident_access_apply
-- ----------------------------
DROP TABLE IF EXISTS `resident_access_apply`;
CREATE TABLE `resident_access_apply`
(
  `apply_id`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `access_time` datetime                                               NOT NULL COMMENT '时间',
  `access_type` tinyint(4) NOT NULL COMMENT '进出类型：1：进，2：出',
  `resident_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '住户id',
  `name`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `id_card`     varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `temperature` decimal(3, 1) NULL DEFAULT NULL COMMENT '体温',
  `place`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `remark`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `state`       int(1) NOT NULL DEFAULT 0 COMMENT '处理状态',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resident_access_apply
-- ----------------------------
INSERT INTO `resident_access_apply`
VALUES ('1652401204208209920', '2023-04-30 03:55:21', '2023-04-29 00:00:00', 1, '1497039458380419072', '李威',
        '456661199001011234', 44.0, '莽村', '22', -1);
INSERT INTO `resident_access_apply`
VALUES ('1652414334736928768', '2023-04-30 04:47:32', '2023-04-06 00:00:00', 1, '1497039458380419072', '李威',
        '456661199001011234', 11.0, '莽村', '11', 0);
INSERT INTO `resident_access_apply`
VALUES ('1652414591218618368', '2023-04-30 04:48:33', '2023-04-05 00:00:00', 1, '1497039458380419072', '李威',
        '456661199001011234', 21.0, 'ss', '33', 0);

-- ----------------------------
-- Table structure for resident_access_record
-- ----------------------------
DROP TABLE IF EXISTS `resident_access_record`;
CREATE TABLE `resident_access_record`
(
  `record_id`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `access_type` tinyint(4) NULL DEFAULT NULL COMMENT '进出类型：1：进，2：出',
  `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card`     varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `place`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `temperature` decimal(3, 1) NULL DEFAULT NULL,
  `remark`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '住户出入登记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resident_access_record
-- ----------------------------
INSERT INTO `resident_access_record`
VALUES ('1496711467741876224', '2022-02-23 13:02:10', 1, '张帅', '456661200012124567', '开发区', 36.6, '0');
INSERT INTO `resident_access_record`
VALUES ('1496719138578632704', '2022-02-24 13:30:24', 1, '李威', '456661199001011234', '盛世豪庭', 36.6, '');
INSERT INTO `resident_access_record`
VALUES ('1496719334100307968', '2022-02-24 13:31:11', 2, '张伟', '456661199512124561', '北京路', 36.5, '');
INSERT INTO `resident_access_record`
VALUES ('1496720843445768192', '2022-02-24 13:37:11', 1, '王薇', '456661196012120124', '南京路', 36.6, '');
INSERT INTO `resident_access_record`
VALUES ('1496721676480679936', '2022-02-24 13:40:30', 1, '郑军', '456661199810107894', '上海路', 36.6, '');
INSERT INTO `resident_access_record`
VALUES ('1496721834048098304', '2022-02-24 13:41:07', 2, '周文', '456661198801021234', '沃尔玛', 36.4, '');
INSERT INTO `resident_access_record`
VALUES ('1496722178626949120', '2022-02-24 13:42:29', 2, '冯章', '456661198612014561', '一中', 37.0, '');
INSERT INTO `resident_access_record`
VALUES ('1496722680831938560', '2022-02-24 13:44:29', 2, '李明', '456661198602011234', '三小', 37.1, '');
INSERT INTO `resident_access_record`
VALUES ('1496722945173753856', '2022-02-24 13:45:32', 1, '张维', '456661198705011234', '汽车站', 36.8, '');
INSERT INTO `resident_access_record`
VALUES ('1496723249579560960', '2022-02-24 13:46:45', 2, '陈超', '456661198612120141', '中心幼儿园', 36.9, '');
INSERT INTO `resident_access_record`
VALUES ('1496723905434488832', '2022-02-24 13:49:21', 2, '赵宇', '456661199802143456', '天津路', 36.9, '');
INSERT INTO `resident_access_record`
VALUES ('1499595309515411456', '2022-03-04 11:59:17', 1, '测试', '456661199001011234', '二中', 36.6, '');

-- ----------------------------
-- Table structure for returnees
-- ----------------------------
DROP TABLE IF EXISTS `returnees`;
CREATE TABLE `returnees`
(
  `returnees_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender`       tinyint(4) NULL DEFAULT NULL,
  `id_card`      varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone`        varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `temperature`  decimal(3, 1) NULL DEFAULT NULL,
  `return_time`  date NULL DEFAULT NULL,
  `from_place`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_id`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status`       int(11) NULL DEFAULT NULL COMMENT '状态值。1：正常。2：低风险。3：中风险。4：高风险',
  `password`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`returnees_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '返乡人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of returnees
-- ----------------------------
INSERT INTO `returnees`
VALUES ('1497047053916835840', '陈超', 1, '456661198612120141', '13912345671', 36.6, '2022-01-19', '2022-02-25',
        '1496436103761235968', '', 1, '123456');
INSERT INTO `returnees`
VALUES ('1497047523766964224', '赵宇', 1, '456661199802143456', '18012345678', 36.6, '2022-01-12', '东莞',
        '1496437187783299072', '', 1, NULL);
INSERT INTO `returnees`
VALUES ('1497048298421358592', '钱武', 1, '456661199812230123', '13912345679', 36.6, '2022-01-06', '中山',
        '1496437187783299072', '', 2, NULL);
INSERT INTO `returnees`
VALUES ('1497048561790095360', '林烨', 1, '456661199512021234', '13912345672', 36.9, '2022-01-20', '浙江温州',
        '1496437520735539205', '', 1, NULL);
INSERT INTO `returnees`
VALUES ('1497048824181559296', '赵信', 1, '456661199605051234', '13987456321', 36.8, '2022-01-20', '上海松江',
        '1496437520735539308', '', 1, NULL);
INSERT INTO `returnees`
VALUES ('1497049084261961728', '赵盼', 0, '456661196812301234', '13912345676', 36.8, '2022-01-28', '广东惠州',
        '1496437520735539305', '', 1, NULL);
INSERT INTO `returnees`
VALUES ('1652349084620689408', '高启兰', 0, '456661209912124561', '15812345271', 3.0, '2023-04-30', '2023-04-30',
        '1496437520735539302', 'sss', 4, NULL);

-- ----------------------------
-- Table structure for returnees_access_apply
-- ----------------------------
DROP TABLE IF EXISTS `returnees_access_apply`;
CREATE TABLE `returnees_access_apply`
(
  `apply_id`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time`   datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `access_time`   datetime                                               NOT NULL COMMENT '时间',
  `access_type`   tinyint(4) NOT NULL COMMENT '进出类型：1：进，2：出',
  `resident_id`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `resident_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `name`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `gender`        tinyint(4) NOT NULL COMMENT '性别。0：女，1：男',
  `id_card`       varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `phone`         varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `place`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `temperature`   decimal(3, 1) NULL DEFAULT NULL COMMENT '体温',
  `remark`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `state`         int(1) NOT NULL DEFAULT 0 COMMENT '处理状态',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of returnees_access_apply
-- ----------------------------
INSERT INTO `returnees_access_apply`
VALUES ('1652486237984002048', '2023-04-30 09:33:15', '2023-04-11 00:00:00', 1, '1497039458380419072', '李威', '高育良',
        1, '11', '11', '汉东', 11.0, '', 1);

-- ----------------------------
-- Table structure for visitor_access_apply
-- ----------------------------
DROP TABLE IF EXISTS `visitor_access_apply`;
CREATE TABLE `visitor_access_apply`
(
  `apply_id`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time`   datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `access_time`   date                                                   NOT NULL COMMENT '时间',
  `access_type`   tinyint(4) NOT NULL COMMENT '进出类型：1：进，2：出',
  `resident_id`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `resident_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `name`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `gender`        tinyint(4) NOT NULL COMMENT '性别。0：女，1：男',
  `id_card`       varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `phone`         varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `place`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `temperature`   decimal(3, 1) NULL DEFAULT NULL COMMENT '体温',
  `remark`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `state`         int(1) NOT NULL DEFAULT 0 COMMENT '处理状态',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitor_access_apply
-- ----------------------------
INSERT INTO `visitor_access_apply`
VALUES ('1652417934749995008', '2023-04-30 05:01:50', '2023-04-30', 1, '1497039458380419072', '李威', '李有田', 1,
        '456661196012120124', '15612345678', '莽村', 33.0, '', 1);

-- ----------------------------
-- Table structure for visitor_access_record
-- ----------------------------
DROP TABLE IF EXISTS `visitor_access_record`;
CREATE TABLE `visitor_access_record`
(
  `record_id`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `access_type` tinyint(4) NULL DEFAULT NULL COMMENT '进出类型：1：进，2：出',
  `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card`     varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone`       varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_id`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_place`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访客从什么地方来',
  `temperature` decimal(3, 1) NULL DEFAULT NULL,
  `remark`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访客出入登记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitor_access_record
-- ----------------------------
INSERT INTO `visitor_access_record`
VALUES ('1497055160457891840', '2022-02-25 00:00:00', 1, '刘备', '456661198610121234', '13932145678',
        '1496437520735539205', '解放路', 36.9, '');
INSERT INTO `visitor_access_record`
VALUES ('1497056302277464064', '2022-02-25 11:50:11', 2, '孔明', '456661199712230123', '13996325874',
        '1496437520735539303', '中山路', 36.6, '');
INSERT INTO `visitor_access_record`
VALUES ('1497056674161233920', '2022-02-25 11:51:39', 1, '关羽', '456661196612200258', '13812345670',
        '1496437520735539309', '一中', 35.6, '');
INSERT INTO `visitor_access_record`
VALUES ('1497056836392718336', '2022-02-25 11:52:18', 1, '张飞', '456661199806051234', '13812345600',
        '1496437520735539302', '一小', 36.9, '');
INSERT INTO `visitor_access_record`
VALUES ('1497057090320076800', '2022-02-25 11:53:18', 2, '赵云', '456661198811220011', '13812345611',
        '1496437520735539209', '农贸市场', 36.3, '');
INSERT INTO `visitor_access_record`
VALUES ('1497057254917148672', '2022-02-25 11:53:58', 2, '黄忠', '456661198605021234', '13812345665',
        '1496437520735539317', '旧货市场', 36.8, '');
INSERT INTO `visitor_access_record`
VALUES ('1652353769914109952', '2023-04-30 00:46:52', 1, '陈金默', '456661500012124567', '15812745171',
        '1496437520735539302', '鱼档', 10.0, 's');

SET
FOREIGN_KEY_CHECKS = 1;
