DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE IF NOT EXISTS TestingSystem;
USE TestingSystem;

-- create table 1: Department 
DROP TABLE IF EXISTS Department;
CREATE TABLE Department ( 
	DepartmentID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName		NVARCHAR(50) NOT NULL UNIQUE KEY
);


-- create table 2: Position
DROP TABLE IF EXISTS Position;
CREATE TABLE 	`Position` (
	PositionID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName 		ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- create table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
	AccountID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email				VARCHAR(50) NOT NULL UNIQUE KEY,
	Username 			VARCHAR(50) NOT NULL UNIQUE KEY, 
	FullName 			NVARCHAR(50) NOT NULL,
	DepartmentID 		TINYINT UNSIGNED NOT NULL,
	PositionID			TINYINT UNSIGNED NOT NULL,
	CreateDate			DATETIME DEFAULT NOW(),
	FOREIGN KEY(DepartmentID) 	REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) 	REFERENCES `Position`(PositionID)
);

-- create table 4: Group 
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName			VARCHAR(50) NOT NULL,
	CreatorID			TINYINT UNSIGNED NOT NULL,
	CreateDate			DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- create table 5: GroupAccount
DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE GroupAccount (
	GroupID				TINYINT UNSIGNED NOT NULL,
	AccountID			TINYINT UNSIGNED NOT NULL,
	JointDate			DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY (GroupID) 	REFERENCES`Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES`Account`(AccountID)
);

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE TypeQuestion (
	TypeID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName			ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- create table 7: CategoryQuestion
DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE CategoryQuestion (
	CategoryID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	CategoryName		VARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
	QuestionID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content				VARCHAR(150) NOT NULL UNIQUE KEY,
	CategoryID 			TINYINT UNSIGNED NOT NULL,
	TypeID				TINYINT UNSIGNED NOT NULL,
	CreatorID			TINYINT UNSIGNED NOT NULL,
	CreateDate 			DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId) 
);

-- create table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE IF NOT EXISTS Answer (
	AnswerID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content				VARCHAR(150) NOT NULL UNIQUE KEY,
	QuestionID			TINYINT UNSIGNED NOT NULL,
	IsCorrect			BIT DEFAULT 1,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
	ExamID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code`				CHAR(10) NOT NULL UNIQUE KEY,
	Title				VARCHAR(50) NOT NULL,
	CategoryID			TINYINT UNSIGNED NOT NULL,
	Duration			TINYINT UNSIGNED NOT NULL,
	CreatorID			TINYINT UNSIGNED NOT NULL,
	CreateDate			DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
	ExamID				TINYINT UNSIGNED NOT NULL,	
	QuestionID			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) 	REFERENCES Exam(ExamID) ,
    PRIMARY KEY(ExamID,QuestionID)
);
-- --------------------INSERT DATABASE-------------------------
-- ------------------------------------------------------------
INSERT INTO `department`(DepartmentName)
VALUES 				('Sale'),
					('Marketing'),
                    ('HumanResources'),
                    ('BoadofDirect'),
                    ('Accounting'),
                    ('ProductDevelopment'),
                    ('RearchaAnDesign'),
                    ('Engineering'),
                    ('Purchaseing'),
                    ('Finance'),
                    ('Manufacturing'),
                    ('CustomerService');
                    
SELECT * FROM `department`;                     
                    
INSERT INTO `position`(PositionName)
VALUES 				('Dev'),
					('Test'),
                    ('Scrum Master'),
                    ('PM');
                    
SELECT * FROM `position`;
                     
