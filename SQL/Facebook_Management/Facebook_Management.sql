DROP DATABASE IF EXISTS FacebookManagement;
CREATE DATABASE IF NOT EXISTS FacebookManagement;
USE FacebookManagement;

DROP TABLE IF EXISTS `National`;
CREATE TABLE `National` (
	NationalID				VARCHAR(50) PRIMARY KEY,
	NationalName			NVARCHAR(50) UNIQUE KEY NOT NULL,
	LanguageMain			VARCHAR(50) NOT NULL
    );
    
DROP TABLE IF EXISTS Office;
CREATE TABLE Office(
	OfficeID				VARCHAR(50) PRIMARY KEY,
	StreetAddress			VARCHAR(50) NOT NULL,
	NationalID				VARCHAR(50) NOT NULL,
    FOREIGN KEY(NationalID) REFERENCES `National`(NationalID)
    );
    
DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff(
	StaffID				VARCHAR(50) PRIMARY KEY,
	FirstName			NVARCHAR(50) NOT NULL,
	LastName			NVARCHAR(50) NOT NULL,
	Email				VARCHAR(50) NOT NULL UNIQUE KEY,
	OfficeID			VARCHAR(50),
    FOREIGN KEY(OfficeID) REFERENCES Office(OfficeID)
    );

INSERT INTO `National`  (NationalID	, NationalName		, LanguageMain) 
VALUES                  ('CN'		, 'China'			, 'Chinese'),
						('PH'		, 'Philippines'		, 'English'),
						('RU'		, 'Russia'			, 'Russian'),
						('ID'		, 'Indonesia'		, 'English'),
                        ('BR'		, 'Brazil'			, 'Portuguese'),
						('US'		, 'United States'	, 'English'),
						('FR'		, 'France'			, 'French'),
						('MM'		, 'Myanmar'			, 'Burmese'),
						('PL'		, 'Poland'			, 'Polish'),
						('MX'		, 'Mexico'			, 'Spanish'),
						('DE'		, 'Germany'			, 'German'),
						('AU'		, 'Australia'		, 'AustralianEnglish'),
						('AR'		, 'Argentina'		, 'Spanish'),
						('JP'		, 'Japan'			, 'Japanese'),
						('IT'		, 'Italy'			, 'Italian'),
						('HU'		, 'Hungary'			, 'Hungarian'),
						('IR'		, 'Iran'			, 'Persian'),
						('SE'		, 'Sweden'			, 'Swedish'),
						('VN'		, 'VietNam'			, 'VietNamese'),
                        ('KO'		, 'Korea'			, 'Korean');
						
SELECT *, COUNT(*)
FROM `National`;

INSERT INTO Office  	(OfficeID	, StreetAddress				, NationalID) 
VALUES                  ('CN001'	, 'China'					, 'CN'	),
						('KO002'	,'89Northpor Court'			, 'KO'		),
						('PH001'	, '8PrairieRoseTerrace'		, 'CN'		),
						('RU001'	, '733DeclarationJunction'	, 'US'		),
						('ID001'	, '2893AdGateCircle'		, 'ID'		),
						('BR001'	, '508PackersStreet'		, 'VN'		),
						('US001'	, '18030ServiceCircle'		, 'US'		),
						('FR001'	, '90MitchellParkway'		, 'VN'		),
						('VN001'	, '78DuyTanCauGiayHaNoi'	, 'VN'		),
						('PL001'	, '64953SullivanPlace'		, 'US'		),
						('MX001'	, '71MitchellPoint'			, 'MX'		);
                        
                        
                                                                  
