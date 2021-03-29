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
                    ('Finance');
                    
SELECT * FROM `department`;                     
                    
INSERT INTO `position`(PositionName)
VALUES 				('Dev'),
					('Test'),
                    ('Scrum Master'),
                    ('PM');
                    
SELECT * FROM `position`;
                     
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('Email1@gmail.com'				, 'Username1'		,'Fullname1'				,   9			,   1		,'2020-03-05'),
					('Email2@gmail.com'				, 'Username2'		,'Fullname2'				,   2			,   2		,'2020-03-05'),
                    ('Email3@gmail.com'				, 'Username3'		,'Fullname3'				,   1			,   3		,'2020-03-05'),
                    ('Email4@gmail.com'				, 'Username4'		,'Fullname4'				,   3			,   2		,'2020-03-05'),
                    ('Email5@gmail.com'				, 'Username5'		,'Fullname5'				,   4			,   4		,'2020-03-05'),
                    ('Email6@gmail.com'				, 'Username6'		,'Fullname6'				,   2			,   3		,'2020-03-05'),
                    ('Email7@gmail.com'				, 'Username7'		,'Fullname7'				,   3			,   4		,'2020-03-05'),
                    ('Email8@gmail.com'				, 'Username8'		,'Fullname8'				,   8			,   3		,'2020-03-05'),
                    ('Email9@gmail.com'				, 'Username9'		,'Fullname9'				,   7			,   4		,'2020-03-05'),
                    ('Email10@gmail.com'			, 'Username10'		,'Fullname10'				,   3			,   2		,'2020-03-05');

SELECT * FROM `Account`;

INSERT INTO `group`	(GroupName			, CreatorID)
VALUES 				('GroupName1'		,	1		),
					('GroupName2'		,	2		),
                    ('GroupName2'		,	3		),
                    ('GroupName4'		,	4		),
                    ('GroupName8'		,	4		),
                    ('GroupName4'		,	3		),
                    ('GroupName4'		,	2		),
                    ('GroupName6'		,	2		),
                    ('GroupName8'		,	2		),
                    ('GroupName9'		,	1		);

SELECT * FROM `group` ;

INSERT INTO `groupaccount`	(GroupID	, AccountID)
VALUES 						(	1		,	1		),
							(	2		,	2		),
                            (	3		,	3		),
                            (	4		,	4		),
                            (	5		,	5		),
                            (	6		,	6		),
                            (	7		,	7		),
                            (	8		,	8		),
                            (	9		,	9		),
                            (	10		,	10		);
                            
SELECT * FROM `groupaccount`; 
                          
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
VALUES 					('TaiSaoHocLapTrinh'			, 	1					,	2						,   1		),
						('TimDenVTINhuTheNao'			, 	2					,	2						,   2		),
                        ('KetQuaDatDuocLaGi'			, 	3					,	2						,   5		),
                        ('MongMuonOVTILaGi'				, 	4					,	2						,   2		),
                        ('DinhHuongTuongLai'			, 	5					,	2						,   4		),
                        ('Muctieulagi'					, 	6					,	2						,   7		),
                        ('LapTrinhVienLaGi'				, 	7					,	2						,   8		),
                        ('LapTrinhJaVaLaGi'				, 	8					,	2						,   6		),
                        ('BanThayCoKhoKhong'			, 	9					,	2						,   4		),
                        ('BanSeCoGangChu'				, 	10					,	2						,   9		);
                        
SELECT * FROM `Question`;                    

INSERT INTO `Answer`	(Content						, QuestionID					, IsCorrect)
VALUES 					('TaiSaoHocLapTrinh'			,	1							,   	1),
						('TimDenVTINhuTheNao'			,	2							,		1),
						('KetQuaDatDuocLaGi'			,	2							,		1),
                        ('MongMuonOVTILaGi'				,	3							,		1),
                        ('DinhHuongTuongLai'			,	6							,		1),
						('Muctieulagi'					,	9							,		1),
						('LapTrinhVienLaGi'				,	9							,		1),
						('LapTrinhJaVaLaGi'				,	5							,		1),
						('BanThayCoKhoKhong'			,	10							,		1),
						('BanSeCoGangChu'				,	5							,		1);
   
SELECT * FROM `Answer`;

INSERT INTO `Exam`	(`Code`								, Title			, CategoryID				, Duration	, CreatorID)
VALUES 				('112A'								,'SQL'			,		1					,	15		,	1	),
					('113A'								,'JaVa'			,		2					,	15		,	2	),
					('114A'								,'CC'			,		3					,	15		,	5	),
                    ('115A'								,'Python'		,		3					,	15		,	4	),
                    ('116A'								,'PHP'			,		4					,	15		,	5	),
                    ('117A'								,'JaVa'			,		6					,	15		,	5	),
                    ('118A'								,'Python'		,		9					,	15		,	7	),
                    ('119A'								,'JaVa'			,		8					,	15		,	3	),
                    ('110A'								,'CC'			,		9					,	15		,	3	),
                    ('111A'								,'Python'		,		3					,	15		,	9	);

SELECT * FROM `Exam`;

INSERT INTO ExamQuestion	(ExamID	, QuestionID)
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
	
-- -------------------------Question_2-----------------------    
SELECT * FROM Department;

-- -------------------------Question_3----------------------- 

SELECT * FROM `Department` WHERE DepartmentName = 'Sale';
