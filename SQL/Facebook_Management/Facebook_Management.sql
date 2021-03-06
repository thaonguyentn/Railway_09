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
                        
-- Ques3: B???n h??y l???y d??? li???u c???a t???t c??? nh??n vi??n ??ang l??m vi???c t???i Vietnam ----------------
                      
SELECT * 
FROM Staff AS S
JOIN Office AS O ON O.OfficeID = S. OfficeID
WHERE O.OfficeID = 'VN001';

--  Ques4: L???y ra ID, FullName, Email, National c???a m???i nh??n vi??n ------------------------

SELECT S.StaffID, S.Email, N.`NationalName`, CONCAT(S.FirstName, S.LastName)
FROM Staff AS S
JOIN Office AS O ON O.OfficeID = S.OfficeID
JOIN `National` AS N ON O.NationalID = N.NationalID;

-- Ques5: L???y ra t??n n?????c m?? nh??n vi??n c?? Email: "daonq@viettel.com.vn" ??ang l??m vi???c -------
WITH CTE_Table1 AS (
SELECT S.StaffID, S.FirstName, S.LastName , S.Email, N.`NationalName`
FROM Office AS O
JOIN `National` AS N ON O.NationalID = N.NationalID
JOIN Staff AS S ON O.OfficeID = S.OfficeID)

 SELECT `NationalName`
 FROM CTE_Table1
 WHERE Email = 'daonq@viettel.com.vn';
 
 -- Ques6: B???n h??y t??m xem tr??n h??? th???ng c?? qu???c gia n??o c?? th??ng tin tr??n h??? th???ng nh??ng
--                      kh??ng c?? nh??n vi??n n??o ??ang l??m vi???c

SELECT N.NationalName, COUNT(S.StaffID) AS number_of_staffs
FROM `National` AS N
LEFT JOIN office AS O ON N.NationalID = O.NationalID
LEFT JOIN Staff AS S ON O.OfficeID = S.OfficeID
GROUP BY N.NationalName
HAVING number_of_staffs = 0;


-- Ques7: Th???ng k?? xem tr??n th??? gi???i c?? bao nhi??u qu???c gia m?? FB ??ang ho???t ?????ng s??? d???ng
-- ti???ng Anh l??m ng??n ng??? ch??nh.--------------------------

SELECT *, COUNT(LanguageMain)
FROM `national`
WHERE LanguageMain = 'English';

-- Ques8: Vi???t l???nh ????? l???y ra th??ng tin nh??n vi??n c?? t??n (First_Name) c?? 10 k?? t???, b???t ?????u b???ng
-- ch??? N v?? k???t th??c b???ng ch??? C.

SELECT * 
FROM Staff
WHERE FirstName LIKE 'N________c';

-- Ques9: B???n h??y t??m tr??n h??? th???ng xem c?? nh??n vi??n n??o ??ang l??m vi???c nh??ng do nh???p khi
-- nh???p li???u b??? l???i m?? nh??n vi??n ???? v???n ch??a cho th??ng tin v??? tr??? s??? l??m vi???c(Office).----- 

SELECT *
FROM Staff
WHERE OfficeID IS NULL;

UPDATE Staff
SET OfficeID = NULL
WHERE StaffID IN(98,99);

-- Ques10: Nh??n vi??n c?? m?? ID =9 hi???n t???i ???? ngh??? vi???c, b???n h??y x??a th??ng tin c???a nh??n vi??n
-- n??y tr??n h??? th???ng ----------

DELETE
FROM Staff
WHERE StaffID = 9;

-- Ques11: FB v?? 1 l?? do n??o ???? kh??ng c??n mu???n ho???t ?????ng t???i Australia n???a, v?? Mark
-- Zuckerberg mu???n b???n x??a t???t c??? c??c th??ng tin tr??n h??? th???ng li??n quan ?????n qu???c gia n??y. H??y
-- t???o 1 Procedure c?? ?????u v??o l?? t??n qu???c gia c???n x??a th??ng tin ????? l??m vi???c n??y v?? g???i l???i cho anh ???y.

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

-- Ques12: Mark mu???n bi???t xem hi???n t???i ??ang c?? bao nhi??u nh??n vi??n tr??n to??n th??? gi???i ??ang----------------
--  l??m vi???c cho anh ???y, h??y vi???t cho anh ???y 1 Function ????? a ???y c?? th??? l???y d??? li???u n??y 1 c??ch nhanh ch??ng.----