INSERT INTO `Account`(Email									, Username				, FullName				, DepartmentID		, PositionID, CreateDate)
VALUES 				('Email1@gmail.com'						, 'Username1'			,'NguyenThao'				,   9			,   1		,'2009-03-05'),
					('Email2@gmail.com'						, 'Username2'			,'DangNhatDo'				,   2			,   2		,'2010-11-05'),
                    ('Email3@gmail.com'						, 'Username3'			,'DinhManhThao'				,   1			,   3		,'2020-03-05'),
                    ('Email4@gmail.com'						, 'Username4'			,'DuongHuuManh'				,   3			,   2		,'2020-03-05'),
                    ('Email5@gmail.com'						, 'Username5'			,'NguyenCongDanh'			,   4			,   4		,'2020-03-05'),
                    ('Email6@gmail.com'						, 'Username6'			,'TrinhDinhQuang'			,   2			,   3		,'2020-03-05'),
                    ('Email7@gmail.com'						, 'Username7'			,'KhongTuQuynh'				,   3			,   1		,'2020-03-05'),
                    ('Email8@gmail.com'						, 'Username8'			,'NooPhuocThinh'			,   8			,   3		,'2020-03-05'),
                    ('Email9@gmail.com'						, 'Username9'			,'SonTungMTP'				,   7			,   4		,'2020-03-05'),
                    ('Email10@gmail.com'					, 'Username10'			,'ThieuBaoTram'				,   9			,   1		,'2020-03-05'),
					('Email11@gmail.com'					, 'Username11'			,'NgoQuangHieu'				,   9			,   2		,'2020-03-05'),
					('Email12@gmail.com'					, 'Username12'			,'MyTam'					,   5			,   3		,'2020-03-05'),
					('Email13@gmail.com'					, 'Username13'			,'QuangLe'					,   3			,   2		,'2020-03-05'),
					('Email14@gmail.com'					, 'Username14'			,'LeQuyen'					,   10			,   4		,'2020-03-05'),
					('Email15@gmail.com'					, 'Username15'			,'LuongBichHuu'				,   12			,   3		,'2020-03-05'),
					('Email16@gmail.com'					, 'Username16'			,'BaoAnh'					,   12			,   4		,'2020-03-05'),
					('Email17@gmail.com'					, 'Username17'			,'ChiPu'					,   12			,   2		,'2020-03-05'),
					('Email18@gmail.com'					, 'Username18'			,'PhamNhatVuong'			,   3			,   2		,'2020-03-05'),
					('Email19@gmail.com'					, 'Username19'			,'NguyenQuangDung'			,   7			,   3		,'2020-03-05'),
					('thaonguyentn25598@gmail.com'			, 'thaonguyentn25598'	,'TruongTamPhong'			,   3			,   1		,'2020-03-05'),
                    ('HoNhatThien2021@gmail.com'			, 'HoNhatThien2021'		,'HoNhatThien'				,   3			,   1		,'2020-03-05'),
                    ('LamTamNhuCHINA@gmail.com'				, 'LamTamNhuCHINA'		,'LamTamNhu'				,   12			,   2		,'2020-03-05'),
                    ('HoaiLinhNS2022@gmail.com'				, 'HoaiLinhNS2022'		,'HoaiLinh'					,   3			,   4		,'2020-03-05'),
                    ('NguyenTranThanhHTML@gmail.com'		, 'NguyenTranThanhHTML'	,'NguyenTranThanh'			,   5			,   4		,'2020-03-05'),
                    ('LeThanhNghi19@gmail.com'				, 'LeThanhNghi19'		,'LeThanhNghi'				,   5			,   2		,'2020-03-05'),
                    ('LeTrongTanSQL11@gmail.com'			, 'LeTrongTanSQL11'		,'LeTrongTan'				,   4			,   1		,'2020-03-05'),
                    ('CaoBaQuat1843@gmail.com'				, 'CaoBaQuat1843'		,'CaoBaQuat'				,   5			,   2		,'2020-03-05'),
                    ('PhanBoiChauVN12@gmail.com'			, 'PhanBoiChauVN12'		,'PhanBoiChau'				,   3			,   3		,'2020-03-05'),
                    ('HoChiMinh1964@gmail.com'				, 'HoChiMinh1964'		,'HoChiMinh'				,   3			,   2		,'2020-03-05'),
                    ('NguyenAiQuoc1954@gmail.com'			, 'NguyenAiQuoc1954'	,'NguyenAiQuoc'				,   1			,   4		,'2020-03-05');
                                                                                                                                                         
SELECT DepartmentID, AccountID FROM `Account`;

INSERT INTO `group`	(GroupName			, CreatorID	, CreateDate )
VALUES 				('GroupName1'		,	1		,'2020-03-05'),
					('GroupName2'		,	2		,'2019-12-18'),
                    ('GroupName2'		,	3		,'2020-03-05'),
                    ('GroupName4'		,	4		,'2019-10-01'),
                    ('GroupName8'		,	4		,'2020-03-05'),
                    ('GroupName4'		,	3		,'2020-03-05'),
                    ('GroupName4'		,	2		,'2020-03-05'),
                    ('GroupName6'		,	2		,'2020-03-05'),
                    ('GroupName8'		,	2		,'2020-03-05'),
                    ('GroupName9'		,	1		,'2020-03-05'),
                    ('GroupName10'		,	1		,'2020-03-05');

