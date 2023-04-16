drop database if exists community_epidemic_management_0222;
CREATE DATABASE community_epidemic_management_0222 CHARACTER SET utf8 ;
use community_epidemic_management_0222;

drop table if exists address;

drop table if exists admin;

drop table if exists resident;

drop table if exists resident_access_record;

drop table if exists returnees;

drop table if exists visitor_access_record;


CREATE TABLE `address` (
  `address_id` varchar(64) NOT NULL,
  `community_name` varchar(32) default NULL COMMENT '小区名称',
  `building_number` varchar(32) default NULL COMMENT '楼号',
  `room_number` varchar(32) default NULL COMMENT '单元号+门牌号',
  `count` tinyint(4) default NULL COMMENT '住户人数',
  PRIMARY KEY  (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地址表';


CREATE TABLE `admin` (
  `admin_id` varchar(64) NOT NULL,
  `loginname` varchar(64) default NULL,
  `nickname` varchar(64) default NULL,
  `phone` varchar(11) default NULL,
  `password` varchar(64) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';


CREATE TABLE `resident` (
  `resident_id` varchar(64) NOT NULL,
  `name` varchar(32) default NULL,
  `gender` tinyint(4) default NULL COMMENT '性别。0：女，1：男',
  `id_card` varchar(18) default NULL,
  `phone` varchar(11) default NULL,
  `check_in_time` date default NULL,
  `address_id` varchar(64) default NULL,
  `community_name` varchar(32) default NULL,
  `building_number` varchar(32) default NULL,
  `room_number` varchar(32) default NULL,
  `remark` varchar(255) default NULL,
  `status` int(11) default NULL COMMENT '状态值。1：正常。2：低风险。3：中风险。4：高风险',
  PRIMARY KEY  (`resident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='住户表';


CREATE TABLE `resident_access_record` (
  `record_id` varchar(64) NOT NULL,
  `create_time` datetime default NULL,
  `access_type` tinyint(4) default NULL COMMENT '进出类型：1：进，2：出',
  `name` varchar(64) default NULL,
  `id_card` varchar(18) default NULL,
  `place` varchar(64) default NULL,
  `temperature` decimal(3,1) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='住户出入登记表';


CREATE TABLE `returnees` (
  `returnees_id` varchar(64) NOT NULL,
  `name` varchar(32) default NULL,
  `gender` tinyint(4) default NULL,
  `id_card` varchar(18) default NULL,
  `phone` varchar(11) default NULL,
  `temperature` decimal(3,1) default NULL,
  `return_time` date default NULL,
  `from_place` varchar(64) default NULL,
  `address_id` varchar(64) default NULL,
  `community_name` varchar(32) default NULL,
  `building_number` varchar(32) default NULL,
  `room_number` varchar(32) default NULL,
  `remark` varchar(255) default NULL,
  `status` int(11) default NULL COMMENT '状态值。1：正常。2：低风险。3：中风险。4：高风险',
  PRIMARY KEY  (`returnees_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='返乡人员表';



CREATE TABLE `visitor_access_record` (
  `record_id` varchar(64) NOT NULL,
  `create_time` datetime default NULL,
  `access_type` tinyint(4) default NULL COMMENT '进出类型：1：进，2：出',
  `name` varchar(64) default NULL,
  `id_card` varchar(18) default NULL,
  `phone` varchar(11) default NULL,
  `address_id` varchar(64) default NULL,
  `community_name` varchar(32) default NULL,
  `building_number` varchar(32) default NULL,
  `room_number` varchar(32) default NULL,
  `from_place` varchar(255) default NULL COMMENT '访客从什么地方来',
  `temperature` decimal(3,1) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访客出入登记表';













