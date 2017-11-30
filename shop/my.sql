/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.23-log : Database - myshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`myshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myshop`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add users',7,'add_users'),(20,'Can change users',7,'change_users'),(21,'Can delete users',7,'delete_users');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `detail` */

DROP TABLE IF EXISTS `detail`;

CREATE TABLE `detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id  主键,自增',
  `orderid` int(11) DEFAULT NULL COMMENT '订单id号 订单号的外键',
  `goodsid` int(11) DEFAULT NULL COMMENT '商品id号',
  `name` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `price` double(6,2) DEFAULT NULL COMMENT '单价',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `detail` */

insert  into `detail`(`id`,`orderid`,`goodsid`,`name`,`price`,`num`) values (34,35,1,'半袖',59.00,1),(35,36,5,'卫衣',129.00,1),(36,37,2,'婚纱',1999.00,1),(37,38,2,'婚纱',1999.00,1),(38,39,1,'半袖',59.00,1),(39,40,4,'三星511',6999.00,2),(40,41,1,'半袖',59.00,1),(41,41,5,'卫衣',129.00,1),(42,42,1,'半袖',59.00,2),(43,42,3,'耳机',99.00,1);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'myadmin','users'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2017-09-01 22:13:16.063960'),(2,'auth','0001_initial','2017-09-01 22:13:21.815000'),(3,'admin','0001_initial','2017-09-01 22:13:22.372298'),(4,'admin','0002_logentry_remove_auto_add','2017-09-01 22:13:22.435497'),(5,'contenttypes','0002_remove_content_type_name','2017-09-01 22:13:23.632899'),(6,'auth','0002_alter_permission_name_max_length','2017-09-01 22:13:23.733403'),(7,'auth','0003_alter_user_email_max_length','2017-09-01 22:13:23.787629'),(8,'auth','0004_alter_user_username_opts','2017-09-01 22:13:23.802788'),(9,'auth','0005_alter_user_last_login_null','2017-09-01 22:13:23.898444'),(10,'auth','0006_require_contenttypes_0002','2017-09-01 22:13:23.902110'),(11,'auth','0007_alter_validators_add_error_messages','2017-09-01 22:13:23.917545'),(12,'auth','0008_alter_user_username_max_length','2017-09-01 22:13:23.982241'),(13,'myadmin','0001_initial','2017-09-01 22:13:24.040119'),(14,'sessions','0001_initial','2017-09-01 22:13:24.197681');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('1my4pfk9f9xfttwvuarvytgca7bkvpu2','Mzk2OTQ3ZjM4NzE2ZDk2ZjY5ZmFiMjdhOWJhNjY1OGFmMjM1MWVhNDp7InZlcmlmeWNvZGUiOiJkNHd2IiwidXNlciI6eyJpZCI6MjksInVzZXJuYW1lIjoiMTc4MzkxNjY4NjMiLCJuYW1lIjoiXHU1Yjg5XHU1Yjg5IiwiYWRkcmVzcyI6Ilx1NmNiM1x1NTM1N1x1NzcwMVx1NWU3M1x1OTg3Nlx1NWM3MVx1NWUwMlx1NTNmNlx1NTNiZlx1OTA5M1x1Njc0ZVx1NGU2MVx1NTRjOFx1NTRjOFx1NTRjOCIsInBob25lIjoiMTY4MzkxNjY4NjMiLCJjb2RlIjoiNDY3MjEzIn0sInNob3BsaXN0Ijp7fSwiYWRtaW51c2VyIjoiXHU1NGM4XHU1NGM4In0=','2017-09-26 18:20:40.714595'),('1nwboibpwnh03mc77tphb9e5vsjb3bvc','YzhlZTY0ZTEzMjcyMWUwMWI3NjUxNTY5YzZmYzRiYTdmYzhhYjJhYTp7InZlcmlmeWNvZGUiOiJSM1VRIiwiYWRtaW51c2VyIjoiXHU2NzRlXHU1NmRiIiwic2hvcGxpc3QiOnsiMSI6eyJpZCI6MSwiZ29vZHMiOiJcdTUzNGFcdTg4OTYiLCJwaWNuYW1lIjoiMTUwNDk2Njc4OC4yNjU0MjMzLmpwZyIsInByaWNlIjo1OS4wLCJkZXNjciI6IiAgICAgIFx1NTAzY1x1NWY5N1x1NjJlNVx1NjcwOSAgICAgICAgICAgICAgIiwic3RvcmUiOjEwMCwibSI6Mn0sIjQiOnsiaWQiOjQsImdvb2RzIjoiXHU0ZTA5XHU2NjFmNTExIiwicGljbmFtZSI6IjE1MDQ1NDQyNzcuOTMxODE1Ni5qcGciLCJwcmljZSI6Njk5OS4wLCJkZXNjciI6IiAgIFx1OWFkOFx1NmUwNVx1NTBjZlx1N2QyMCxcdTk4ZGVcdTRlMDBcdTgyMmNcdTc2ODRcdTYxMWZcdTg5YzkgICAgICAgICAgICAgICAgICIsInN0b3JlIjoxMDAwLCJtIjoxfX19','2017-09-24 01:29:39.858551'),('24ei8vpnxrjc86c3fwk7546zbx8a5vla','YmFlNDkyZDVmODQwM2I0ODg2NjBiNTFlYWQ3ODE2NjYwYjkxMDE1NDp7InZlcmlmeWNvZGUiOiJjZm12In0=','2017-09-23 19:35:21.792207'),('2iip2m7xa9odr35vbzcepxnm7qbnj89z','MzE1YmYxNzVjOWUyYzExMGU4NzZlMmQ1ZmEzZDM3ZTUyYmU1ZGU1Zjp7InZlcmlmeWNvZGUiOiJjeW16Iiwic2hvcGxpc3QiOnsiOCI6eyJpZCI6OCwiZ29vZHMiOiJcdTVmYjdcdTgyOTlcdTljOWNcdTgyYjFcdTk5N2MiLCJwaWNuYW1lIjoiMTUwNTAwNzczMi45OTI5NTE5LmpwZyIsInByaWNlIjoxMDkuMCwiZGVzY3IiOiIgICAgXHU3ZWQ5XHU2NzAwXHU3MjMxXHU3Njg0XHU0ZjYwICAgICAgICAgICAgICAgICIsInN0b3JlIjoxMTE5LCJtIjoxfX19','2017-09-28 17:09:49.442587'),('2iowhmhtxl39r6lunnbmgggsh72v46c4','NGNmZTU5OTFlYjYyMmJlMjhhYTkzOGRiZWUyMzgwMTMzZTI0ODY3Yjp7InNob3BsaXN0Ijp7fSwidmVyaWZ5Y29kZSI6InZ4NDciLCJ1c2VyIjp7ImlkIjo0MiwidXNlcm5hbWUiOiIxMjMxMjMiLCJuYW1lIjoiMTIzMTIzIiwiYWRkcmVzcyI6IjEyMzEyMyIsInBob25lIjoiMTIzMTIzMTIzIiwiY29kZSI6IiJ9fQ==','2017-09-28 17:48:01.962494'),('42soxburnc3s6cdcerg1i6l3sgt2nrkc','OGM3MGFkZDU5MWEwNTcwMzkxNjljMWUwYTI3MDJiNzk4Nzg2NjU5ZDp7InNob3BsaXN0Ijp7IjEiOnsiaWQiOjEsImdvb2RzIjoiXHU1MzRhXHU4ODk2IiwicGljbmFtZSI6IjE1MDQ5NjY3ODguMjY1NDIzMy5qcGciLCJwcmljZSI6NTkuMCwiZGVzY3IiOiIgICAgICBcdTUwM2NcdTVmOTdcdTYyZTVcdTY3MDkgICAgICAgICAgICAgICIsInN0b3JlIjoxMDAsIm0iOjJ9LCIyIjp7ImlkIjoyLCJnb29kcyI6Ilx1NWE1YVx1N2ViMSIsInBpY25hbWUiOiIxNTA0OTEzMzkyLjg5NjU1MjguanBnIiwicHJpY2UiOjE5OTkuMCwiZGVzY3IiOiIgICAgIFx1OTAwMlx1NTQwOFx1NGY2MFx1NzY4NFx1OTAwOVx1NjJlOSAgICAgICAgICAgICAgIiwic3RvcmUiOjEwMDAsIm0iOjN9LCI1Ijp7ImlkIjo1LCJnb29kcyI6Ilx1NTM2Ylx1ODg2MyIsInBpY25hbWUiOiIxNTA0ODAzMDkwLjUxMzIyMzQuanBnIiwicHJpY2UiOjEyOS4wLCJkZXNjciI6Ilx1NTkyOVx1NTFiN1x1NGU4NixcdTgwMGNcdTYyMTFcdTRlMGRcdTUxYjcsXHU2MjExXHU2NzA5XHU1MzlhXHU4ODYzXHU2NzBkICAgICAgICAgICAgICAgICAgICIsInN0b3JlIjo5OTksIm0iOjF9LCI0Ijp7ImlkIjo0LCJnb29kcyI6Ilx1NGUwOVx1NjYxZjUxMSIsInBpY25hbWUiOiIxNTA0NTQ0Mjc3LjkzMTgxNTYuanBnIiwicHJpY2UiOjY5OTkuMCwiZGVzY3IiOiIgICBcdTlhZDhcdTZlMDVcdTUwY2ZcdTdkMjAsXHU5OGRlXHU0ZTAwXHU4MjJjXHU3Njg0XHU2MTFmXHU4OWM5ICAgICAgICAgICAgICAgICAiLCJzdG9yZSI6MTAwMCwibSI6MX0sIjkiOnsiaWQiOjksImdvb2RzIjoiXHU1MzRlXHU3ODU1IiwicGljbmFtZSI6IjE1MDQ1NDQ4NDAuODgyNTMxNC5qcGciLCJwcmljZSI6Mjk5OS4wLCJkZXNjciI6IiAgICAgXHU3NTU5XHU0ZTBiXHU2NzAwXHU3ZjhlXHU3Njg0XHU3N2FjXHU5NWY0ICAgICAgICAgICAgICAgIiwic3RvcmUiOjE3ODksIm0iOjF9fSwidmVyaWZ5Y29kZSI6InV4YmwiLCJ1c2VyIjoiXHU1Yjg5XHU1Yjg5In0=','2017-09-23 22:23:05.015027'),('65kg476ue1s420gg16dmsm8qmtwfmo5m','YWIxNWM0OWVhM2I1M2UwZTUwODY4NTk3M2VhZjM0ODQxYWFiY2I4ZTp7InZlcmlmeWNvZGUiOiJvZHFqIiwiYWRtaW51c2VyIjoiXHU1NGM4XHU1NGM4Iiwic2hvcGxpc3QiOnsiNCI6eyJpZCI6NCwiZ29vZHMiOiJcdTRlMDlcdTY2MWY1MTEiLCJwaWNuYW1lIjoiMTUwNDU0NDI3Ny45MzE4MTU2LmpwZyIsInByaWNlIjo2OTk5LjAsInN0b3JlIjoxMDAwLCJtIjo5fSwiOSI6eyJpZCI6OSwiZ29vZHMiOiJcdTUzNGVcdTc4NTUiLCJwaWNuYW1lIjoiMTUwNDU0NDg0MC44ODI1MzE0LmpwZyIsInByaWNlIjoyOTk5LjAsInN0b3JlIjoxNzg5LCJtIjoxfSwiMSI6eyJpZCI6MSwiZ29vZHMiOiJcdTUzNGFcdTg4OTYiLCJwaWNuYW1lIjoiMTUwNDk2Njc4OC4yNjU0MjMzLmpwZyIsInByaWNlIjo1OS4wLCJzdG9yZSI6MTAwLCJtIjoxfX19','2017-09-23 19:24:11.861760'),('6gqet2dehy77c4p8xmmyg2tcpmo64man','Yzc4OGM0ODNjOGMxZDc5ZTRiODY4MjYzZjBmZjMxNDRhYWNhMDNjOTp7InZlcmlmeWNvZGUiOiJ5Zno3IiwiYWRtaW51c2VyIjoiXHU2NzRlXHU1NmRiIiwidXNlciI6Ilx1NTRjOFx1NTRjOCJ9','2017-09-23 01:24:20.634026'),('82ujrvt1f8fuoj51xmcsiw7suk4r857f','NmM1ZDc2YjNlMDcwNTk4MjhjMzBkMWE0NDEyZGM4ZDlkOGI2ZGNjMTp7InZlcmlmeWNvZGUiOiJtc25tIiwic2hvcGxpc3QiOnsiNCI6eyJpZCI6NCwiZ29vZHMiOiJcdTRlMDlcdTY2MWY1MTEiLCJwaWNuYW1lIjoiMTUwNDU0NDI3Ny45MzE4MTU2LmpwZyIsInByaWNlIjo2OTk5LjAsImRlc2NyIjoiICAgXHU5YWQ4XHU2ZTA1XHU1MGNmXHU3ZDIwLFx1OThkZVx1NGUwMFx1ODIyY1x1NzY4NFx1NjExZlx1ODljOSAgICAgICAgICAgICAgICAgIiwic3RvcmUiOjEwMDAsIm0iOjJ9fX0=','2017-09-26 06:52:18.535997'),('93s2mkyhyulp5r4jxvyu30usk05l3f9y','OTJhMzNhMzUxODE0NDViN2MyZGNmNzY0NjQ1ZTVlODU2OGNiMjQ3ODp7InZlcmlmeWNvZGUiOiJtOXQzIiwidXNlciI6eyJpZCI6MjksInVzZXJuYW1lIjoiMTc4MzkxNjY4NjMiLCJuYW1lIjoiXHU1Yjg5XHU1Yjg5IiwiYWRkcmVzcyI6Ilx1NmNiM1x1NTM1N1x1NzcwMVx1NWU3M1x1OTg3Nlx1NWM3MVx1NWUwMlx1NTNmNlx1NTNiZlx1OTA5M1x1Njc0ZVx1NGU2MVx1NTRjOFx1NTRjOFx1NTRjOCIsInBob25lIjoiMTY4MzkxNjY4NjMiLCJjb2RlIjoiNDY3MjEzIn0sInNob3BsaXN0Ijp7IjgiOnsiaWQiOjgsImdvb2RzIjoiXHU1ZmI3XHU4Mjk5XHU5YzljXHU4MmIxXHU5OTdjIiwicGljbmFtZSI6IjE1MDUwMDc3MzIuOTkyOTUxOS5qcGciLCJwcmljZSI6MTA5LjAsImRlc2NyIjoiICAgIFx1N2VkOVx1NjcwMFx1NzIzMVx1NzY4NFx1NGY2MCAgICAgICAgICAgICAgICAiLCJzdG9yZSI6MTExOSwibSI6Mn0sIjEiOnsiaWQiOjEsImdvb2RzIjoiXHU1MzRhXHU4ODk2IiwicGljbmFtZSI6IjE1MDQ5NjY3ODguMjY1NDIzMy5qcGciLCJwcmljZSI6NTkuMCwiZGVzY3IiOiIgICAgICBcdTUwM2NcdTVmOTdcdTYyZTVcdTY3MDkgICAgICAgICAgICAgICIsInN0b3JlIjoxMDAsIm0iOjF9LCIyIjp7ImlkIjoyLCJnb29kcyI6Ilx1NWE1YVx1N2ViMSIsInBpY25hbWUiOiIxNTA1MDA3MzEwLjMwNDY0ODYuanBnIiwicHJpY2UiOjE5OTkuMCwiZGVzY3IiOiIgICAgIFx1OTAwMlx1NTQwOFx1NGY2MFx1NzY4NFx1OTAwOVx1NjJlOSAgICAgICAgICAgICAgIiwic3RvcmUiOjEwMDAsIm0iOjF9fSwib3JkZXJsaXN0Ijp7IjgiOnsiaWQiOjgsImdvb2RzIjoiXHU1ZmI3XHU4Mjk5XHU5YzljXHU4MmIxXHU5OTdjIiwicGljbmFtZSI6IjE1MDUwMDc3MzIuOTkyOTUxOS5qcGciLCJwcmljZSI6MTA5LjAsImRlc2NyIjoiICAgIFx1N2VkOVx1NjcwMFx1NzIzMVx1NzY4NFx1NGY2MCAgICAgICAgICAgICAgICAiLCJzdG9yZSI6MTExOSwibSI6Mn19LCJ0b3RhbCI6MjE4LjB9','2017-09-26 16:14:51.258484'),('94u6no9q3p7rwe40969w684ywtat4y9v','NWRkMzMwYjBiMmY0NTdkMWM3MTNjZDZjNWQ2ZDk4ZDJjMmVhMzVkNDp7InZlcmlmeWNvZGUiOiJhOHhuIiwiYWRtaW51c2VyIjoiXHU1NGM4XHU1NGM4Iiwic2hvcGxpc3QiOnt9LCJ1c2VyIjp7ImlkIjo0NCwidXNlcm5hbWUiOiJcdTRlY2VcdTUyNGRcdTYxNjIiLCJuYW1lIjoiXHU2NzRlXHU4MDZhXHU4MDZhIiwiYWRkcmVzcyI6Ilx1NmNiM1x1NTM1N1x1NzcwMVx1NWU3M1x1OTg3Nlx1NWM3MVx1NWUwMlx1NTNmNlx1NTNiZiIsInBob25lIjoiMTc4MzkxNjY4NjMiLCJjb2RlIjoiMjEzMiJ9fQ==','2017-09-28 15:22:20.698035'),('9jexpd7m0fr4tddeu37wy7ifbfagmaxq','MDc3ZGRlNWY2YjVkYzEwYTE4OTBlYWE0NWEyMDE0ODc4OGVhZDc4MDp7InZlcmlmeWNvZGUiOiJoZTU5Iiwic2hvcGxpc3QiOnt9LCJ1c2VyIjp7ImlkIjo0NCwidXNlcm5hbWUiOiJcdTRlY2VcdTUyNGRcdTYxNjIiLCJuYW1lIjoiXHU2NzRlXHU4MDZhXHU4MDZhIiwiYWRkcmVzcyI6Ilx1NmNiM1x1NTM1N1x1NzcwMVx1NWU3M1x1OTg3Nlx1NWM3MVx1NWUwMlx1NTNmNlx1NTNiZiIsInBob25lIjoiMTc4MzkxNjY4NjMiLCJjb2RlIjoiMjEzMiJ9LCJhZG1pbnVzZXIiOiJcdTU0YzhcdTU0YzgifQ==','2017-09-28 12:40:59.187792'),('c8ebm2g1mjvcz44urw3yiv1uby1ewniy','MmMxNmY2MDliNDg5ZDM2ZDg4MTU4ZTMyZTAzZjYxN2IxOGZhMDljYjp7InZlcmlmeWNvZGUiOiJONEhSIn0=','2017-09-21 23:57:29.432852'),('dc15tefzn7818evsykgia7t29n4hxfzx','OTI3MjA4MzJjMDY5YTNhZmYxN2YwNzllNmYxMTE1ODkxMGFmM2IxNjp7InZlcmlmeWNvZGUiOiJWVFpUIn0=','2017-09-21 23:36:18.071328'),('gpufym63poeqkg153nftv6igcc4q5wls','Y2ZkZmYzNDMzZGVlYzNiMzliYmY4MGI3ZjkwZDNhNDM5MDRiNDE2OTp7InZlcmlmeWNvZGUiOiJxdjJtIiwiYWRtaW51c2VyIjoiXHU1NGM4XHU1NGM4In0=','2017-09-29 14:43:24.736204'),('i1sp7b10o002iueyle00ikwc9ajxzy1a','Y2E2ZTBjZjgyZjA5N2UxMmY3NDI4NzMzOGZjOGNmYjUyNTA5MTM2Njp7InZlcmlmeWNvZGUiOiJORzAwIiwiYWRtaW51c2VyIjoiXHU2NzRlXHU1NmRiIn0=','2017-09-21 13:50:16.030139'),('id6m309ewb536svdrj3stg4yq1sagfm4','ZGNkZDYwN2E0MzQ3ZGVjNmI3OWQ4MjAxYTRkY2ZlODJmYWZkMjA2Mjp7InZlcmlmeWNvZGUiOiI5MlBSIiwiYWRtaW51c2VyIjoiXHU2NzRlXHU1NmRiIn0=','2017-09-18 20:25:07.561459'),('iys2xy3j79egwn9eb1s5s5q9dicqu9e0','Y2M0NTlkZWZiYTRhMzZlYjBhM2MyMjFmOWE4NjJkMGJlNDZjNTc5ZDp7InZlcmlmeWNvZGUiOiIzN0E2In0=','2017-09-21 23:48:44.289472'),('jacf1dfxxw6tz1keml3opvf3u6a8wkw3','MWRjNzdhNDJjNDc3NDk4NDdmMDUxM2VjYzFlZTU0M2VlMWE3ODFkNDp7InZlcmlmeWNvZGUiOiJoZHNiIn0=','2017-09-28 23:44:54.589317'),('k1n3c4m48mk22nprexhsgymk9f113vvi','YWFiNzllOTIwMTEwYzYxMWFjNzhjZDQzZDQ3M2VkNWJjMzMwOTQyYTp7InNob3BsaXN0Ijp7fSwidmVyaWZ5Y29kZSI6InVsN3YiLCJhZG1pbnVzZXIiOiJcdTU0YzhcdTU0YzgifQ==','2017-09-24 01:47:26.751799'),('kqw0w6266w28h3clmr5rql5rfv0bsjm1','ODZhOTY5OWQ4NzBlNzBmMGJkYTdiYWNiMDIyNGQwY2ZjZDNlZWJjNDp7InZlcmlmeWNvZGUiOiIybnRrIiwidXNlciI6Ilx1NTkyYVx1OTYzMyIsInNob3BsaXN0Ijp7IjIiOnsiaWQiOjIsImdvb2RzIjoiXHU1YTVhXHU3ZWIxIiwicGljbmFtZSI6IjE1MDUwMDczMTAuMzA0NjQ4Ni5qcGciLCJwcmljZSI6MTk5OS4wLCJkZXNjciI6IiAgICAgXHU5MDAyXHU1NDA4XHU0ZjYwXHU3Njg0XHU5MDA5XHU2MmU5ICAgICAgICAgICAgICAiLCJzdG9yZSI6MTAwMCwibSI6Mn0sIjQiOnsiaWQiOjQsImdvb2RzIjoiXHU0ZTA5XHU2NjFmNTExIiwicGljbmFtZSI6IjE1MDQ1NDQyNzcuOTMxODE1Ni5qcGciLCJwcmljZSI6Njk5OS4wLCJkZXNjciI6IiAgIFx1OWFkOFx1NmUwNVx1NTBjZlx1N2QyMCxcdTk4ZGVcdTRlMDBcdTgyMmNcdTc2ODRcdTYxMWZcdTg5YzkgICAgICAgICAgICAgICAgICIsInN0b3JlIjoxMDAwLCJtIjozfX19','2017-09-26 09:02:58.220697'),('mhfe0ijppqjdskqpf8jthupxgjdimkz9','NjMyMzY1YmFmMzFhMzQ0NmQ0MDJhZTQ2ODA5YzYwMzJkMTlhM2U5Njp7InZlcmlmeWNvZGUiOiJhNHkyIiwic2hvcGxpc3QiOnt9LCJhZG1pbnVzZXIiOiJcdTU0YzhcdTU0YzgiLCJ1c2VyIjp7ImlkIjo0NiwidXNlcm5hbWUiOiJcdTUzMTdcdTUzMTciLCJuYW1lIjoiXHU1ZjIwXHU1MzE3XHU1MzE3IiwiYWRkcmVzcyI6Ilx1NTczMFx1NTMzYSIsInBob25lIjoiMTc4MzkxNjY4NjMiLCJjb2RlIjoiMTIzMiJ9fQ==','2017-09-29 14:20:17.002900'),('obchn2hxp55q3qlpmuf8sagi1fu9j6mv','ZTQyOTQ1MWJhZGM3MTM3NDhhYTE5ZGQ1N2E4NzczOTIzNjQ1NjAzNDp7InZlcmlmeWNvZGUiOiI0eHY2IiwidXNlciI6Ilx1NWI4OVx1NWI4OSJ9','2017-09-23 19:39:17.164034'),('qbm56zqgrgcyfjo23ix0odn2gcrfk7vb','MTk2MjNjOTc2M2QwZjUzZjQ2NTliMzk0MTE0M2ZhZWU0NjFhYjlhMjp7InZlcmlmeWNvZGUiOiJrYWhqIiwidXNlciI6eyJpZCI6NDcsInVzZXJuYW1lIjoiNzg5IiwibmFtZSI6Ijc4OSIsImFkZHJlc3MiOiI3ODkiLCJwaG9uZSI6Ijc4OSIsImNvZGUiOiI3ODkifSwic2hvcGxpc3QiOnt9fQ==','2017-09-29 14:02:48.678981'),('s9z6n8web7wzzoas87iq3dwyj3ie2pzx','YzI2MTMwZTY5MWRiYmM3YWY4ODNlNTczM2ZlYjc2YmRkYzBlNmVmMDp7InZlcmlmeWNvZGUiOiJVRVE1IiwiYWRtaW51c2VyIjoiXHU2NzRlXHU1NmRiIiwidXNlciI6Ilx1NTRjOFx1NTRjOCJ9','2017-09-22 16:26:14.766054'),('v13ht2etih8bf0rhe4s5nypmxd7a3cy1','ZDlhMGU5NmE3MmYwOGNmNDNiZDRlYzhiNDEzODc5NjM3NzMyMGNmMzp7InZlcmlmeWNvZGUiOiJqazljIiwidXNlciI6Ilx1NTRjOFx1NTRjOCIsImFkbWludXNlciI6Ilx1Njc0ZVx1NTZkYiJ9','2017-09-22 19:23:37.568423'),('x4hz6zrn9vlnt1p2ngwk297lfa8hqn0l','OWViZWVkMzAzOWZkZmU5NTRiZDFhN2I3MGIzNGNiNGY5ZDUxOTRjODp7InZlcmlmeWNvZGUiOiI3djkyIiwic2hvcGxpc3QiOnsiMSI6eyJpZCI6MSwiZ29vZHMiOiJcdTUzNGFcdTg4OTYiLCJwaWNuYW1lIjoiMTUwNDk2Njc4OC4yNjU0MjMzLmpwZyIsInByaWNlIjo1OS4wLCJkZXNjciI6IiAgICAgIFx1NTAzY1x1NWY5N1x1NjJlNVx1NjcwOSAgICAgICAgICAgICAgIiwic3RvcmUiOjEwMCwibSI6MX19LCJ1c2VyIjp7ImlkIjo0MywidXNlcm5hbWUiOiJcdTRlY2VcdTUyNGRcdTYxNjIiLCJuYW1lIjoiXHU2NzRlXHU0ZTFiXHU0ZTFiIiwiYWRkcmVzcyI6Ilx1NmNiM1x1NTM1N1x1NzcwMSIsInBob25lIjoiMTUwNTE2MDg5MTYiLCJjb2RlIjoiIn0sIm9yZGVybGlzdCI6eyIxIjp7ImlkIjoxLCJnb29kcyI6Ilx1NTM0YVx1ODg5NiIsInBpY25hbWUiOiIxNTA0OTY2Nzg4LjI2NTQyMzMuanBnIiwicHJpY2UiOjU5LjAsImRlc2NyIjoiICAgICAgXHU1MDNjXHU1Zjk3XHU2MmU1XHU2NzA5ICAgICAgICAgICAgICAiLCJzdG9yZSI6MTAwLCJtIjoxfX0sInRvdGFsIjo1OS4wfQ==','2017-09-26 20:33:21.726588'),('xvqcd9igkra0pp1p8lougpqugsedeicn','YjMyZGY2NjA0N2Y4MTIxZjY5MmIxMjAzZGNjMmZhMWQ1NzQ2YzYxOTp7InNob3BsaXN0Ijp7IjIiOnsiaWQiOjIsImdvb2RzIjoiXHU1YTVhXHU3ZWIxIiwicGljbmFtZSI6IjE1MDUwMDczMTAuMzA0NjQ4Ni5qcGciLCJwcmljZSI6MTk5OS4wLCJkZXNjciI6IiAgICAgXHU5MDAyXHU1NDA4XHU0ZjYwXHU3Njg0XHU5MDA5XHU2MmU5ICAgICAgICAgICAgICAiLCJzdG9yZSI6MTAwMCwibSI6MTB9fSwidmVyaWZ5Y29kZSI6IjR5YnciLCJhZG1pbnVzZXIiOiJcdTU0YzhcdTU0YzgiLCJvcmRlcmxpc3QiOnsiMiI6eyJpZCI6MiwiZ29vZHMiOiJcdTVhNWFcdTdlYjEiLCJwaWNuYW1lIjoiMTUwNTAwNzMxMC4zMDQ2NDg2LmpwZyIsInByaWNlIjoxOTk5LjAsImRlc2NyIjoiICAgICBcdTkwMDJcdTU0MDhcdTRmNjBcdTc2ODRcdTkwMDlcdTYyZTkgICAgICAgICAgICAgICIsInN0b3JlIjoxMDAwLCJtIjoxMH19LCJ0b3RhbCI6MTk5OTAuMCwidXNlciI6eyJpZCI6MjksInVzZXJuYW1lIjoiMTc4MzkxNjY4NjMiLCJuYW1lIjoiXHU1Yjg5XHU1Yjg5IiwiYWRkcmVzcyI6Ilx1NmNiM1x1NTM1N1x1NzcwMVx1NWU3M1x1OTg3Nlx1NWM3MVx1NWUwMlx1NTNmNlx1NTNiZlx1OTA5M1x1Njc0ZVx1NGU2MVx1NTRjOFx1NTRjOFx1NTRjOCIsInBob25lIjoiMTY4MzkxNjY4NjMiLCJjb2RlIjoiNDY3MjEzIn19','2017-09-26 14:15:35.196149'),('yq50uo7sqbwf5yurpdpb7dphsr0ncnhe','NDg5YjY5ZDI1ZmQyYzMwZmZiNDI0OTQzZTg5NTI4OGUyODFkMjcyYTp7InZlcmlmeWNvZGUiOiJKQjlLIiwidmVyaWZ5IjoiNFFOVyIsImFkbWludXNlciI6Ilx1Njc0ZVx1NTZkYiJ9','2017-09-18 09:18:14.934925');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id 主键,自增',
  `typeid` int(11) DEFAULT NULL COMMENT '类别id  type表的id外键',
  `goods` tinytext COMMENT '商品名称',
  `company` varchar(50) DEFAULT NULL COMMENT '生产厂家',
  `descr` text COMMENT '简介',
  `price` double(6,2) DEFAULT NULL COMMENT '单价',
  `picname` varchar(255) DEFAULT NULL COMMENT '图片名',
  `state` tinyint(1) DEFAULT '1' COMMENT '状态 1:新添加,2:在售3,下架',
  `store` int(11) DEFAULT '0' COMMENT '库存量',
  `num` int(11) DEFAULT '0' COMMENT '被购买数量',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`typeid`,`goods`,`company`,`descr`,`price`,`picname`,`state`,`store`,`num`,`clicknum`,`addtime`) values (1,30,'半袖','锤子独售','      值得拥有              ',59.00,'1504966788.2654233.jpg',2,100,0,8,1504543924),(2,30,'婚纱','唯美','     适合你的选择              ',1999.00,'1505007310.3046486.jpg',1,1000,0,78,1504544001),(3,31,'耳机','锤子独售','      超重低音,还原音效              ',99.00,'1504544164.7544768.jpg',1,2000,0,3,1504544164),(4,33,'三星511','三星','   高清像素,飞一般的感觉                 ',6999.00,'1504544277.9318156.jpg',1,1000,0,1,1504544278),(5,30,'卫衣','羊城故事','天冷了,而我不冷,我有厚衣服                   ',129.00,'1505007441.900602.jpg',2,999,0,3,1504544501),(6,39,'米线','三只松鼠',' 干果选择三只松鼠                   ',59.00,'1505007704.739948.jpg',1,1500,0,0,1504544609),(7,30,'裙装','文艺男女','适合你的气质                    ',99.00,'1505007501.0480692.jpg',1,1770,0,3,1504544680),(8,38,'德芙鲜花饼','德芙旗舰店','    给最爱的你                ',109.00,'1505007732.9929519.jpg',1,1119,0,0,1504544744),(9,34,'打印机','华硕厂家','     留下最美的瞬间               ',2999.00,'1504544840.8825314.jpg',2,1789,0,0,1504544840),(10,28,'上衣','珠珠',' 秋季你最美                   ',178.00,'1505007561.1984825.jpg',1,1678,0,0,1504544947),(11,37,'自拍杆','联想',' 琉璃                   ',199.00,'1504803215.1810954.jpg',1,16709,0,0,1504545002),(12,40,'唯美','虫虫','  最美的你                  ',999.00,'1505007603.5149593.jpg',1,100,0,0,1504898688);

/*Table structure for table `myweb_users` */

DROP TABLE IF EXISTS `myweb_users`;

CREATE TABLE `myweb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `name` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `code` varchar(6) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `state` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_users` */

insert  into `myweb_users`(`id`,`username`,`name`,`password`,`sex`,`address`,`code`,`phone`,`email`,`state`,`addtime`) values (2,'12345','李哈哈','827ccb0eea8a706c4c34a16891f84e7b',1,'山上','467213','1234567890','987338473@qq.com',0,1504304023),(3,'慕','哈哈','a8700dfccaec13f07bbe2d8532b2044f',0,'地球村','467711','110789234','12@qq.com',1,1504304456);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `linkman` varchar(32) DEFAULT NULL COMMENT '联系人',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `code` char(6) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `addtime` int(11) DEFAULT NULL COMMENT '购买时间',
  `total` double(8,2) DEFAULT NULL COMMENT '总金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 0:新订单,1:已发货,2:已收货,3:无效订单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`uid`,`linkman`,`address`,`code`,`phone`,`addtime`,`total`,`status`) values (35,44,'从前慢','河南省平顶山市叶县','2132','17839166863',1505480492,59.00,1),(36,44,'从','河南省平顶山市叶县','2132','17839166863',1505481026,129.00,0),(37,44,'牛牛','河南省平顶山市叶县','2132','17839166863',1505481205,1999.00,0),(38,44,'从前慢','河南省平顶山市叶县等李乡','2132','17839166863',1505481450,1999.00,0),(39,44,'从前慢','河南省平顶山市叶县','2132','17839166863',1505482801,59.00,0),(40,47,'654','789','789','789',1505484168,13998.00,3),(41,46,'北北','地区','1232','17839166863',1505484454,188.00,3),(42,46,'满','邓李','1232','17839166863',1505485216,217.00,0);

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id 主键自增',
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT '0' COMMENT '父类id号',
  `path` varchar(255) DEFAULT NULL COMMENT '分类路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `type` */

insert  into `type`(`id`,`name`,`pid`,`path`) values (1,'服装',0,'0,'),(2,'数码',0,'0,'),(3,'食品',0,'0,'),(28,'男装',1,'0,1,'),(30,'女装',1,'0,1,'),(31,'相机',2,'0,2,'),(32,'电脑',2,'0,2,'),(33,'笔记本',32,'0,2,32,'),(34,'台式机',32,'0,2,32,'),(35,'掌上电脑',32,'0,2,32,'),(37,'联想笔记本',33,'0,2,32,33,'),(38,'甜点',3,'0,3,'),(39,'干果',3,'0,3,'),(40,'婚纱',1,'0,1,');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id 主键',
  `username` varchar(32) NOT NULL COMMENT '账号 唯一性约束',
  `name` varchar(16) NOT NULL COMMENT '真实姓名',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `code` char(6) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) NOT NULL COMMENT 'Enail',
  `state` tinyint(1) DEFAULT '1' COMMENT '状态 1:启用,2:禁用,0:后台管理员',
  `addtime` int(11) DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`name`,`password`,`sex`,`address`,`code`,`phone`,`email`,`state`,`addtime`) values (28,'5515','哈哈','00c17237d011cca999f55a43db2ce040',0,'地球村','12323','21423435566','12412423@qq.com',0,NULL),(44,'从前慢','李聪聪','2aa11975fbb30fa7d7f0c3a0e710865e',1,'河南省平顶山市叶县','2132','17839166863','13124@qq.com',1,1505252445),(45,'白云','李萧萧','2aa11975fbb30fa7d7f0c3a0e710865e',1,'北京市回龙观','13213','17839166863','98733@qq.com',1,1505444913),(46,'北北','张北北','2aa11975fbb30fa7d7f0c3a0e710865e',0,'地区','1232','17839166863','123213@qq.com',1,1505483365),(47,'789','789','68053af2923e00204c3ca7c6a3150cf7',1,'789','789','789','789@qq.com',1,1505484097);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
