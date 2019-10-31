/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.3.15-MariaDB : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hospital`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add clinics',7,'add_clinics'),(26,'Can change clinics',7,'change_clinics'),(27,'Can delete clinics',7,'delete_clinics'),(28,'Can view clinics',7,'view_clinics'),(29,'Can add booking',8,'add_booking'),(30,'Can change booking',8,'change_booking'),(31,'Can delete booking',8,'delete_booking'),(32,'Can view booking',8,'view_booking');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$150000$9pKhSZOfmKVM$BQiZhjHxuhUJugWNw3svN/VHDIclXeC3o5kx1ah2TJQ=','2019-10-30 05:52:07.228407',1,'admin','','','admin@test.com',1,1,'2019-10-30 03:16:09.602991');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `clinics_booking` */

DROP TABLE IF EXISTS `clinics_booking`;

CREATE TABLE `clinics_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dateTime` varchar(20) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `clinics_booking` */

insert  into `clinics_booking`(`id`,`fname`,`lname`,`email`,`dateTime`,`clinic_id`,`created_at`,`updated_at`,`birthday`,`phone`) values (29,'Test','Test','test@test','10/30/2019 12:00 AM',4,'2019-10-30 02:31:19.432725','2019-10-30 02:31:19.432725','',''),(38,'john','mark','johnmark@gmail.com','11/07/2019 11:00 AM',2,'2019-10-30 15:22:12.837138','2019-10-30 15:22:12.837138','1994-07-20','123 456 789');

/*Table structure for table `clinics_clinics` */

DROP TABLE IF EXISTS `clinics_clinics`;

CREATE TABLE `clinics_clinics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `work_time` varchar(100) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `clinics_clinics` */

insert  into `clinics_clinics`(`id`,`name`,`slug`,`address`,`phone`,`work_time`,`longitude`,`latitude`,`image`) values (1,'Griffith Medical Specialist Centre','Griffith-Medical-Specialist-Centre','115-119 Binya Street, Griffith NSW 2680','02 6910 2100','Mon-Fri 8am-5pm',-34.28398,146.04194,''),(2,'Wagga Wagga - Hardy Avenue','Wagga-Wagga-Hardy-Avenue','36 Hardy Avenue, Wagga Wagga NSW 2650','02 6932 1300','Mon-Fri 8am-5pm (late sessions for MRI) Sat 9am-1pm (excl long weekends)',-35.11928,147.35225,'images_1.jpg'),(3,'Mildura Base Hospital','Mildura-Base-Hospital','Mildura Base Hospital, Ontario Avenue, Mildura VIC 3500','03 5000 1100','Mon-Fri 8am-5:30pm',-34.19998,142.12471,'images.jpg'),(4,'Yarrawonga','Yarrawonga','33 Piper Street, Yarrawonga VIC 3730','03 5743 9200','Mon-Fri 9am-5pm',-36.0112,146.00683,'download_2.jpg'),(5,'Wangaratta (Nuclear Medicine)','Wangaratta','Cusack Street, Wangaratta VIC 3677','03 5723 3100','Mon-Fri 9am-5pm',-36.355282,146.313644,'download_3.jpg');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2019-10-30 03:57:04.677783','5','Clinics object (5)',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(2,'2019-10-30 04:01:00.637055','5','Clinics object (5)',2,'[]',7,1),(3,'2019-10-30 04:01:06.375259','5','Clinics object (5)',2,'[]',7,1),(4,'2019-10-30 04:44:44.420036','4','Clinics object (4)',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(5,'2019-10-30 05:41:24.254270','5','Clinics object (5)',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(6,'2019-10-30 05:42:41.738156','2','Clinics object (2)',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(7,'2019-10-30 05:52:27.625662','3','Clinics object (3)',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'clinics','booking'),(7,'clinics','clinics'),(5,'contenttypes','contenttype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2019-10-28 10:47:55.760338'),(2,'auth','0001_initial','2019-10-28 10:47:57.201865'),(3,'admin','0001_initial','2019-10-28 10:48:03.350141'),(4,'admin','0002_logentry_remove_auto_add','2019-10-28 10:48:04.520447'),(5,'admin','0003_logentry_add_action_flag_choices','2019-10-28 10:48:04.546407'),(6,'contenttypes','0002_remove_content_type_name','2019-10-28 10:48:05.435346'),(7,'auth','0002_alter_permission_name_max_length','2019-10-28 10:48:05.485213'),(8,'auth','0003_alter_user_email_max_length','2019-10-28 10:48:05.543087'),(9,'auth','0004_alter_user_username_opts','2019-10-28 10:48:05.574001'),(10,'auth','0005_alter_user_last_login_null','2019-10-28 10:48:06.095579'),(11,'auth','0006_require_contenttypes_0002','2019-10-28 10:48:06.117551'),(12,'auth','0007_alter_validators_add_error_messages','2019-10-28 10:48:06.148437'),(13,'auth','0008_alter_user_username_max_length','2019-10-28 10:48:06.221244'),(14,'auth','0009_alter_user_last_name_max_length','2019-10-28 10:48:06.312599'),(15,'auth','0010_alter_group_name_max_length','2019-10-28 10:48:06.370445'),(16,'auth','0011_update_proxy_permissions','2019-10-28 10:48:06.396377'),(17,'sessions','0001_initial','2019-10-28 10:48:06.553953'),(18,'clinics','0001_initial','2019-10-29 02:33:21.128473'),(19,'clinics','0002_auto_20191029_0642','2019-10-29 03:43:05.876553'),(20,'clinics','0003_booking','2019-10-29 17:05:13.402434'),(21,'clinics','0004_auto_20191029_2043','2019-10-29 17:43:25.928564'),(22,'clinics','0005_auto_20191029_2050','2019-10-29 17:50:41.293343'),(23,'clinics','0006_auto_20191029_2124','2019-10-29 18:24:07.188424'),(24,'clinics','0007_clinics_image','2019-10-30 03:51:10.029416'),(25,'clinics','0008_auto_20191030_0717','2019-10-30 04:17:38.954552'),(26,'clinics','0009_auto_20191030_1812','2019-10-30 15:12:36.382351');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('z0e913agnp8tyladd3shm5phy5tujqk8','NmQyNmNhMzdkN2JmMmNmMjlhNjBjNzk5NzUxYjIyYmFkYjQ2MzJhYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMjg4YTVmODAwOGFjNjgzOWZlNmYyYzBjZjE5Y2NhZWViZjRiMGMxIn0=','2019-11-13 05:52:07.278275');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
