-- SQL used to created required tables;

CREATE DATABASE `dbbike`;

USE `dbbike`;

CREATE TABLE `station` (
  `sid` int(11) NOT NULL COMMENT 'the number of station unique',
  `station_name` varchar(40) DEFAULT NULL,
  `station_address` varchar(50) DEFAULT NULL COMMENT 'address',
  `lat` float(10,6) DEFAULT NULL COMMENT 'latitude',
  `lng` float(10,6) DEFAULT NULL COMMENT 'longitude',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `availability` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `station_id` int(11) DEFAULT NULL COMMENT 'foreign key from table station' ,
  `bike_stands` int(11) DEFAULT NULL COMMENT 'all stands',
  `ava_bikes` int(11) DEFAULT NULL COMMENT 'available bikes',
  `ava_stands` int(11) DEFAULT NULL COMMENT 'available stands',
  `status` ENUM('OPEN','CLOSED') DEFAULT 'OPEN',
  `last_update` timestamp DEFAULT NULL COMMENT 'data update time in API',
  /*`modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'last modify time',*/
  PRIMARY KEY (`aid`),
  KEY `station_id_idx` (`station_id`),
  CONSTRAINT `station_id` FOREIGN KEY (`station_id`) REFERENCES `station` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6000000 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `weather` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wstation_id` int(11) DEFAULT NULL COMMENT 'foreign key from table station sid',
  `weather_id` int(11) DEFAULT NULL COMMENT '3-digit id describe main weather',
  `temp` float(5,2) DEFAULT NULL COMMENT  'Celsius temperature',
  `feels_like` float(5,2) DEFAULT NULL COMMENT  'feels-like temperature in Celsius',
  `temp_min` float(5,2) DEFAULT NULL COMMENT  'Celsius temperature',
  `temp_max` float(5,2) DEFAULT NULL COMMENT  'Celsius temperature',
  `pressure` int(10) DEFAULT NULL COMMENT 'atm pressure,hPa',
  `humidity` int(10) DEFAULT NULL COMMENT 'humidity, %',
  `wind_speed` float(5,2) DEFAULT NULL COMMENT 'wind speed, m/s',
  `wind_deg` int(10) DEFAULT NULL COMMENT 'wind direction, degrees(meteorological)',
  `clouds` int(10) DEFAULT NULL COMMENT 'cloudiness, %',
  `rain_1h` float(5,2) DEFAULT NULL COMMENT 'rain volume for the last 1 hour, mm',
  `rain_3h` float(5,2) DEFAULT NULL COMMENT 'rain volume for the last 3 hour, mm',
  `snow_1h` float(5,2) DEFAULT NULL COMMENT 'snow volume for the last 1 hour, mm',
  `snow_3h` float(5,2) DEFAULT NULL COMMENT 'snow volume for the last 3 hour, mm',
  `update_time`timestamp DEFAULT NULL COMMENT 'data update time in API',
  PRIMARY KEY (`wid`),
    KEY `wstation_id_idx` (`wstation_id`),
  CONSTRAINT `wstation_id` FOREIGN KEY (`wstation_id`) REFERENCES `station` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3000000 DEFAULT CHARSET=utf8mb4;

