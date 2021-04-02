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
                        
-- Question 3: Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả ----------------

	-- Error Code: 3819. Check constraint 'ETGmath_KIEMTRA' is violated --
					
-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20 -----------------------------------

SELECT * 
FROM Trainee
WHERE ETIQ >= 12 AND ETGmath >= 12 AND ETEnglish >= 12
ORDER BY BirthDate DESC; 

-- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc bằng chữ C -------------

SELECT * 
FROM Trainee
WHERE FullName LIKE "N%C";

-- Question 6: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G --------------------------
 
SELECT * 
FROM Trainee
WHERE FullName LIKE "_G%";

-- Question 7: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là C -------------

SELECT *
FROM Trainee
WHERE FullName LIKE "_________c";

-- Question 8: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng nhau. ---------------------

SELECT DISTINCT FullName
FROM Trainee;

-- Question 9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này theo thứ tự từ A-Z. ---------
    
SELECT FullName
FROM Trainee
ORDER BY FullName ASC;   

--   Question 10: Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất --------------------------------

SELECT *
FROM Trainee
WHERE Char_Length(Fullname) = 
						(SELECT MAX(Char_Length(Fullname)) FROM Trainee);


-- Question 11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất -------------------

SELECT TraineeID, FullName, BirthDate
FROM Trainee
WHERE Char_Length(Fullname) = 
						(SELECT MAX(Char_Length(Fullname)) FROM Trainee);

-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất --------------

SELECT FullName, ETIQ, ETGmath, ETEnglish
FROM Trainee
WHERE Char_Length(Fullname) =
							(SELECT MAX(Char_Length(Fullname)) FROM Trainee);

-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất -------------------------------

SELECT *
FROM Trainee
ORDER BY BirthDate DESC
LIMIT 5;

-- Question 15: Xóa thực tập sinh có TraineeID = 5 ---------------------------------------------------------------

DELETE 
FROM Trainee
WHERE TraineeID = 5;

-- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15 -----------------------------------------------

DELETE 
FROM Trainee
WHERE (ETIQ + ETGmath) <=15;

-- Question 17: Xóa thực tập sinh quá 30 tuổi ---------------------------

DELETE 
FROM Trainee
WHERE BirthDate < '1991-01-01';

-- Question 18: Thực tập sinh có TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật thông tin vào database ----------------------------

UPDATE Trainee
SET TrainingClass = "VTI003"
WHERE TraineeID = 3;

-- Question 19: Do có sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai, hãy cập nhật lại tên thành “LeVanA”
-- , điểm ET_IQ =10, điểm ET_Gmath =15, điểm ET_English = 30. --------------

UPDATE Trainee
SET FullName = 'LeVanA', ETIQ =10, ETGmath =15, ETEnglish = 30
WHERE TraineeID = 10;

-- Question 20: Đếm xem trong lớp VTI001 có bao nhiêu thực tập sinh -------------------------

SELECT *, COUNT(*) AS 'Number'
FROM Trainee
WHERE TrainingClass ='VTI001';

-- Question 22: Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập sinh. -----------------

SELECT TrainingClass, COUNT (TraineeID) AS number_of_trainees
FROM Trainee
WHERE (TrainingClass ='VTI001') OR (TrainingClass ='VTI003')
GROUP BY TrainingClass;

-- Question 23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown -----------------------------------

SELECT Gender, COUNT(*)
FROM Trainee
GROUP BY Gender;

-- Question 24: Lấy ra lớp có lớn hơn 5 thực tập viên ---------

SELECT TrainingClass, COUNT(TrainingClass)
FROM Trainee
GROUP BY TrainingClass
HAVING COUNT(*) > 5;

-- Question 26: Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học -----------------------------

SELECT EvaluationNotes, COUNT(EvaluationNotes)
FROM Trainee
GROUP BY EvaluationNotes
HAVING COUNT(*) < 4;

-- Question 27: Bước 1: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI001' ---------------------

SELECT TraineeID, Fullname, TrainingClass
FROM Trainee
WHERE TrainingClass = 'VTI001'

UNION ALL

SELECT TraineeID, Fullname, TrainingClass
FROM Trainee
WHERE TrainingClass = 'VTI002';