SELECT * FROM `group` ;

INSERT INTO `groupaccount`	(GroupID	, AccountID, JointDate )
VALUES 						(	1		,	2		,'2020-03-05'),
							(	2		,	2		,'2019-12-18'),
                            (	2		,	3		,'2020-03-05'),
                            (	3		,	4		,'2019-10-01'),
                            (	3		,	5		,'2020-03-05'),
                            (	1		,	7		,'2020-03-05'),
                            (	2		,	7		,'2020-03-05'),
                            (	6		,	8		,'2020-03-05'),
                            (	1		,	14		,'2020-03-05'),
                            (	1		,	10		,'2020-03-05'),
                            (	4		,	11		,'2020-03-05'),
                            (	3		,	12		,'2020-03-05'),
                            (	5		,	13		,'2020-03-05'),
                            (	2		,	14		,'2020-03-05'),
                            (	6		,	15		,'2020-03-05'),
                            (	3		,	16		,'2020-03-05'),
                            (	2		,	17		,'2020-03-05'),
                            (	5		,	2		,'2020-03-05'),
                            (	5		,	7		,'2020-03-05'),
                            (	1		,	8		,'2020-03-05'),
                            (	6		,	7		,'2020-03-05'),
                            (	3		,	11		,'2019-03-05'),
                            (	9		,	2		,'2020-03-05'),
                            (	8		,	7		,'2020-03-05'),
                            (	2		,	20		,'2020-03-05'),
                            (	3		,	9		,'2020-03-05'),
                            (	3		,	7		,'2020-03-05'),
                            (	4		,	9		,'2020-03-05');
                                                                  
SELECT *                                                          
FROM `groupaccount`;                                              
                                                                  
INSERT INTO `TypeQuestion`	(TypeName)                            
VALUES 						('Essay'),                            
							('Multiple-Choice');
                            
SELECT * FROM`TypeQuestion`;            
  
INSERT INTO `CategoryQuestion`	(CategoryName)
VALUES 							('CategoryName1'),
								('CategoryName2'),
                                ('CategoryName3'),
                                ('CategoryName4'),
                                ('CategoryName5'),
                                ('CategoryName6'),
                                ('CategoryName7'),
                                ('CategoryName8'),
                                ('CategoryName9'),
                                ('CategoryName10');
								
SELECT * FROM `CategoryQuestion`;

INSERT INTO `Question`	(Content						, CategoryID			, TypeID					, CreatorID	)
VALUES 					('CauhoiHocLapTrinh'			, 	1					,	2						,   1		),
						('TimDenVTINhuTheNao'			, 	2					,	2						,   2		),
                        ('KetQuaDatDuocLaGi'			, 	3					,	2						,   5		),
                        ('MongMuonOVTILaGi'				, 	4					,	2						,   2		),
                        ('DinhHuongTuongLai'			, 	5					,	2						,   4		),
                        ('Muctieulagi'					, 	6					,	2						,   7		),
                        ('LapTrinhVienLaGi'				, 	7					,	2						,   8		),
                        ('LapTrinhJaVaLaGi'				, 	8					,	2						,   6		),
                        ('BanThayCoKhoKhong'			, 	9					,	2						,   4		),
                        ('BanSeCoGangChu'				, 	10					,	2						,   9		),
                        ('MySQLLaGi'					, 	8					,	2						,   4		),
                        ('NgonNguJaVaLaGi '				, 	8					,	2						,   9		),
                        ('BanThichDungNgonNguNao'		, 	4					,	2						,   1		);
                        
SELECT * FROM `Question`;                    

INSERT INTO `Answer`	(Content						, QuestionID					, IsCorrect)
VALUES 					('TaiSaoHocLapTrinh'			,	1							,   	1),
						('TimDenVTINhuTheNao'			,	2							,		1),
						('KetQuaDatDuocLaGi'			,	2							,		1),
                        ('MongMuonOVTILaGi'				,	2							,		1),
                        ('DinhHuongTuongLai'			,	2							,		1),
						('Muctieulagi'					,	9							,		1),
						('LapTrinhVienLaGi'				,	9							,		1),
						('LapTrinhJaVaLaGi'				,	5							,		1),
						('BanThayCoKhoKhong'			,	10							,		1),
						('BanSeCoGangChu'				,	5							,		1);
   
SELECT * FROM `Answer`;

