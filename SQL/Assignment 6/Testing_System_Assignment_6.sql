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
						('TimDenVTINhuTheNao'			, 	2					,	1						,   2		),
                        ('KetQuaDatDuocLaGi'			, 	3					,	2						,   5		),
                        ('MongMuonOVTILaGi'				, 	4					,	2						,   2		),
                        ('DinhHuongTuongLai'			, 	5					,	1						,   4		),
                        ('Muctieulagi'					, 	6					,	2						,   7		),
                        ('LapTrinhVienLaGi'				, 	7					,	1						,   8		),
                        ('LapTrinhJaVaLaGi'				, 	8					,	1						,   6		),
                        ('BanThayCoKhoKhongÁDFGHJKJH'	, 	9					,	2						,   4		),
                        ('BanSeCoGangChu'				, 	10					,	1						,   9		),
                        ('MySQLLaGi'					, 	8					,	2						,   4		),
                        ('NgonNguJaVaLaGi '				, 	8					,	1						,   9		),
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
                            
-- ===================== ASSIGNMENT_ 6 ==================================================================
-- ======================================================================================================

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó--------

DROP PROCEDURE IF EXISTS sp_GetAccInforFromDepName;
DELIMITER $$
CREATE PROCEDURE sp_GetAccInforFromDepName(IN in_Dep VARCHAR(50))
BEGIN
	SELECT DepartmentName, AccountID, D.DepartmentID, FullName
	FROM  Department AS D
	JOIN  `Account` AS A ON   D.DepartmentID = A.DepartmentID    
	WHERE D.DepartmentName = in_Dep;
END$$
DELIMITER 

Call sp_GetAccInforFromDepName('Accounting');    

--  Question 2: Tạo store để in ra số lượng account trong mỗi group -------------------------------
-- --------------------------------------------------------------------------------------------------      

DROP PROCEDURE IF EXISTS sp_GetAccFromGroupAccount;
DELIMITER $$
CREATE PROCEDURE sp_GetAccFromGroupAccount(IN in_GroupID TINYINT)
BEGIN
	SELECT GA.GroupID, COUNT(GroupID) AS NumberAccount
	FROM  GroupAccount AS GA
	JOIN  `Account` AS A ON  A.AccountID = GA.AccountID
    WHERE GA.GroupID = in_GroupID
	GROUP BY GA.GroupID; 
END$$
DELIMITER 

Call sp_GetAccFromGroupAccount('1');    
 
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo -------------------
-- trong tháng hiện tại-----------

DROP PROCEDURE IF EXISTS sp_GetQuestionFromTypeQues;
DELIMITER $$
CREATE PROCEDURE sp_GetQuestionFromTypeQues(IN in_TypeQue VARCHAR(50))
BEGIN
	SELECT TQ.TypeName, COUNT(Q.QuestionID) AS NumberOfQuestion
	FROM TypeQuestion AS TQ
	JOIN Question AS Q ON TQ.TypeID = Q.TypeID
    WHERE TQ.TypeName = in_TypeQue AND MONTH(CreateDate) = Month(NOW())
	GROUP BY TQ.TypeID; 

END$$
DELIMITER 

Call sp_GetQuestionFromTypeQues('Essay');   

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất ---------------------

DROP PROCEDURE IF EXISTS sp_GetTypeIDFromTQ;
DELIMITER $$
CREATE PROCEDURE sp_GetTypeIDFromTQ(IN in_TypeQ VARCHAR(50))
BEGIN
	SELECT TQ.TypeName, TQ.TypeID, COUNT(Q.QuestionID) AS NumberOfQues
	FROM TypeQuestion AS TQ
	JOIN Question AS Q ON TQ.TypeID = Q.TypeID
	GROUP BY TQ.TypeID 
	HAVING COUNT(Q.QuestionID) = 	(SELECT MAX(NumberOfQues) 
									FROM (SELECT TQ.TypeName, COUNT(Q.QuestionID) AS NumberOfQues
										FROM TypeQuestion AS TQ
										JOIN Question AS Q ON TQ.TypeID = Q.TypeID
										GROUP BY TQ.TypeID) AS NewTable);

END$$
DELIMITER 

Call sp_GetTypeIDFromTQ('Essay');  

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question --------------



-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào -----

SELECT GroupName
FROM `Group`

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
--             username sẽ giống email nhưng bỏ phần @..mail đi 
--             positionID: sẽ có default là developer
--             departmentID: sẽ được cho vào 1 phòng chờ
--             Sau đó in ra kết quả tạo thành công ----------



-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice------------------
--             để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất ---------------

DROP PROCEDURE IF EXISTS sp_get_question_has_longest_content;
DELIMITER $$
CREATE PROCEDURE sp_get_question_has_longest_content(IN in_type_name ENUM('Essay', 'Multiple-Choice'))
BEGIN
	SELECT TQ.TypeName, Q.Content, CHAR_LENGTH(Q.Content) AS LengthOfContent
	FROM TypeQuestion AS TQ
	LEFT JOIN Question AS Q ON TQ.TypeID = Q.TypeID
    WHERE TQ.TypeName = in_type_name AND CHAR_LENGTH(Q.Content) = (SELECT MAX(LengthOfContent)
														     FROM(SELECT TQ.TypeName, Q.Content, CHAR_LENGTH(Q.Content) AS LengthOfContent
														     FROM TypeQuestion AS TQ
														     LEFT JOIN Question AS Q ON TQ.TypeID = Q.TypeID
														     WHERE TQ.TypeName = in_type_name
														     ) AS temp);
END$$
DELIMITER 


-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID -----------------------------------

DROP PROCEDURE IF EXISTS sp_DeleteExam;
DELIMITER $$
CREATE PROCEDURE sp_DeleteExam(IN in_ExamID TINYINT)
BEGIN

	DELETE
	FROM 	Exam
	WHERE 	ExamID = in_ExamID ;
END$$
DELIMITER 

Call sp_DeleteExam('1');   

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing -------------

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc -------

DROP PROCEDURE IF EXISTS sp_DeleteDepartment;
DELIMITER $$
CREATE PROCEDURE sp_DeleteDepartment(IN	in_DepartmentName NVARCHAR(50))
BEGIN
	UPDATE 	`Account`
    SET		DepartmentID = 10
    WHERE	DepartmentID = (SELECT 	DepartmentID	
							FROM	Department
							WHERE 	DepartmentName = in_DepartmentName);
	DELETE 
    FROM	Department
    WHERE	DepartmentName = in_DepartmentName;
END$$
DELIMITER ;

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay ---------------------------------

SELECT CreateDate, COUNT(Q.QuestionID)
FROM Question AS Q
WHERE YEAR(CreateDate) = YEAR(NOW())
GROUP BY CreateDate;

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")---------------

