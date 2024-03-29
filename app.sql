
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_card` varchar(14) NOT NULL UNIQUE,
  `f_name` varchar(250),
  `l_name` varchar(250),
  `password` varchar(250),
  `imageuser` varchar(250),
  `phonenumber` varchar(250),
  `email` varchar(250),
  `tokenNotification` varchar(250),
  `role` ENUM('people', 'police') DEFAULT 'people',
  `station` int(10),
  
  PRIMARY KEY (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO user(`id_card`, `f_name`, `l_name`, `password`, `role`,`phonenumber`,`email`) VALUES 
(1111111111111, "user1", "user1", "User_1", 'people', "1234567891","user1@user.use"),
(2222222222222, "user2", "user2", "user_2", 'people', "1234567891","user2@user.use");

INSERT INTO user(`id_card`, `f_name`, `l_name`, `password`, `role`,`phonenumber`,`email`,`station`) VALUES 
(7777777777777, "police3", "police3", "Police_1234", 'police', "1234567891","police3@police.use",72);




DROP TABLE IF EXISTS `police_station`;
CREATE TABLE `police_station` (
  `id` int(10) AUTO_INCREMENT,
  `name` varchar(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `report_id` int(10) AUTO_INCREMENT,
  `report_type` varchar(250),
  `userid_card` varchar(14),
  `date` varchar(250),
  `status` ENUM('pending', 'inprocess','success')DEFAULT 'pending' ,
  `station` int(10) ,
  `approve_file` varchar(250),
  `police_id` varchar(250),
  PRIMARY KEY (`report_id`),
  FOREIGN KEY (`userid_card`) 
  REFERENCES `user`(`id_card`),
  FOREIGN KEY (`station`) 
  REFERENCES `police_station`(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `important_miss`;
CREATE TABLE `important_miss` (
  `id` int(10),
  `description` text,
  `missing_type` varchar(250),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `report`(`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO user(`id_card`, `f_name`, `l_name`, `password`, `role`, `station`) VALUES 
(1234567891234, "police1", "police", "Police_1234", 'police', 1),
(1234567890123, "police2", "police", "Police_1234", 'police', 2);


