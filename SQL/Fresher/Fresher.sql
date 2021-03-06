DROP DATABASE IF EXISTS 		fresher;
CREATE DATABASE IF NOT EXISTS 	fresher;
USE 							fresher;

-- -------create table : Trainee  ------------------

DROP TABLE IF EXISTS 	Trainee;
CREATE TABLE 			Trainee ( 

	TraineeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FullName			NVARCHAR(50) NOT NULL,
    BirthDate			DATE NOT NULL,
    Gender				ENUM ( 'Male', 'Female', 'Unknown') NOT NULL,
    ETIQ				TINYINT UNSIGNED NOT NULL,
    ETGmath				TINYINT UNSIGNED NOT NULL,
    ETEnglish      		TINYINT UNSIGNED NOT NULL,
    TrainingClass		VARCHAR(50) NOT NULL,
    EvaluationNotes		VARCHAR(50) NOT NULL,
    
    CONSTRAINT ETIQ_KIEMTRA 		CHECK(ETIQ BETWEEN 0 AND 20),
	CONSTRAINT ETGmath_KIEMTRA 		CHECK(ETGmath BETWEEN 0 AND 20),
    CONSTRAINT ETEnglish_KIEMTRA 	CHECK(ETEnglish BETWEEN 0 AND 50)
    );
    
INSERT INTO `Trainee` 	(	FullName,				BirthDate,			Gender,		ETIQ,		ETGmath,	ETEnglish,	 TrainingClass,		EvaluationNotes)
VALUE 					('NGuyenHaiYen',			'1991-08-20', 		'Female', 	15,  		16, 		25, 		'VTI001', 			'ISShool'),
						('TruongNgocHa',			'1998-09-20', 		'Female', 	8,  		10, 		20, 		'VTI002', 			'DHQGHN'),
                        ('NguyenThiThao',			'2002-12-20', 		'Female', 	9,  		12, 		18, 		'VTI003', 			'FPTSH'),
                        ('TranBinhNguyen',			'1991-08-20', 		'Male', 	12,  		19, 		39, 		'VTI001', 			'GTVT'),
                        ('HoGiaHung',				'1995-12-26', 		'Male', 	20,  		11, 		13, 		'VTI001', 			'NEU'),
                        ('PhungThiThuyMai',			'1985-05-20', 		'Female', 	19,  		10, 		21, 		'VTI001', 			'DHNT'),
                        ('LeThiThuThao',			'1991-12-20', 		'Female', 	13,  		19, 		29, 		'VTI007', 			'DHTM'),
                        ('NguyenThiHuong',			'2010-03-20', 		'Female', 	7,  		20, 		46, 		'VTI001', 			'DHQGHN'),
                        ('NguyenThiHang',			'1991-11-20', 		'Female', 	8,  		12, 		19, 		'VTI001', 			'HVBC'),
                        ('DongMinhHieu',			'2001-01-20', 		'Male', 	12,  		10, 		19, 		'VTI015', 			'HVNH'),
                        ('PhiThanhVan',				'1991-01-20', 		'Female', 	7,  		09, 		09, 		'VTI011', 			'GTVT'),
                        ('HoangCongDanh',			'1994-07-20', 		'Male', 	17,  		10, 		49, 		'VTI012', 			'ISShool'),
                        ('NguyenPhuc',				'1998-09-20', 		'Male', 	15,  		07, 		15, 		'VTI014', 			'DHNT'),
                        ('NguyenThiHien',			'1991-12-20', 		'Female', 	18,  		13, 		29, 		'VTI014', 			'GTVT'),
                        ('CaoBaQUat',				'1971-04-20', 		'Male', 	15,  		05, 		35, 		'VTI015', 			'NEU'),
                        ('TranVuLinh',				'1981-05-20', 		'Male', 	15,  		10, 		21, 		'VTI016', 			'DHNT'),
                        ('PhungMinhVu',				'1991-12-20', 		'Male', 	18,  		16, 		50, 		'VTI017', 			'NEU'),
                        ('TongUyLong',				'1987-01-20', 		'Unknown', 	13,  		17, 		24, 		'VTI018', 			'HVBC'),
                        ('NGuyenHaiYen',			'1999-11-20', 		'Male', 	20,  		06, 		20, 		'VTI001', 			'FPTSH'),
                        ('HoangHoaTonAnhNguyen',	'1991-02-20', 		'Male', 	15,  		10, 		25, 		'VTI018', 			'HVNH');
 SELECT * FROM Trainee;                    
                        
-- Question 3: Insert 1 b???n ghi m?? c?? ??i???m ET_IQ =30. Sau ???? xem k???t qu??? ----------------

	-- Error Code: 3819. Check constraint 'ETGmath_KIEMTRA' is violated --
					
-- Question 4: Vi???t l???nh ????? l???y ra t???t c??? c??c th???c t???p sinh ???? v?????t qua b??i test ?????u v??o,
-- v?? s???p x???p theo ng??y sinh. ??i???m ET_IQ >=12, ET_Gmath>=12, ET_English>=20 -----------------------------------

SELECT * 
FROM Trainee
WHERE ETIQ >= 12 AND ETGmath >= 12 AND ETEnglish >= 12
ORDER BY BirthDate DESC; 

-- Question 5: Vi???t l???nh ????? l???y ra th??ng tin th???c t???p sinh c?? t??n b???t ?????u b???ng ch??? N v?? k???t th??c b???ng ch??? C -------------

SELECT * 
FROM Trainee
WHERE FullName LIKE "N%C";

