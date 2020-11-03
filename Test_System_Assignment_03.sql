CREATE TABLE RAILWAY_06;
USE RAILWAY_06;				

CREATE TABLE `department` (					
	department_id	 TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	department_name	 NVARCHAR(255)
	);				

DROP TABLE IF EXISTS `position`;					
CREATE TABLE `position`(					
	position_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 		
	position_name	NVARCHAR(255)	
	);				
    
DROP TABLE IF EXISTS account;					
CREATE TABLE `account`(					
	account_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,		
	email		    VARCHAR(255) UNIQUE KEY NOT NULL,		
	username		CHAR(50),		
	full_name		NVARCHAR(255),		
	department_id	TINYINT UNSIGNED,	
	FOREIGN KEY (department_id) REFERENCES department (department_id),
	position_id		TINYINT UNSIGNED,
    FOREIGN KEY (position_id) REFERENCES position (position_id),
	create_date		DATE
	);				

DROP TABLE IF EXISTS `group`;					
CREATE TABLE `group`(					
	group_id		TINYINT UNSIGNED AUTO_INCREMENT,		
	group_name		NVARCHAR(255),		
	creator_id		TINYINT UNSIGNED,
    PRIMARY KEY (group_id, creator_id),
	create_date		DATE		
	);				
    
DROP TABLE IF EXISTS `group_account`;					
CREATE TABLE `group_account`(					
	group_id		TINYINT UNSIGNED,	
    FOREIGN KEY (group_id) REFERENCES `group` (group_id),
	account_id		TINYINT UNSIGNED,	
	FOREIGN KEY (account_id) REFERENCES `account` (account_id),
	join_date		DATE		
	);

DROP TABLE IF EXISTS `type_question`;					
CREATE TABLE `type_question`(					
	type_id		    TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	type_name		ENUM('Essay','Multiple-Choice')		
	);				
    
DROP TABLE IF EXISTS `category_question`;					
CREATE TABLE `category_question`(					
	category_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,	
	category_name	NVARCHAR(255)		
	);				
    
DROP TABLE IF EXISTS `question`;	
CREATE TABLE `question` (
	question_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content			TEXT,
    category_id		TINYINT UNSIGNED,
    FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    type_id			TINYINT UNSIGNED,
    FOREIGN KEY (type_id) REFERENCES type_question (type_id),
    creator_id		TINYINT UNSIGNED,
    FOREIGN KEY (creator_id) REFERENCES `account` (account_id),
    create_date		DATE
);

DROP TABLE IF EXISTS `answer`;	
CREATE TABLE `answer` (
	answer_id	 	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content			TEXT,
    question_id		TINYINT UNSIGNED,
    FOREIGN KEY (question_id) REFERENCES question (question_id),
    is_correct		ENUM('True','False')
);

DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
	exam_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`			TINYINT UNSIGNED UNIQUE KEY NOT NULL,
    title			NVARCHAR(250),
    category_id		TINYINT UNSIGNED,
    duration		TINYINT UNSIGNED,
    creator_id		TINYINT UNSIGNED,
    create_date		DATE,
    FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question` (
	exam_id			TINYINT UNSIGNED,
    question_id		TINYINT UNSIGNED,
    FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
    FOREIGN KEY (question_id) REFERENCES question (question_id)
);

INSERT INTO `department`(department_id, department_name)
VALUES 		(1, N'Business Development'),
			(2, N'Division 5'),
			(3, N'Division 1'),
			(4, N'Division 2'),
			(5, N'Division 9'),
			(6, N'Board of Director'),
			(7, N'VTI Cloud'),
			(8, N'Human Resources Department'),
			(9, N'Sale'),
			(10, N'Comtor Department');

INSERT INTO `position`(position_id, position_name)
VALUES		(1, N'Department Leader'),
			(2, N'Project Manager'),
			(3, N'IT Quality Assurance'),
			(4, N'Tester'),
			(5, N'IT Business Analyst'),
			(6, N'PHP Developer'),
			(7, N'Android Developer'),
			(8, N'iOS Developer'),
			(9, N'Solution Architect'),
			(10, N'Java Developer');
        
INSERT INTO `group`(group_id,group_name,creator_id,create_date)
VALUES 		(1,N'AI group',1,20190101),
			(2,N'Transportation group',2,20190202),
            (3,N'Logistics group',3,20190303),
            (4,N'Finance group',4,20190404),
            (5,N'Data management group',5,20190505),
            (6,N'Risk management group',6,20190606),
            (7,N'Business developement group',7,20200703),
            (8,N'Amazon Web Services group',8,20201212),
            (9,N'BrSE group',9,20201013),
            (10,N'Sales group',10,20190909);
    
