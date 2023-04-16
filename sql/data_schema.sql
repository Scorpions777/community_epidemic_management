/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.26 : Database - community_epidemic_management_0222
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `address_id` varchar(64) NOT NULL,
  `community_name` varchar(32) DEFAULT NULL COMMENT '小区名称',
  `building_number` varchar(32) DEFAULT NULL COMMENT '楼号',
  `room_number` varchar(32) DEFAULT NULL COMMENT '单元号+门牌号',
  `count` tinyint(4) DEFAULT NULL COMMENT '住户人数',
  `houser` varchar(555) DEFAULT NULL COMMENT '住户的户主',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地址表';

/*Data for the table `address` */

insert  into `address`(`address_id`,`community_name`,`building_number`,`room_number`,`count`,`houser`) values 
('1496436103761235968','恒大绿洲','1栋','201',111,'444'),
('1496436866013073408','恒大绿洲','1栋','202',4,'555'),
('1496437187783299072','恒大绿洲','1栋','203',4,NULL),
('1496437270801158144','恒大绿洲','1栋','204',2,NULL),
('1496437520735539200','恒大绿洲','1栋','301',5,NULL),
('1496437520735539201','恒大绿洲','1栋','302',5,NULL),
('1496437520735539202','恒大绿洲','1栋','303',5,NULL),
('1496437520735539203','恒大绿洲','1栋','304',3,NULL),
('1496437520735539204','恒大绿洲','1栋','401',2,NULL),
('1496437520735539205','恒大绿洲','1栋','402',5,NULL),
('1496437520735539206','恒大绿洲','1栋','403',6,NULL),
('1496437520735539207','恒大绿洲','1栋','404',4,NULL),
('1496437520735539208','恒大绿洲','1栋','501',5,NULL),
('1496437520735539209','恒大绿洲','1栋','502',3,NULL),
('1496437520735539210','恒大绿洲','1栋','503',5,NULL),
('1496437520735539301','恒大绿洲','1栋','504',4,NULL),
('1496437520735539302','恒大绿洲','2栋','201',7,NULL),
('1496437520735539303','恒大绿洲','2栋','202',6,NULL),
('1496437520735539304','恒大绿洲','2栋','203',5,NULL),
('1496437520735539305','恒大绿洲','2栋','204',4,NULL),
('1496437520735539306','恒大绿洲','2栋','301',5,NULL),
('1496437520735539307','恒大绿洲','2栋','302',4,NULL),
('1496437520735539308','恒大绿洲','2栋','303',4,NULL),
('1496437520735539309','恒大绿洲','2栋','304',3,NULL),
('1496437520735539310','恒大绿洲','2栋','401',2,NULL),
('1496437520735539311','恒大绿洲','2栋','402',2,NULL),
('1496437520735539312','恒大绿洲','2栋','403',6,NULL),
('1496437520735539313','恒大绿洲','2栋','404',1,NULL),
('1496437520735539314','恒大绿洲','2栋','501',4,NULL),
('1496437520735539315','恒大绿洲','2栋','502',5,NULL),
('1496437520735539316','恒大绿洲','2栋','503',2,NULL),
('1496437520735539317','恒大绿洲','2栋','504',3,NULL),
('1496437520735539318','恒大绿洲','2栋','601',5,NULL),
('1496437520735539319','恒大绿洲','2栋','602',3,NULL),
('1496437520735539320','恒大绿洲','2栋','603',4,NULL),
('1496437520735539321','恒大绿洲','2栋','604',5,NULL);

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` varchar(64) NOT NULL,
  `loginname` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`loginname`,`nickname`,`phone`,`password`) values 
('1','xiaomi','小米','18812345678','12345678'),
('2','xiaohei','小黑','18812345677','12345678'),
('3','xiaoyu','小鱼','18812345676','12345678'),
('4','xiaoxin','小新','18812345675','12345678');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` varchar(64) DEFAULT NULL,
  `title` varchar(555) DEFAULT NULL COMMENT '公告标题',
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`news_id`,`title`,`content`) values 
('1559555686462001152','测试','哈哈哈');

/*Table structure for table `resident` */

DROP TABLE IF EXISTS `resident`;