-- Ques13: ????? thu???n ti???n cho vi???c qu???n tr??? Mark mu???n s??? l?????ng nh??n vi??n t???i m???i qu???c gia ch??? t???i ??a 10.000 ng?????i. 
-- B???n h??y t???o trigger cho table Staff ch??? cho ph??p insert m???i qu???c gia c?? t???i ??a 10.000 nh??n vi??n gi??p anh ???y ----------------
-- (c?? th??? c???u h??nh s??? l?????ng nh??n vi??n nh??? h??n vd 11 nh??n vi??n ????? Test). -----------------------


-- Ques14: B???n h??y vi???t 1 Procedure ????? l???y ra t??n tr??? s??? m?? c?? s??? l?????ng nh??n vi??n ??ang l??m vi???c nhi???u nh???t. --

-- Ques15: B???n h??y vi???t 1 Function ????? khi nh???p v??o th??ng tin Email c???a nh??n vi??n th?? s??? tr??? ra th??ng tin ?????y ????? c???a nh??n vi??n ????.
-- Ques16: B???n h??y vi???t 1 Trigger ????? khi th???c hi???n c???p nh???t th??ng tin v??? tr??? s??? l??m vi???c c???a nh??n vi??n ???? th?? 
-- h??? th???ng s??? t??? ?????ng l??u l???i tr??? s??? c?? c???a nh??n vi??n v??o 1 b???ng kh??c c?? t??n Log_Office ????? Mark c?? th??? xem l???i khi c???n thi???t. ----------
-- Ques17: FB ??ang v?????ng v??o 1 ?????o lu???t h???n ch??? ho???t ?????ng, FB ch??? c?? th??? ho???t ?????ng t???i ??a
-- ---------tr??n 100 qu???c gia tr??n th??? gi???i, h??y t???o Trigger ????? ng??n ng?????i nh???p li???u nh???p v??o qu???c gia ------------
th??? 101 (b???n c?? th??? s??? d???ng s??? n?????c nh??? h??n ????? Test VD 11 n?????c).


-- Ques18: Th???ng k?? m???i xem m???i n?????c(National) ??ang c?? bao nhi??u nh??n vi??n ??ang l??m vi???c----------------

SELECT N.NationalName, COUNT(S.StaffID) AS NumberOfEmployee
FROM `National` AS N
JOIN Office AS O ON N.NationalID = O.NationalID
JOIN Staff AS S ON S.OfficeID = O.OfficeID
GROUP BY N.NationalName;

-- Ques19: Vi???t Procedure ????? th???ng k?? m???i xem m???i n?????c(National) ??ang c?? bao nhi??u nh??n vi??n ??ang l??m vi???c, v???i ?????u v??o l?? t??n n?????c.

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


-- Ques20: Th???ng k?? m???i xem trong c??ng 1 tr??? s??? (Office) ??ang c?? bao nhi??u employee ??ang l??m vi???c.

SELECT O.OfficeID, COUNT(S.StaffID) AS NumberofEmployee
FROM Office AS O
JOIN Staff AS S ON S.OfficeID = O.OfficeID
GROUP BY O.OfficeID;

-- Ques21: Vi???t Procedure ????? th???ng k?? m???i xem trong c??ng 1 tr??? s??? (Office) ??ang c?? bao nhi??u employee ??ang l??m vi???c ?????u v??o l?? ID c???a tr??? s???. ---

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

-- Ques22: Vi???t Procedure ????? l???y ra t??n qu???c gia ??ang c?? nhi???u nh??n vi??n nh???t -----------------

SELECT NationalName
FROM `National`, 




-- Ques23: Th???ng k?? m???i country c?? bao nhi??u employee ??ang l??m vi???c.

SELECT N.NationalName, COUNT(S.StaffID) AS NumberOfEmployee
FROM `National` AS N
JOIN Office AS O ON N.NationalID = O.NationalID
JOIN Staff AS S ON S.OfficeID = O.OfficeID
GROUP BY N.NationalName;

-- Ques24: B???n h??y c???u h??nh l???i c??c b???ng v?? r??ng bu???c gi??? li???u sao cho khi x??a 1 tr??? s??? l??m
--     vi???c (Office) th?? t???t c??? d??? li???u li??n quan ?????n tr??? s??? n??y s??? chuy???n v??? Null
-- Ques25: B???n h??y c???u h??nh l???i c??c b???ng v?? r??ng bu???c gi??? li???u sao cho khi x??a 1 tr??? s??? l??m
--     vi???c (Office) th?? t???t c??? d??? li???u li??n quan ?????n tr??? s??? n??y s??? b??? x??a h???t.