INSERT INTO Staff  		(StaffID	, FirstName			, LastName	,	Email							,OfficeID) 
VALUES					(1			, 'Isis'			, 'Benzie', 'ibenzie0@symantec.com'				, 'CN001'),
						(2			, 'Baron'			, 'Foxall', 'bfoxall1@eepurl.com'				, 'KO002'),
						(3			, 'Meagan'			, 'Readshall', 'mreadshall2@360.cn'				, 'PH001'),
						(4			, 'NguyenDuoc'		, 'Bucky', 'dbucky3@live.com'				, 'RU001'),
						(5			, 'Dorette'			, 'Bampfield', 'dbampfield4@nhs.uk'				, 'ID001'),
						(6			, 'Antonina'		, 'Follen', 'afollen5@php.net'					, 'BR001'),
						(7			, 'Marissa'			, 'Duffie', 'mduffie6@npr.org'					, 'US001'),
						(8			, 'Kalindi'			, 'Hustings', 'khustings7@purevolume.com'		, 'FR001'),
						(9			, 'Llewellyn'		, 'Dwane', 'ldwane8@flickr.com'					, 'VN001'),
						(10			, 'Edmon'		, 'Penylton', 'epenylton9@vinaora.com'				, 'PL001'),
						(11				, 'Richmound'	, 'Ricards', 'rricardsa@google.ru'				, 'MX001'),
						(12				, 'Aurie', 'Cornfield', 'acornfieldb@plala.or.jp'				, 'VN001'),
						(13				, 'Hilly', 'Laise', 'hlaisec@i2i.jp'							, 'KO002'),
						(14				, 'Lydie', 'Stibbs', 'lstibbsd@unc.edu'							, 'PH001'),
						(15				, 'Boonie', 'Wettern', 'bwetterne@cdc.gov'						, 'RU001'),
						(16				, 'Michaelina', 'Trighton', 'mtrightonf@baidu.com'				, 'ID001'),
						(17				, 'Hadley', 'Horribine', 'hhorribineg@tripadvisor.com'			, 'VN001'),
						(18				, 'Artemus', 'Abbotts', 'aabbottsh@wp.com'						, 'US001'),
						(19				, 'Alanson', 'Lothean', 'alotheani@deliciousdays.com'			, 'FR001'),
						(20				, 'Connor', 'Baldree', 'cbaldreej@ft.com'						, 'VN001'),
						(21				, 'Erwin', 'Yakov', 'eyakovk@kickstarter.com'					, 'PL001'),
						(22				, 'Patrick', 'Butner', 'pbutnerl@ifeng.com'						, 'MX001'),
						(23				, 'Richmond', 'Haycox', 'rhaycoxm@prweb.com'					, 'CN001'),
						(24				, 'Etan', 'Ramplee', 'erampleen@cocolog-nifty.com'				, 'KO002'),
						(25				, 'Mirabelle', 'Furmagier', 'mfurmagiero@psu.edu'				, 'PH001'),
						(26				, 'Boigie', 'McVanamy', 'bmcvanamyp@prlog.org'					, 'RU001'),
						(27				, 'Ingra', 'Haddacks', 'ihaddacksq@wikimedia.org'				, 'ID001'),
						(28				, 'Ezmeralda', 'Carrigan', 'ecarriganr@wix.com'					, 'BR001'),
						(29				, 'Zebadiah', 'Drance', 'zdrances@prnewswire.com'				, 'US001'),
						(30				, 'Blakeley', 'Tinklin', 'btinklint@youku.com'					, 'FR001'),
						(31				, 'Mano', 'Toovey', 'mtooveyu@so-net.ne.jp'						, 'VN001'),
						(32				, 'Nefen', 'Philipsen', 'nphilipsenv@slashdot.org'				, 'PL001'),
						(33				, 'Pamelina', 'Shevill', 'pshevillw@tiny.cc'					, 'MX001'),
						(34				, 'Pammie', 'Kastel', 'pkastelx@hc360.com'						, 'MX001'),
						(35				, 'Jasen', 'Twigg', 'jtwiggy@ebay.com'							, 'CN001'),
						(36				, 'Marlon', 'Luxton', 'mluxtonz@reference.com'					, 'KO002'),
						(37				, 'Candida', 'O''Kennavain', 'cokennavain10@webnode.com'		, 'PH001'),
						(38				, 'Gianna', 'Djakovic', 'gdjakovic11@digg.com'					, 'RU001'),
						(39				, 'Ryley', 'Crackel', 'rcrackel12@hubpages.com'					, 'ID001'),
						(40				, 'Tab', 'Northway', 'tnorthway13@ebay.com'						, 'BR001'),
						(41				, 'Win', 'Paulsson', 'wpaulsson14@shutterfly.com'				, 'US001'),
						(42				, 'Vlad', 'Figliovanni', 'vfigliovanni15@yandex.ru'				, 'FR001'),
						(43				, 'Joellyn', 'Whistlecraft', 'jwhistlecraft16@indiatimes.com'	, 'VN001'),
						(44				, 'Alon', 'Larkings', 'alarkings17@networkadvertising.org'		, 'PL001'),
						(45				, 'Koo', 'Martignon', 'kmartignon18@multiply.com'				, 'CN001'),
						(46				, 'Paten', 'Falkingham', 'pfalkingham19@mtv.com'				, 'KO002'),
						(47				, 'Tabbie', 'Pacquet', 'tpacquet1a@360.cn'						, 'PH001'),
						(48				, 'Karyn', 'Skone', 'kskone1b@vimeo.com'						, 'RU001'),
						(49				, 'Darren', 'Ferenczi', 'dferenczi1c@so-net.ne.jp'				, 'ID001'),
						(50				, 'Theodora', 'Twaite', 'ttwaite1d@house.gov'					, 'BR001'),
						(51				, 'Nicky', 'Hullyer', 'nhullyer1e@gravatar.com'					, 'US001'),
						(52				, 'Ashby', 'Flowers', 'aflowers1f@uol.com.br'					, 'FR001'),
						(53				, 'Spence', 'Jordeson', 'sjordeson1g@cisco.com'					, 'VN001'),
						(54				, 'Ely', 'Ogilvy', 'eogilvy1h@hostgator.com'					, 'PL001'),
						(55				, 'Aretha', 'Jocelyn', 'ajocelyn1i@dion.ne.jp'					, 'CN001'),
						(56				, 'Derk', 'Rose', 'drose1j@unc.edu'								, 'KO002'),
						(57				, 'Ignace', 'Kerwen', 'ikerwen1k@nymag.com'						, 'PH001'),
						(58				, 'Minnie', 'Antonowicz', 'mantonowicz1l@163.com'				, 'RU001'),
						(59				, 'Stacey', 'Balaison', 'sbalaison1m@discovery.com'				, 'ID001'),
						(60				, 'Etan', 'Prate', 'eprate1n@sciencedirect.com'					, 'BR001'),
						(61				, 'Hadleigh', 'Hobell', 'hhobell1o@bloglines.com'				, 'US001'),
						(62				, 'Lian', 'Crooke', 'lcrooke1p@etsy.com'						, 'FR001'),
						(63				, 'Dao', 'Nguyen', 'daonq@viettel.com.vn'						, 'VN001'),
						(64				, 'Florrie', 'Barnet', 'fbarnet1r@ebay.co.uk'					, 'PL001'),
						(65				, 'Hersch', 'Jurs', 'hjurs1s@shareasale.com'					, 'CN001'),
						(66				, 'Crosby', 'Wareing', 'cwareing1t@prweb.com'					, 'KO002'),
						(67				, 'Nicola', 'Dunsford', 'ndunsford1u@webnode.com'				, 'PH001'),
						(68				, 'Wyatt', 'Cesco', 'wcesco1v@webeden.co.uk'					, 'RU001'),
						(69				, 'Sergent', 'Strutz', 'sstrutz1w@noaa.gov'						, 'ID001'),
						(70				, 'Doralynn', 'Kemble', 'dkemble1x@hostgator.com'				, 'BR001'),
						(71				, 'Tobias', 'Dunkerton', 'tdunkerton1y@nih.gov'					, 'US001'),
						(72				, 'Petey', 'Inkpin', 'pinkpin1z@uiuc.edu'						, 'FR001'),
						(73				, 'Winni', 'Croisdall', 'wcroisdall20@gnu.org'					, 'VN001'),
						(74				, 'Gradey', 'Lenahan', 'glenahan21@arstechnica.com'				, 'PL001'),
						(75				, 'Georgie', 'Buntin', 'gbuntin22@craigslist.org'				, 'CN001'),
						(76				, 'Frankie', 'Marshalleck', 'fmarshalleck23@csmonitor.com'		, 'KO002'),
						(77				, 'Alon', 'Stiegers', 'astiegers24@illinois.edu'				, 'PH001'),
						(78				, 'Nicoline', 'Beart', 'nbeart25@goo.ne.jp'						, 'RU001'),
						(79				, 'Giraldo', 'Clausen', 'gclausen26@godaddy.com'				, 'ID001'),
						(80				, 'Guillermo', 'Newbatt', 'gnewbatt27@cam.ac.uk'				, 'BR001'),
						(81				, 'Clementina', 'Guisler', 'cguisler28@technorati.com'			, 'US001'),
						(82				, 'Laurie', 'Snead', 'lsnead29@hud.gov'							, 'FR001'),
						(83				, 'Ricoriki', 'Johnys', 'rjohnys2a@hostgator.com'				, 'VN001'),
						(84				, 'Abra', 'Stearn', 'astearn2b@bbc.co.uk'						, 'PL001'),
						(85				, 'Paige', 'Truter', 'ptruter2c@bbc.co.uk'						, 'CN001'),
						(86				, 'Tristan', 'De Castri', 'tdecastri2d@loc.gov'					, 'KO002'),
						(87				, 'Sherm', 'Anderbrugge', 'sanderbrugge2e@state.gov'			, 'PH001'),
						(88				, 'Marja', 'Ownsworth', 'mownsworth2f@indiegogo.com'			, 'RU001'),
						(89				, 'Tadeas', 'MacGilrewy', 'tmacgilrewy2g@samsung.com'			, 'ID001'),
						(90				, 'Louella', 'Colthard', 'lcolthard2h@deliciousdays.com'		, 'BR001'),
						(91				, 'Caty', 'Duchateau', 'cduchateau2i@gizmodo.com'				, 'US001'),
						(92				, 'Karoly', 'Axton', 'kaxton2j@4shared.com'						, 'FR001'),
						(93				, 'Gradeigh', 'Stede', 'gstede2k@arizona.edu'					, 'VN001'),
						(94				, 'Cathrine', 'Hartless', 'chartless2l@cnet.com'				, 'PL001'),
						(95				, 'Winfield', 'Alabone', 'walabone2m@taobao.com'				, 'US001'),
						(96				, 'Frederigo', 'Cuell', 'fcuell2n@histats.com'					, 'ID001'),
						(97				, 'Hilario', 'Whiscard', 'hwhiscard2o@tripod.com' 				, 'ID001'),
						(98				, 'Aurelia', 'Pilgram', 'apilgram2p@yahoo.co.jp'				, 'US001'),
						(99				, 'Olly', 'Normanton', 'onormanton2q@chronoengine.com'			, 'ID001'),
						(100			, 'Robinett', 'Elbourn', 'relbourn2r@yellowbook.com'			, 'US001');
                        
