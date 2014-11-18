CREATE TABLE `adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `createTime` datetime NOT NULL,
  `flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE `user_role` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `FK_user_role` (`user_id`),
  KEY `FK_user_role2` (`role_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`user_id`) REFERENCES `adminuser` (`id`),
  CONSTRAINT `FK_user_role2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
)

CREATE TABLE `role_resource` (
  `role_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  KEY `FK_role_resource` (`role_id`),
  KEY `FK_role_resource2` (`resource_id`),
  CONSTRAINT `FK_role_resource` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_role_resource2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
)