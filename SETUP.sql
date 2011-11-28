CREATE TABLE `nikon-canon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` bigint(255) NOT NULL,
  `brand` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `view_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `photo_id` (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `nikon-canon-comparisons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nikon_photo_id` bigint(255) NOT NULL,
  `canon_photo_id` bigint(255) NOT NULL,
  `winner` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;