DROP TABLE IF EXISTS `missing_people`;
CREATE TABLE `missing_people` (
  `id` int(10),
  `missing_name` varchar(250),
  `image_people` varchar(250),
  `missing_idcard` varchar(250),
  `missing_des` varchar(250),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `report`(`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `good_people`;
CREATE TABLE `good_people` (
  `id` int(10)  AUTO_INCREMENT,
  `good_id` int(10),
  `good_peopleid` varchar(250),
  `good_des` varchar(250),
  `good_image` varchar(250),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`good_id`) REFERENCES `missing_people`(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `reportofpolice`;
CREATE TABLE `reportofpolice` (
  `id` int(10) AUTO_INCREMENT,
  `policeid_card`  varchar(14) ,
  `date` varchar(250),
  `status` ENUM('questtofind','success')DEFAULT 'questtofind' ,
  `imagetofind` varchar(250),
  `dataofpolice` varchar(250),
  `station` int(10),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`policeid_card`)   REFERENCES `user` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `peoplereport`;
CREATE TABLE `peoplereport` (
  `id` int(10) AUTO_INCREMENT,
  `peoplereport_id`  int(10),
  `date` varchar(250),
  `imagetopeople` varchar(250),
  `dataofpeople` varchar(250),
  `useeid` varchar(250),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`peoplereport_id`) 
  REFERENCES `reportofpolice`(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO police_station(`name`) VALUES
("สถานีตำรวจนครบาลโคกคราม"),
("สถานีตำรวจนครบาลมีนบุรี"),
("สถานีตำรวจนครบาลเตาปูน"),
("สถานีตำรวจนครบาลบางโพ"),
("สถานีตำรวจนครบาลบางชัน"),
("สถานีตำรวจนครบาลสุทธิสาร"),
("สถานีตำรวจนครบาลบางซื่อ"),
("สถานีตำรวจนครบาลบึงกุ่ม"),
("สถานีตำรวจนครบาลสามเสน"),
("สถานีตำรวจนครบาลตลิ่งชัน"),
("สถานีตำรวจนครบาลห้วยขวาง"),
("สถานีตำรวจนครบาลดุสิต"),
("สถานีตำรวจนครบาลบวรมงคล"),
('สถานีตำรวจนครบาลดินแดง'),
('สถานีตำรวจนครบาลวังทองหลาง'),
("สถานีตำรวจนครบาลลาดพร้าว"),
('สถานีตำรวจนครบาลบางยี่ขัน'),
('สถานีตำรวจนครบาลร่มเกล้า'),
('สถานีตำรวจนครบาลหัวหมาก'),
('สถานีตำรวจนครบาลชนะสงคราม'),
('สถานีตำรวจนครบาลบางกอกน้อย'),
('สถานีตำรวจนครบาลพญาไท'),
('สถานีตำรวจนครบาลนางเลิ้ง'),
('สถานีตำรวจนครบาลบางขุนนนท์'),
('สถานีตำรวจนครบาลฉลองกรุง'),
('สถานีตำรวจนครบาลสำราญราษฎร์'),
('สถานีตำรวจนครบาลมักกะสัน'),
("สถานีตำรวจนครบาลพลับพลาไชย 1"),
("สถานีตำรวจนครบาลพระราชวัง"),
("สถานีตำรวจนครบาลบางเสาธง"),
('สถานีตำรวจนครบาลบางกอกใหญ่'),
('สถานีตำรวจนครบาลคลองตัน'),
('สถานีตำรวจนครบาลจักรวรรดิ์'),
('สถานีตำรวจนครบาลทองหล่อ'),
('สถานีตำรวจนครบาลบุปผาราม'),
('สถานีตำรวจนครบาลท่าพระ'),
("สถานีตำรวจนครบาลลุมพินี"),
('สถานีตำรวจนครบาลสมเด็จเจ้าพระย'),
('สถานีตำรวจนครบาลบางรัก'),
('สถานีตำรวจนครบาลบางยี่เรือ'),
('สถานีตำรวจนครบาลประเวศ'),
('สถานีตำรวจนครบาลสำเหร่'),
('สถานีตำรวจนครบาลตลาดพลู'),
('สถานีตำรวจนครบาลยานนาวา'),
('สถานีตำรวจนครบาลทุ่งมหาเมฆ'),
('สถานีตำรวจนครบาลบางโพงพาง'),
('สถานีตำรวจนครบาลภาษีเจริญ'),
('สถานีตำรวจนครบาลวัดพระยาไกร'),
('สถานีตำรวจนครบาลบุคคโล'),
('สถานีตำรวจนครบาลบางคอแหลม'),
('สถานีตำรวจนครบาลราษฎร์บูรณะ'),
('สถานีตำรวจนครบาลท่าข้าม'),
('สถานีตำรวจนครบาลทุ่งครุ'),
('สถานีตำรวจนครบาลเทียนทะเล'),
('สถานีตำรวจนครบาลสายไหม'),
("สถานีตำรวจนครบาลบางเขน"),
('สถานีตำรวจนครบาลพหลโยธิน'),
('สถานีตำรวจนครบาลบางมด'),
('สถานีตำรวจนครบาลบางขุนเทียน'),
('สถานีตำรวจนครบาลบางบอน'),
('สถานีตำรวจนครบาลหลักสอง'),
('สถานีตำรวจนครบาลเพชรเกษม'),
('สถานีตำรวจนครบาลหนองแขม'),
('สถานีตำรวจนครบาลศาลาแดง'),
('สถานีตำรวจนครบาลหนองค้างพลู'),
('สถานีตำรวจนครบาลลำหิน'),
('สถานีตำรวจนครบาลหนองจอก'),
('สถานีตำรวจนครบาลดอนเมือง'),
('สถานีตำรวจนครบาลทุ่งสองห้อง'),
('สถานีตำรวจนครบาลบางพลัด'),
('สถานีตำรวจนครบาลลาดกระบัง'),
('สถานีตำรวจนครบาลบางนา'),
('สถานีตำรวจนครบาลพระโขนง'),
('สถานีตำรวจนครบาลอุดมสุข'),
('สถานีตำรวจนครบาลธรรมศาลา'),
('สถานีตำรวจนครบาลคันนายาว'),
('สถานีตำรวจนครบาลนิมิตรใหม่'),
('สถานีตำรวจนครบาลโชคชัย'),
('สถานีตำรวจนครบาลแสมดำ'),
('สถานีตำรวจนครบาลท่าเรือ'),
('สถานีตำรวจนครบาลลำผักชี'),
('สถานีตำรวจนครบาลประชาชื่น'),
('สถานีตำรวจนครบาลปากคลองสาน'),
('สถานีตำรวจนครบาลสุวินทวงศ์'),
('สถานีตำรวจนครบาลปทุมวัน'),
('สถานีตำรวจนครบาลจรเข้น้อย'),
('สถานีตำรวจนครบาลประชาสำราญ'),
('สถานีตำรวจนครบาลพลับพลาไชย 2');