INSERT INTO `account`(account_id,email,username,full_name,department_id,position_id,create_date)
VALUES 		(1,N'nrpham.17@gmail.com',N'ngoc.pb',N'Pham Bich Ngoc',1,3,20200808),
			(2,N'thang.nc@gmail.com',N'thang.nc',N'Nguyen Cong Thang',2,6,20190712),
			(3,N'toan.nh@gmail.com',N'toan.nh',N'Ngo Huu Toan',1,7,20200808),
			(4,N'chien.hm@gmail.com',N'chien.hm',N'Hoang Minh Chien',8,9,20201208),
			(5,N'cong.tq@gmail.com',N'cong.tq',N'To Quang Cong',6,4,20190101),
			(6,N'huy.ng@gmail.com',N'huy.ng',N'Nguyen Huy',2,8,20200812),
			(7,N'anh.dtn@gmail.com',N'anh.dtn',N'Doan Ngoc Anh',10,1,20200908),
			(8,N'nam.lt@gmail.com',N'nam.lt',N'Nam Luong',9,1,20201201),
			(9,N'nhung.nth@gmail.com',N'nhung.nth',N'Nhung Nguyen',4,6,20190808),
			(10,N'tung.nt@gmail.com',N'tung.nt',N'Tung Nguyen',3,8,20170808);
    
INSERT INTO `group_account`(group_id,account_id,join_date)
VALUES 		(1,3,20201201),
			(2,5,20201101),
            (3,9,20201010),
            (4,6,20190807),
            (5,2,20190309),
            (6,4,20190607),
            (7,7,20200812),
            (8,5,20200405),
            (9,10,20201107),
            (10,1,20180707);
            
INSERT INTO `category_question`(category_id,category_name)
VALUES 		(1,N'Java'),
			(2,N'.Net'),
            (3,N'SQL'),
            (4,N'Postman'),
            (5,N'Java'),
            (6,N'Frontend'),
            (7,N'Ruby'),
            (8,N'Management'),
            (9,N'AWS'),
            (10,N'Automation Test');

INSERT INTO `question` (question_id,content,create_date)
VALUES 		(1,N'Câu hỏi 1: content A', 20200812),
			(2,N'Content 2', 20190816),
            (3,N'Content 3', 20191108),
            (4,N'Content 4', 20201207),
            (5,N'Câu hỏi 5: content B', 20201003),
            (6,N'Content 6', 20190826),
            (7,N'Content 7', 20180721),
            (8,N'Content 8', 20110703),
            (9,N'Câu hỏi 9: content C', 20200528),
            (10,N'Content 10', 20170715);
            
            
INSERT INTO `answer`(answer_id, content, is_correct)
VALUES 		(1, N'Answer content 1', N'True'),
			(2, N'Answer content 2', N'False');

INSERT INTO `exam`(exam_id, `code`, title, duration, create_date)
VALUES 		(1,1, N'Title Exam 1',70,20200812),
			(2,2, N'Title Exam 2',90,20191108),
			(3,3, N'Title Exam 3',30,20191109),
            (4,4, N'Title Exam 4',15,20191110),
            (5,5, N'Title Exam 5',20,20191209),
            (6,6, N'Title Exam 6',100,20200803),
            (7,7, N'Title Exam 7',05,20190703),
            (8,8, N'Title Exam 8',60,20200701),
            (9,9, N'Title Exam 9',75,20191226),
            (10,10, N'Title Exam 10',120,20190925);
    
-- Q2 --
SELECT * FROM department;

-- Q3 --
SELECT department_id FROM department WHERE department_name = N'Sale';

-- Q6 --
SELECT group_name FROM `group` WHERE create_date <= 20191220;

-- Q7 --
SELECT question_id FROM `answer` GROUP BY question_id HAVING COUNT(question_id)>=4;

-- Q8 --
SELECT exam_id FROM exam WHERE duration >= 60 && create_date <= 20191220;

-- Q9 --
SELECT * FROM `group` ORDER BY create_date DESC LIMIT 5;

-- Q10 --
SELECT COUNT(account_id) from `account` WHERE department_id = 2;

-- Q11 --
SELECT * FROM `account`  WHERE full_name LIKE 'D%' OR full_name LIKE '%o';

-- Q12 --
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM `exam` WHERE create_date < 20191220;
SET FOREIGN_KEY_CHECKS=1;

-- Q13 --
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM `question` WHERE content LIKE N'Câu hỏi%';
SET FOREIGN_KEY_CHECKS=1;

-- Q14 --
UPDATE `account` SET full_name = N'Nguyen Ba Loc', email = N'loc.nguyenba@vti.com.vn' WHERE account_id = 5;
SELECT * FROM `account` WHERE account_id=5;

-- Q15 --
SET FOREIGN_KEY_CHECKS=0;
UPDATE `account` SET group_id = 4 WHERE account_id = 5;
SET FOREIGN_KEY_CHECKS=1;

