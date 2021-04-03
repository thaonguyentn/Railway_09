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
						('TimDenVTINhuTheNao'			, 	1					,	2						,   2		),
                        ('KetQuaDatDuocLaGi'			, 	3					,	2						,   5		),
                        ('MongMuonOVTILaGi'				, 	4					,	1						,   2		),
                        ('DinhHuongTuongLai'			, 	5					,	2						,   4		),
                        ('Muctieulagi'					, 	6					,	1						,   7		),
                        ('LapTrinhVienLaGi'				, 	7					,	2						,   8		),
                        ('LapTrinhJaVaLaGi'				, 	8					,	2						,   6		),
                        ('BanThayCoKhoKhong'			, 	9					,	1						,   4		),
                        ('BanSeCoGangChu'				, 	10					,	2						,   9		),
                        ('MySQLLaGi'					, 	8					,	1						,   4		),
                        ('NgonNguJaVaLaGi '				, 	8					,	2						,   9		),
                        ('BanThichDungNgonNguNao'		, 	4					,	1						,   1		);
                        
SELECT * FROM `Question`;                    

INSERT INTO `Answer`	(Content						, QuestionID					, IsCorrect)
VALUES 					('BoiViToiThich'				,	1							,   	1),
						('ThichNgonNguJava'				,	2							,		1),
						('QuyetTamhocTap'				,	2							,		1),
                        ('LamViecTaiVTI'				,	2							,		1),
                        ('TroThanhMotProjectM'			,	2							,		1),
						('HoanThanhXuatSac'				,	9							,		1),
						('NguoiTaoRaTrangWeb'			,	9							,		1),
						('JaVaCoVeKho'					,	5							,		1),
						('VTILaCongTyCongNghe'			,	10							,		1),
						('LaMotCauHoiKho'				,	5							,		1);
   
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
                            

-- ------------------------- -------------------------------ASSIGNMENT_ 4----------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------- Excercise 1/ Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ ------------------------------------ 

SELECT * 
FROM 		`account` AS A
LEFT JOIN 	Department AS D ON A.DepartmentID = D.DepartmentID;

-- ------------- Excercise 1/ Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 -----------------------------------
SELECT * 
FROM 		`account` AS A
LEFT JOIN 	Department AS D ON A.DepartmentID = D.DepartmentID
WHERE 		A.CreateDate >= '2010-12-20';


-- ------------- Excercise 1/Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên ---------------------

SELECT 		DepartmentName, COUNT(A.AccountID) AS Number_of_Employee_in_Department
FROM 		`Account` AS A
INNER JOIN 	Department AS D ON A.DepartmentID = D.DepartmentID
GROUP BY 	A.DepartmentID
HAVING 		COUNT(A.AccountID) >= 3;

-- ------------- Excercise 1/Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất------------------
-- Using View -----------------------------

 SELECT * 
 FROM (SELECT Q.QuestionID , COUNT(Q.QuestionID) AS NumberofQuestionAppear
			FROM Question AS Q 
			JOIN ExamQuestion AS EQ ON Q.QuestionID = EQ.QuestionID
			GROUP BY (EQ.ExamID)) AS QuestionStatistic
 HAVING MAX(NumberofQuestionAppear);     
 

-- ------------- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT 		CQ.CategoryID, CQ.CategoryName, COUNT(Q.CategoryID) AS NumberofCategoryQuestion
FROM 		CategoryQuestion AS CQ
LEFT JOIN 	Question AS Q ON CQ.CategoryID = Q.CategoryID
GROUP BY 	CQ.CategoryID;

-- ------------- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT Q.QuestionID, Q.Content, COUNT(EQ.ExamID) AS NumBerOfExam
FROM Question Q
LEFT JOIN ExamQuestion EQ ON Q.QuestionID = EQ.QuestionID
GROUP BY Q.QuestionID
ORDER BY NumBerOfExam ASC;

-- ------------- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT Q.QuestionID, Q.Content, COUNT(AnswerID) AS AnswerNumbers
FROM Question Q
INNER JOIN Answer A ON Q.QuestionID = A.QuestionID
GROUP BY (Q.QuestionID) 
HAVING COUNT(AnswerID) = (SELECT MAX(AnswerNumbers) 
						  FROM 	(SELECT Q.QuestionID, Q.Content, COUNT(AnswerID) AS AnswerNumbers
								 FROM Question Q
								 INNER JOIN Answer A ON Q.QuestionID = A.QuestionID
								 GROUP BY Q.QuestionID) AS NewTable);
													
 
-- ------------- Question 9: Thống kê số lượng account trong mỗi group

