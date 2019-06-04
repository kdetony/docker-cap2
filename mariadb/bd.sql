DROP TABLE IF EXISTS `baby_names`;

CREATE TABLE `baby_names` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
