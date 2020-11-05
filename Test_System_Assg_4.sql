
USE RAILWAY_06_04;				

DROP TABLE IF EXISTS `department`;	
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

INSERT INTO `department`(department_id, department_name) VALUES 
			(1, N'Business Development'),
			(2, N'Division 5'),
			(3, N'Division 1'),
			(4, N'Division 2'),
			(5, N'Division 9'),
			(6, N'Board of Director'),
			(7, N'VTI Cloud'),
			(8, N'Human Resources Department'),
			(9, N'Sale'),
			(10, N'Comtor Department');

INSERT INTO `position`(position_id, position_name) VALUES 
			(1, N'Department Leader'),
			(2, N'Project Manager'),
			(3, N'IT Quality Assurance'),
			(4, N'Tester'),
			(5, N'IT Business Analyst'),
			(6, N'PHP Developer'),
			(7, N'Android Developer'),
			(8, N'iOS Developer'),
			(9, N'Solution Architect'),
			(10, N'Java Developer');
        
INSERT INTO `group`(group_id,group_name,creator_id,create_date) VALUES 
			(1,N'AI group',1,20190101),
			(2,N'Transportation group',2,20190202),
            (3,N'Logistics group',3,20190303),
            (4,N'Finance group',4,20190404),
            (5,N'Data management group',5,20190505),
            (6,N'Risk management group',6,20190606),
            (7,N'Business developement group',7,20200703),
            (8,N'Amazon Web Services group',8,20201212),
            (9,N'BrSE group',9,20201013),
            (10,N'Sales group',10,20190909);
    
INSERT INTO `account`(account_id,email,username,full_name,department_id,position_id,create_date) VALUES 		
			(1,N'nrpham.17@gmail.com',N'ngoc.pb',N'Pham Bich Ngoc',1,3,20200808),
			(2,N'thang.nc@gmail.com',N'thang.nc',N'Nguyen Cong Thang',2,6,20190712),
			(3,N'toan.nh@gmail.com',N'toan.nh',N'Ngo Huu Toan',1,7,20200808),
			(4,N'chien.hm@gmail.com',N'chien.hm',N'Hoang Minh Chien',8,9,20201208),
			(5,N'cong.tq@gmail.com',N'cong.tq',N'To Quang Cong',6,4,20190101),
			(6,N'huy.ng@gmail.com',N'huy.ng',N'Nguyen Huy',2,8,20200812),
			(7,N'anh.dtn@gmail.com',N'anh.dtn',N'Doan Ngoc Anh',10,1,20200908),
			(8,N'nam.lt@gmail.com',N'nam.lt',N'Nam Luong',9,1,20201201),
			(9,N'nhung.nth@gmail.com',N'nhung.nth',N'Nhung Nguyen',4,6,20190808),
			(10,N'tung.nt@gmail.com',N'tung.nt',N'Tung Nguyen',3,8,20170808),
            (11,N'khoi@gmail.com',N'khoi',N'Khoi',1,1,20170808),
            (12,N'le.cam@gmail.com',N'le.cam',N'Cam Le',1,1,20170808);
    
INSERT INTO `group_account`(group_id,account_id,join_date) VALUES 		
			(1,3,20201201),
            (2,3,20201201),
			(1,5,20201101),
            (1,9,20201010),
            (4,6,20190807),
            (5,2,20190309),
            (2,4,20190607),
            (2,7,20200812),
            (8,5,20200405),
            (9,10,20201107),
            (10,1,20180707);
            
INSERT INTO `category_question`(category_id,category_name) VALUES 		
			(1,N'Java'),
			(2,N'.Net'),
            (3,N'SQL'),
            (4,N'Postman'),
            (5,N'Java'),
            (6,N'Frontend'),
            (7,N'Ruby'),
            (8,N'Management'),
            (9,N'AWS'),
            (10,N'Automation Test');

INSERT INTO `question` (question_id,content,create_date) VALUES 		
			(1,N'Câu hỏi 1: content A', 20200812),
			(2,N'Content 2', 20190816),
            (3,N'Content 3', 20191108),
            (4,N'Content 4', 20201207),
            (5,N'Câu hỏi 5: content B', 20201003),
            (6,N'Content 6', 20190826),
            (7,N'Content 7', 20180721),
            (8,N'Content 8', 20110703),
            (9,N'Câu hỏi 9: content C', 20200528),
            (10,N'Content 10', 20170715);
            
            
INSERT INTO `answer`(answer_id, content, is_correct) VALUES 		
			(1, N'Answer content 1', N'True'),
			(2, N'Answer content 2', N'False');