-- Ques3: Bạn hãy lấy dữ liệu của tất cả nhân viên đang làm việc tại Vietnam ----------------
                      
SELECT * 
FROM Staff AS S
JOIN Office AS O ON O.OfficeID = S. OfficeID
WHERE O.OfficeID = 'VN001';

--  Ques4: Lấy ra ID, FullName, Email, National của mỗi nhân viên ------------------------

SELECT S.StaffID, S.Email, N.`NationalName`, CONCAT(S.FirstName, S.LastName)
FROM Staff AS S
JOIN Office AS O ON O.OfficeID = S.OfficeID
JOIN `National` AS N ON O.NationalID = N.NationalID;

-- Ques5: Lấy ra tên nước mà nhân viên có Email: "daonq@viettel.com.vn" đang làm việc -------
WITH CTE_Table1 AS (
SELECT S.StaffID, S.FirstName, S.LastName , S.Email, N.`NationalName`
FROM Office AS O
JOIN `National` AS N ON O.NationalID = N.NationalID
JOIN Staff AS S ON O.OfficeID = S.OfficeID)

 SELECT `NationalName`
 FROM CTE_Table1
 WHERE Email = 'daonq@viettel.com.vn';
 
 -- Ques6: Bạn hãy tìm xem trên hệ thống có quốc gia nào có thông tin trên hệ thống nhưng