INSERT INTO `Exam`	(`Code`								, Title			, CategoryID				, Duration	, CreatorID	,CreateDate )
VALUES 				('112A'								,'SQL'			,		1					,	15		,	1		,'2020-03-05'),
					('113A'								,'JaVa'			,		2					,	120		,	2		,'2019-12-18'),
					('114A'								,'CC'			,		3					,	15		,	5		,'2020-03-05'),
                    ('115A'								,'Python'		,		3					,	90		,	4		,'2019-10-01'),
                    ('116A'								,'PHP'			,		4					,	60		,	5		,'2020-03-05'),
                    ('117A'								,'JaVa'			,		6					,	15		,	5		,'2020-03-05'),
                    ('118A'								,'Python'		,		9					,	150		,	7		,'2020-03-05'),
                    ('119A'								,'JaVa'			,		8					,	15		,	3		,'2020-03-05'),
                    ('110A'								,'CC'			,		9					,	15		,	3		,'2020-03-05'),
                    ('111A'								,'Python'		,		3					,	15		,	9		,'2020-03-05');

SELECT * FROM `Exam`;

INSERT INTO ExamQuestion	(ExamID		, QuestionID)
VALUES 						(	1		,	1	),
							(	1		,	2	),
                            (	1		,	3	),
                            (	2		,	4	),
                            (	3		,	5	),
                            (	2		,	6	),
                            (	3		,	7	),
                            (	7		,	8	),
                            (	8		,	9	),
                            (	2		,	10	);
                            
-- ------------------------- -------------------------------ASSGNMENT 3----------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------- Question 1: Thêm ít nhất 10 record vào mỗi table----------------

-- -----------------Question_2: lấy ra tất cả các phòng ban--------------------------

SELECT * FROM Department;

-- -----------------Question_3: lấy ra id của phòng ban "Sale"----------------------- 

SELECT DepartmentID FROM `Department` WHERE DepartmentName = 'Sale';

-- -----------------Question_4: lấy ra thông tin account có full name dài nhất-------------------------

SELECT *, char_length(FullName) AS length_of_fullname 
FROM `Account` 
ORDER BY char_length(FullName) DESC
LIMIT 1;

SELECT *, MAX(length_of_fullname)
FROM
	(SELECT `AccountID`,FullName, char_length(FullName) AS length_of_fullname
	FROM `Account`) AS FullnameLongest; 
      
-- ---------------: Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3-----------

SELECT *, char_length(FullName) AS length_of_fullname 
FROM `Account` 
WHERE DepartmentID = 3
ORDER BY char_length(FullName) DESC
LIMIT 1;

SELECT 

-- ----------------Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019----------------------

SELECT `GroupName` FROM `Group` WHERE CreateDate < '2019-12-20';

-- --------------- Question 7: Lấy ra ID của question có >= 4 câu trả lời-------------------------------

SELECT QuestionID FROM Answer 
GROUP BY QuestionID
HAVING COUNT(QuestionID) >= 4;

-- ---------------Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20-12-2019 --------------

SELECT `Code` FROM Exam 
WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- ---------------Question 9: Lấy ra 5 group được tạo gần đây nhất --------------------------------------------------

SELECT 		GroupID, CreateDate FROM `group`
ORDER BY 	CreateDate DESC
LIMIT 		5;

-- ---------------Question 10: Đếm số nhân viên thuộc department có id = 2 -------------------------------------

SELECT 	DepartmentID, COUNT(AccountID) AS SL FROM `account`
WHERE 	DepartmentID = 2;

-- ---------------Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"------------

SELECT * FROM `account` 
WHERE FullName LIKE "D%o";

-- ---------------Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019-------------------------------

DELETE 
FROM 	Exam 
WHERE 	CreateDate < '2019-12-20';

-- ---------------Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"--------------------
DELETE FROM answer 
WHERE 		QuestionID IN (SELECT QuestionID
							FROM question
							WHERE Content LIKE 'Cauhoi%');


-- -------------- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn----------

UPDATE 		`Account` 
SET 		FullName = "Nguyễn Bá Lộc", Email = "loc.nguyenba@vti.com.vn"
WHERE 		AccountID = 5;

-- ------------- Question 15: update account có id = 5 sẽ thuộc group có id = 4 -----------------------------------

UPDATE `GroupAccount` 
SET 	GroupID=4
WHERE 	AccountID=5; 

-- ---------------------- FINISHED ASSIGNMENT 4 ---------------------------------------------