-- Add data Exam
INSERT INTO `exam`(exam_id, `code`, title, duration, create_date, creator_id) VALUES 		
			(1,1, N'Title Exam 1',70,20200812,5),
			(2,2, N'Title Exam 2',90,20191108,1),
			(3,3, N'Title Exam 3',30,20191109,3),
            (4,4, N'Title Exam 4',15,20191110,9),
            (5,5, N'Title Exam 5',20,20191209,8),
            (6,6, N'Title Exam 6',100,20200803,2),
            (7,7, N'Title Exam 7',05,20190703,1),
            (8,8, N'Title Exam 8',60,20200701,11),
            (9,9, N'Title Exam 9',75,20191226,10),
            (10,10, N'Title Exam 10',120,20190925,4);
                    
-- Add data ExamQuestion
INSERT INTO exam_question (exam_id	, question_id	) 
VALUES 						(	1	,		5		),
							(	2	,		10		), 
							(	3	,		4		), 
							(	4	,		3		), 
							(	5	,		7		), 
							(	6	,		10		), 
							(	7	,		2		), 
							(	8	,		10		), 
							(	9	,		9		), 
							(	10	,		8		); 


-- Q1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM `account` a
LEFT JOIN department d USING (department_id);

-- Dap an Q2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `account` a
WHERE create_date >= 20201220;

-- Q3: Viết lệnh để lấy ra tất cả các developer
SELECT * 
FROM `account` a
JOIN position p USING (position_id)
WHERE p.position_name LIKE N'%developer%';

-- Q4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT *,COUNT(*)
FROM department d
LEFT JOIN `account` a  ON d.department_id = a.department_id
GROUP BY d.department_id 
HAVING COUNT(*) > 3;

-- Q5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT *,COUNT(*)
FROM question q
JOIN exam_question eq ON q.question_id = eq.question_id
GROUP BY eq.question_id
ORDER BY COUNT(*) DESC;

-- Q6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT *
FROM category_question cq
LEFT JOIN question q ON cq.category_id = q.category_id;

-- Q7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT *
FROM question q
LEFT JOIN exam_question e ON q.question_id = e.question_id; 

-- Q8: Lấy ra Question có nhiều câu trả lời nhất
SELECT *, COUNT(*)
FROM question q
LEFT JOIN answer a ON q.question_id = a.question_id
ORDER BY COUNT(*) DESC;

-- Q9: Thống kê số lượng account trong mỗi group
SELECT g.group_id, COUNT(g.account_id) AS so_luong_account
FROM `account` a
LEFT JOIN `group_account` g ON a.account_id = g.account_id
GROUP BY g.group_id;

-- Q10: Tìm chức vụ có ít người nhất
SELECT a.position_id, COUNT(a.position_id)
FROM position p
LEFT JOIN `account` a ON p.position_id = a.position_id
GROUP BY a.position_id
ORDER BY COUNT(a.position_id) DESC
LIMIT 1;

-- Q11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

-- Q12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

-- Q13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

-- Q14,15: Lấy ra group không có account nào
SELECT *
FROM `group` g
LEFT JOIN `group_account` a ON g.group_id = a.group_id
WHERE a.account_id = NULL;

-- Q16: Lấy ra question không có answer nào
SELECT *
FROM question q
LEFT JOIN `answer` a ON q.question_id = a.question_id
WHERE a.answer_id = NULL;

-- ==== Dap an Q17 ==== --
-- nhom thu 1: group = 01
SELECT account.*
FROM account 
JOIN group_account USING (account_id)
WHERE group_id = 1 
UNION
SELECT account.*
FROM account 
JOIN group_account USING (account_id)
WHERE group_id = 2;


-- Q18: 
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT *, COUNT(a.group_id) AS so_luong_mem
FROM `group` g
JOIN `group_account` a ON g.group_id = a.group_id
GROUP BY a.group_id
HAVING COUNT(a.group_id) >= 5;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT *, COUNT(a.group_id) AS so_luong_mem
FROM `group` g
JOIN `group_account` a ON g.group_id = a.group_id
GROUP BY a.group_id
HAVING COUNT(a.group_id) < 7;

-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT *, COUNT(a.group_id) AS so_luong_mem
FROM `group` g
JOIN `group_account` a ON g.group_id = a.group_id
GROUP BY a.group_id
HAVING COUNT(a.group_id) >= 5
UNION
SELECT *, COUNT(a.group_id) AS so_luong_mem
FROM `group` g
JOIN `group_account` a ON g.group_id = a.group_id
GROUP BY a.group_id
HAVING COUNT(a.group_id) < 7;