--                      không có nhân viên nào đang làm việc

SELECT N.NationalName, COUNT(S.StaffID) AS number_of_staffs
FROM `National` AS N
LEFT JOIN office AS O ON N.NationalID = O.NationalID
LEFT JOIN Staff AS S ON O.OfficeID = S.OfficeID
GROUP BY N.NationalName
HAVING number_of_staffs = 0;


-- Ques7: Thống kê xem trên thế giới có bao nhiêu quốc gia mà FB đang hoạt động sử dụng
-- tiếng Anh làm ngôn ngữ chính.--------------------------

SELECT *, COUNT(LanguageMain)
FROM `national`
WHERE LanguageMain = 'English';

-- Ques8: Viết lệnh để lấy ra thông tin nhân viên có tên (First_Name) có 10 ký tự, bắt đầu bằng
-- chữ N và kết thúc bằng chữ C.

SELECT * 
FROM Staff
WHERE FirstName LIKE 'N________c';

-- Ques9: Bạn hãy tìm trên hệ thống xem có nhân viên nào đang làm việc nhưng do nhập khi
-- nhập liệu bị lỗi mà nhân viên đó vẫn chưa cho thông tin về trụ sở làm việc(Office).----- 

SELECT *
FROM Staff
WHERE OfficeID IS NULL;