SELECT		GroupID, COUNT(A.AccountID) AS 'NumbeofAccount'
FROM		`Account` AS A
INNER JOIN 	GroupAccount GA ON A.AccountID = GA.AccountID
GROUP BY	GA.GroupID;

-- ------------- Question 10: Tìm chức vụ có ít người nhất

SELECT 		P.PositionID, P.PositionName, COUNT(A.PositionID) AS 'NumberofPeople'
FROM		Position AS P 
INNER JOIN 	`Account` AS A ON P.PositionID = A.PositionID
GROUP BY 	P.PositionID
HAVING		COUNT(A.PositionID)	=(SELECT MIN(NumberPosition)
									FROM	(SELECT 	COUNT(P.PositionID) AS NumberPosition
											FROM		Position P 
											INNER JOIN 	`Account` A ON A.PositionID = P.PositionID		
											GROUP BY	P.PositionID) AS MinPosition);
                                                
                                                
-- ------------- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT * FROM testingsystem.account;

SELECT 
    t1.DepartmentID,
    t1.PositionID,
    IF((t2.number_of_account IS NULL),
        0,
        t2.number_of_account) AS number_of_account
FROM
    (SELECT 
        d.DepartmentID, p.PositionID
    FROM
        department d
    CROSS JOIN `position` p
    WHERE
        p.PositionName IN ('Dev' , 'Test', 'Scrum Master', 'PM')
    ORDER BY d.DepartmentID , p.PositionID) AS t1
        LEFT JOIN
    (SELECT 
        d.DepartmentID,
            p.PositionID,
            COUNT(a.AccountID) AS number_of_account
    FROM
        position p
    LEFT JOIN `account` a ON p.PositionID = a.PositionID
    RIGHT JOIN department d ON a.DepartmentID = d.DepartmentID
    WHERE
        p.PositionName IN ('Dev' , 'Test', 'Scrum Master', 'PM')
    GROUP BY d.DepartmentID , p.PositionID) AS t2 ON t1.DepartmentID = t2.DepartmentID
													AND t1.PositionID = t2.PositionID
GROUP BY t1.DepartmentID , t1.PositionID
ORDER BY t1.DepartmentID , t1.PositionID;


-- ------------- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
--                            question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …-------------

SELECT TQ.TypeID,TQ.TypeName, Q.CreatorID, A.Content
FROM Question AS Q
JOIN TypeQuestion AS TQ ON Q.TypeID = TQ.TypeID
JOIN Answer AS A ON Q.QuestionID = A.QuestionID;

-- ------------- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT		TQ.TypeName, COUNT(Q.TypeID) AS 'NumberofQuestion'
FROM		Question Q 
INNER JOIN 	TypeQuestion TQ ON Q.TypeID = TQ.TypeID
GROUP BY	Q.TypeID;


-- ------------- Question 14 trung 15: Lấy ra group không có account nào

SELECT		GroupID
FROM		`Group` 
WHERE		GroupID  NOT IN	(SELECT		GroupID
							 FROM		GroupAccount);

-- ------------- Question 16: Lấy ra question không có answer nào

SELECT		QuestionID, Content
FROM		Question
WHERE		QuestionID NOT IN (SELECT	QuestionID
							   From		Answer);
                               
                               
                        
-- ---------------------- Exercise 2: Union ----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1---------------------------------------------------------
-- b) Lấy các account thuộc nhóm thứ 2---------------------------------------------------------
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau ---------------

SELECT * 
FROM 	`Account` AS A
JOIN 	GroupAccount AS GA ON A.AccountID = GA.AccountID
WHERE 	GA.GroupID = 1

UNION 

SELECT * 
FROM 	`Account` AS A
JOIN 	GroupAccount AS GA ON A.AccountID = GA.AccountID
WHERE 	GA.GroupID = 2; 

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên ---------------------------------------------------------
-- b) Lấy các group có nhỏ hơn 7 thành viên ---------------------------------------------------------
-- c) Ghép 2 kết quả từ câu a) và câu b)

SELECT 		*, COUNT(A.AccountID) AS NumberofGroup
FROM 		`Account` AS A
JOIN 		GroupAccount AS GA ON A.AccountID = GA.AccountID
GROUP BY 	GA.GroupID
HAVING 		Count(NumberofGroup) > 5

UNION ALL

SELECT 		*, COUNT(A.AccountID) AS NumberofGroup
FROM 		`Account` AS A
JOIN 		GroupAccount AS GA ON A.AccountID = GA.AccountID
GROUP BY 	GA.GroupID
HAVING 		Count(NumberofGroup) < 7;