-- Question 6: Vi???t l???nh ????? l???y ra th??ng tin th???c t???p sinh m?? t??n c?? k?? th??? th??? 2 l?? ch??? G --------------------------
 
SELECT * 
FROM Trainee
WHERE FullName LIKE "_G%";

-- Question 7: Vi???t l???nh ????? l???y ra th??ng tin th???c t???p sinh m?? t??n c?? 10 k?? t??? v?? k?? t??? cu???i c??ng l?? C -------------

SELECT *
FROM Trainee
WHERE FullName LIKE "_________c";

-- Question 8: Vi???t l???nh ????? l???y ra Fullname c???a c??c th???c t???p sinh trong l???p, l???c b??? c??c t??n tr??ng nhau. ---------------------

SELECT DISTINCT FullName
FROM Trainee;

-- Question 9: Vi???t l???nh ????? l???y ra Fullname c???a c??c th???c t???p sinh trong l???p, s???p x???p c??c t??n n??y theo th??? t??? t??? A-Z. ---------
    
SELECT FullName
FROM Trainee
ORDER BY FullName ASC;   

--   Question 10: Vi???t l???nh ????? l???y ra th??ng tin th???c t???p sinh c?? t??n d??i nh???t --------------------------------

SELECT *
FROM Trainee
WHERE Char_Length(Fullname) = 
						(SELECT MAX(Char_Length(Fullname)) FROM Trainee);


-- Question 11: Vi???t l???nh ????? l???y ra ID, Fullname v?? Ng??y sinh th???c t???p sinh c?? t??n d??i nh???t -------------------

SELECT TraineeID, FullName, BirthDate
FROM Trainee
WHERE Char_Length(Fullname) = 
						(SELECT MAX(Char_Length(Fullname)) FROM Trainee);

-- Question 12: Vi???t l???nh ????? l???y ra T??n, v?? ??i???m IQ, Gmath, English th???c t???p sinh c?? t??n d??i nh???t --------------

SELECT FullName, ETIQ, ETGmath, ETEnglish
FROM Trainee
WHERE Char_Length(Fullname) =
							(SELECT MAX(Char_Length(Fullname)) FROM Trainee);

-- Question 13 L???y ra 5 th???c t???p sinh c?? tu???i nh??? nh???t -------------------------------

SELECT *
FROM Trainee
ORDER BY BirthDate DESC
LIMIT 5;

-- Question 15: X??a th???c t???p sinh c?? TraineeID = 5 ---------------------------------------------------------------

DELETE 
FROM Trainee
WHERE TraineeID = 5;

-- Question 16: X??a th???c t???p sinh c?? t???ng ??i???m ET_IQ, ET_Gmath <=15 -----------------------------------------------

DELETE 
FROM Trainee
WHERE (ETIQ + ETGmath) <=15;

-- Question 17: X??a th???c t???p sinh qu?? 30 tu???i ---------------------------

DELETE 
FROM Trainee
WHERE BirthDate < '1991-01-01';

-- Question 18: Th???c t???p sinh c?? TraineeID = 3 ???????c chuy???n sang l???p " VTI003". H??y c???p nh???t th??ng tin v??o database ----------------------------

UPDATE Trainee
SET TrainingClass = "VTI003"
WHERE TraineeID = 3;

-- Question 19: Do c?? s??? nh???m l???n khi nh???p li???u n??n th??ng tin c???a h???c sinh s??? 10 ??ang b??? sai, h??y c???p nh???t l???i t??n th??nh ???LeVanA???
-- , ??i???m ET_IQ =10, ??i???m ET_Gmath =15, ??i???m ET_English = 30. --------------

UPDATE Trainee
SET FullName = 'LeVanA', ETIQ =10, ETGmath =15, ETEnglish = 30
WHERE TraineeID = 10;

-- Question 20: ?????m xem trong l???p VTI001 c?? bao nhi??u th???c t???p sinh -------------------------

SELECT *, COUNT(*) AS 'Number'
FROM Trainee
WHERE TrainingClass ='VTI001';

-- Question 22: ?????m t???ng s??? th???c t???p sinh trong l???p VTI001 v?? VTI003 c?? bao nhi??u th???c t???p sinh. -----------------

SELECT TrainingClass, COUNT (TraineeID) AS number_of_trainees
FROM Trainee
WHERE (TrainingClass ='VTI001') OR (TrainingClass ='VTI003')
GROUP BY TrainingClass;

-- Question 23: L???y ra s??? l?????ng c??c th???c t???p sinh theo gi???i t??nh: Male, Female, Unknown -----------------------------------

SELECT Gender, COUNT(*)
FROM Trainee
GROUP BY Gender;

-- Question 24: L???y ra l???p c?? l???n h??n 5 th???c t???p vi??n ---------

SELECT TrainingClass, COUNT(TrainingClass)
FROM Trainee
GROUP BY TrainingClass
HAVING COUNT(*) > 5;

-- Question 26: L???y ra tr?????ng c?? ??t h??n 4 th???c t???p vi??n tham gia kh??a h???c -----------------------------

SELECT EvaluationNotes, COUNT(EvaluationNotes)
FROM Trainee
GROUP BY EvaluationNotes
HAVING COUNT(*) < 4;

-- Question 27: B?????c 1: L???y ra danh s??ch th??ng tin ID, Fullname, l???p th???c t???p vi??n c?? l???p 'VTI001' ---------------------

SELECT TraineeID, Fullname, TrainingClass
FROM Trainee
WHERE TrainingClass = 'VTI001'

UNION ALL

SELECT TraineeID, Fullname, TrainingClass
FROM Trainee
WHERE TrainingClass = 'VTI002';