UPDATE Staff
SET OfficeID = NULL
WHERE StaffID IN(98,99);

-- Ques10: Nhân viên có mã ID =9 hiện tại đã nghỉ việc, bạn hãy xóa thông tin của nhân viên
-- này trên hệ thống ----------

DELETE
FROM Staff
WHERE StaffID = 9;

-- Ques11: FB vì 1 lý do nào đó không còn muốn hoạt động tại Australia nữa, và Mark
-- Zuckerberg muốn bạn xóa tất cả các thông tin trên hệ thống liên quan đến quốc gia này. Hãy
-- tạo 1 Procedure có đầu vào là tên quốc gia cần xóa thông tin để làm việc này và gửi lại cho anh ấy.

DELETE
FROM `National`
WHERE NationalID = NationalName;

DROP PROCEDURE IF EXISTS sp_DeleteNational;
DELIMITER $$
CREATE PROCEDURE sp_DeleteNational(IN in_NameCountry VARCHAR(50))
BEGIN
	DELETE
	FROM `National`
	WHERE NationalName = in_NameCountry;

END$$
DELIMITER 

Call sp_DeleteNational('Brazil');  

-- Ques12: Mark muốn biết xem hiện tại đang có bao nhiêu nhân viên trên toàn thế giới đang----------------
--  làm việc cho anh ấy, hãy viết cho anh ấy 1 Function để a ấy có thể lấy dữ liệu này 1 cách nhanh chóng.----


-- Ques13: Để thuận tiện cho việc quản trị Mark muốn số lượng nhân viên tại mỗi quốc gia chỉ tối đa 10.000 người. 
-- Bạn hãy tạo trigger cho table Staff chỉ cho phép insert mỗi quốc gia có tối đa 10.000 nhân viên giúp anh ấy ----------------
-- (có thể cấu hình số lượng nhân viên nhỏ hơn vd 11 nhân viên để Test). -----------------------


-- Ques14: Bạn hãy viết 1 Procedure để lấy ra tên trụ sở mà có số lượng nhân viên đang làm việc nhiều nhất. --