CREATE TABLE `resident` (
  `resident_id` varchar(64) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别。0：女，1：男',
  `id_card` varchar(18) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `check_in_time` date DEFAULT NULL,
  `address_id` varchar(64) DEFAULT NULL,
  `community_name` varchar(32) DEFAULT NULL,
  `building_number` varchar(32) DEFAULT NULL,
  `room_number` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态值。1：正常。2：低风险。3：中风险。4：高风险',
  PRIMARY KEY (`resident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='住户表';

/*Data for the table `resident` */

insert  into `resident`(`resident_id`,`name`,`gender`,`id_card`,`phone`,`check_in_time`,`address_id`,`community_name`,`building_number`,`room_number`,`remark`,`status`) values 
('1497039458380419072','李威',1,'456661199001011234','15012345678','2021-02-01','1496436103761235968','恒大绿洲','1栋','201','',2),
('1497040302194692096','张帅',1,'456661200012124567','15812345670','2020-02-04','1496436866013073408','恒大绿洲','1栋','202','',4),
('1497040601034657792','张伟',1,'456661199512124561','15812345671','2020-01-06','1496437187783299072','恒大绿洲','1栋','203','',2),
('1497040752386117632','王薇',0,'456661196012120124','15612345678','2020-12-07','1496437187783299072','恒大绿洲','1栋','203','',1),
('1497040923849265152','郑军',1,'456661199810107894','15712345678','2019-02-20','1496437270801158144','恒大绿洲','1栋','204','',1),
('1497041122147569664','周文',0,'456661198801021234','15212345678','2019-12-17','1496437520735539200','恒大绿洲','1栋','301','',1),
('1497041274824429568','冯章',1,'456661198612014561','17612345678','2019-12-17','1496437270801158144','恒大绿洲','1栋','204','',1),
('1497041548444045312','李明',1,'456661198602011234','16112345678','2019-10-28','1496437520735539203','恒大绿洲','1栋','304','',1),
('1497041917593128960','张维',1,'456661198705011234','17012345678','2020-01-08','1496437520735539206','恒大绿洲','1栋','403','',1);

/*Table structure for table `resident_access_record` */

DROP TABLE IF EXISTS `resident_access_record`;

CREATE TABLE `resident_access_record` (
  `record_id` varchar(64) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `access_type` tinyint(4) DEFAULT NULL COMMENT '进出类型：1：进，2：出',
  `name` varchar(64) DEFAULT NULL,
  `id_card` varchar(18) DEFAULT NULL,
  `place` varchar(64) DEFAULT NULL,
  `temperature` decimal(3,1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='住户出入登记表';

/*Data for the table `resident_access_record` */

insert  into `resident_access_record`(`record_id`,`create_time`,`access_type`,`name`,`id_card`,`place`,`temperature`,`remark`) values 
('1496711467741876224','2022-02-23 13:02:10',1,'张帅','456661200012124567','开发区',36.6,'0'),
('1496719138578632704','2022-02-24 13:30:24',1,'李威','456661199001011234','盛世豪庭',36.6,''),
('1496719334100307968','2022-02-24 13:31:11',2,'张伟','456661199512124561','北京路',36.5,''),
('1496720843445768192','2022-02-24 13:37:11',1,'王薇','456661196012120124','南京路',36.6,''),
('1496721676480679936','2022-02-24 13:40:30',1,'郑军','456661199810107894','上海路',36.6,''),
('1496721834048098304','2022-02-24 13:41:07',2,'周文','456661198801021234','沃尔玛',36.4,''),
('1496722178626949120','2022-02-24 13:42:29',2,'冯章','456661198612014561','一中',37.0,''),
('1496722680831938560','2022-02-24 13:44:29',2,'李明','456661198602011234','三小',37.1,''),
('1496722945173753856','2022-02-24 13:45:32',1,'张维','456661198705011234','汽车站',36.8,''),
('1496723249579560960','2022-02-24 13:46:45',2,'陈超','456661198612120141','中心幼儿园',36.9,''),
('1496723905434488832','2022-02-24 13:49:21',2,'赵宇','456661199802143456','天津路',36.9,''),
('1499595309515411456','2022-03-04 11:59:17',1,'测试','456661199001011234','二中',36.6,'');

/*Table structure for table `returnees` */

DROP TABLE IF EXISTS `returnees`;

CREATE TABLE `returnees` (
  `returnees_id` varchar(64) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `id_card` varchar(18) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `temperature` decimal(3,1) DEFAULT NULL,
  `return_time` date DEFAULT NULL,
  `from_place` varchar(64) DEFAULT NULL,
  `address_id` varchar(64) DEFAULT NULL,
  `community_name` varchar(32) DEFAULT NULL,
  `building_number` varchar(32) DEFAULT NULL,
  `room_number` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态值。1：正常。2：低风险。3：中风险。4：高风险',
  PRIMARY KEY (`returnees_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='返乡人员表';

/*Data for the table `returnees` */

insert  into `returnees`(`returnees_id`,`name`,`gender`,`id_card`,`phone`,`temperature`,`return_time`,`from_place`,`address_id`,`community_name`,`building_number`,`room_number`,`remark`,`status`) values 
('1497047053916835840','陈超',1,'456661198612120141','13912345670',36.6,'2022-01-19','2022-02-25','1496436103761235968','恒大绿洲','1栋','201','',1),
('1497047523766964224','赵宇',1,'456661199802143456','18012345678',36.6,'2022-01-12','东莞','1496437187783299072','恒大绿洲','1栋','203','',1),
('1497048298421358592','钱武',1,'456661199812230123','13912345679',36.6,'2022-01-06','中山','1496437187783299072','恒大绿洲','1栋','203','',2),
('1497048561790095360','林烨',1,'456661199512021234','13912345672',36.9,'2022-01-20','浙江温州','1496437520735539205','恒大绿洲','1栋','402','',1),
('1497048824181559296','赵信',1,'456661199605051234','13987456321',36.8,'2022-01-20','上海松江','1496437520735539308','恒大绿洲','2栋','303','',1),
('1497049084261961728','赵盼',0,'456661196812301234','13912345676',36.8,'2022-01-28','广东惠州','1496437520735539305','恒大绿洲','2栋','204','',1);

/*Table structure for table `visitor_access_record` */

DROP TABLE IF EXISTS `visitor_access_record`;

CREATE TABLE `visitor_access_record` (
  `record_id` varchar(64) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `access_type` tinyint(4) DEFAULT NULL COMMENT '进出类型：1：进，2：出',
  `name` varchar(64) DEFAULT NULL,
  `id_card` varchar(18) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address_id` varchar(64) DEFAULT NULL,
  `community_name` varchar(32) DEFAULT NULL,
  `building_number` varchar(32) DEFAULT NULL,
  `room_number` varchar(32) DEFAULT NULL,
  `from_place` varchar(255) DEFAULT NULL COMMENT '访客从什么地方来',
  `temperature` decimal(3,1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访客出入登记表';

/*Data for the table `visitor_access_record` */

insert  into `visitor_access_record`(`record_id`,`create_time`,`access_type`,`name`,`id_card`,`phone`,`address_id`,`community_name`,`building_number`,`room_number`,`from_place`,`temperature`,`remark`) values 
('1497055160457891840','2022-02-25 00:00:00',1,'刘备','456661198610121234','13932145678','1496437520735539205','恒大绿洲','1栋','402','解放路',36.9,''),
('1497056302277464064','2022-02-25 11:50:11',2,'孔明','456661199712230123','13996325874','1496437520735539303','恒大绿洲','2栋','202','中山路',36.6,''),
('1497056674161233920','2022-02-25 11:51:39',1,'关羽','456661196612200258','13812345670','1496437520735539309','恒大绿洲','2栋','304','一中',35.6,''),
('1497056836392718336','2022-02-25 11:52:18',1,'张飞','456661199806051234','13812345600','1496437520735539302','恒大绿洲','2栋','201','一小',36.9,''),
('1497057090320076800','2022-02-25 11:53:18',2,'赵云','456661198811220011','13812345611','1496437520735539209','恒大绿洲','1栋','502','农贸市场',36.3,''),
('1497057254917148672','2022-02-25 11:53:58',2,'黄忠','456661198605021234','13812345665','1496437520735539317','恒大绿洲','2栋','504','旧货市场',36.8,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