-- Ques15: Bạn hãy viết 1 Function để khi nhập vào thông tin Email của nhân viên thì sẽ trả ra thông tin đầy đủ của nhân viên đó.
-- Ques16: Bạn hãy viết 1 Trigger để khi thực hiện cập nhật thông tin về trụ sở làm việc của nhân viên đó thì 
-- hệ thống sẽ tự động lưu lại trụ sở cũ của nhân viên vào 1 bảng khác có tên Log_Office để Mark có thể xem lại khi cần thiết. ----------
-- Ques17: FB đang vướng vào 1 đạo luật hạn chế hoạt động, FB chỉ có thể hoạt động tối đa
-- ---------trên 100 quốc gia trên thế giới, hãy tạo Trigger để ngăn người nhập liệu nhập vào quốc gia ------------
thứ 101 (bạn có thể sử dụng số nước nhỏ hơn để Test VD 11 nước).


-- Ques18: Thống kê mỗi xem mỗi nước(National) đang có bao nhiêu nhân viên đang làm việc----------------

SELECT N.NationalName, COUNT(S.StaffID) AS NumberOfEmployee
FROM `National` AS N
JOIN Office AS O ON N.NationalID = O.NationalID
JOIN Staff AS S ON S.OfficeID = O.OfficeID
GROUP BY N.NationalName;

-- Ques19: Viết Procedure để thống kê mỗi xem mỗi nước(National) đang có bao nhiêu nhân viên đang làm việc, với đầu vào là tên nước.

DROP PROCEDURE IF EXISTS sp_GetNumberStaffOfNational;
DELIMITER $$
CREATE PROCEDURE sp_GetNumberStaffOfNational(IN in_NameCountry VARCHAR(50))
BEGIN
	SELECT N.NationalName, COUNT(S.StaffID) AS NumberOfEmployee
	FROM `National` AS N
	JOIN Office AS O ON N.NationalID = O.NationalID
	JOIN Staff AS S ON S.OfficeID = O.OfficeID
    WHERE N.NationalName = in_NameCountry
	GROUP BY N.NationalName;  

END$$
DELIMITER 

Call sp_GetNumberStaffOfNational('Brazil');  


-- Ques20: Thống kê mỗi xem trong cùng 1 trụ sở (Office) đang có bao nhiêu employee đang làm việc.

SELECT O.OfficeID, COUNT(S.StaffID) AS NumberofEmployee
FROM Office AS O
JOIN Staff AS S ON S.OfficeID = O.OfficeID
GROUP BY O.OfficeID;

-- Ques21: Viết Procedure để thống kê mỗi xem trong cùng 1 trụ sở (Office) đang có bao nhiêu employee đang làm việc đầu vào là ID của trụ sở. ---

DROP PROCEDURE IF EXISTS sp_GetAStaffromOffice;
DELIMITER $$
CREATE PROCEDURE sp_GetAStaffromOffice(IN in_OfficeID VARCHAR(50))
BEGIN
	SELECT O.OfficeID, COUNT(S.StaffID) AS NumberofEmployee
	FROM Office AS O
	JOIN Staff AS S ON S.OfficeID = O.OfficeID
    WHERE O.OfficeID = in_OfficeID
    GROUP BY O.OfficeID;
	
END$$
DELIMITER 

Call sp_GetAStaffromOffice('BR001');    

-- Ques22: Viết Procedure để lấy ra tên quốc gia đang có nhiều nhân viên nhất -----------------

SELECT NationalName
FROM `National`, 




-- Ques23: Thống kê mỗi country có bao nhiêu employee đang làm việc.

SELECT N.NationalName, COUNT(S.StaffID) AS NumberOfEmployee
FROM `National` AS N
JOIN Office AS O ON N.NationalID = O.NationalID
JOIN Staff AS S ON S.OfficeID = O.OfficeID
GROUP BY N.NationalName;

-- Ques24: Bạn hãy cấu hình lại các bảng và ràng buộc giữ liệu sao cho khi xóa 1 trụ sở làm
--     việc (Office) thì tất cả dữ liệu liên quan đến trụ sở này sẽ chuyển về Null
-- Ques25: Bạn hãy cấu hình lại các bảng và ràng buộc giữ liệu sao cho khi xóa 1 trụ sở làm
--     việc (Office) thì tất cả dữ liệu liên quan đến trụ sở này sẽ bị xóa hết.
