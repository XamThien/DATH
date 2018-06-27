DROP DATABASE IF EXISTS dath;
CREATE DATABASE dath DEFAULT CHARACTER SET utf8 ;
USE dath;
CREATE TABLE PG_CATEGORIES(
	 CATEGORY_ID INT AUTO_INCREMENT PRIMARY KEY,
	 CATEGORY_NAME VARCHAR(100) NOT NULL,
	 DESCRIPTION VARCHAR(300),
	 SORT_INDEX INT NOT NULL,
	 CATEGORY_STATUS INT NOT NULL DEFAULT 1
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_CATEGORIES(CATEGORY_NAME, DESCRIPTION, SORT_INDEX) VALUES ('Quần short','',1);

	
CREATE TABLE PG_ROLES(
	ROLE_ID INT AUTO_INCREMENT PRIMARY KEY,
	ROLE_NAME VARCHAR(100) NOT NULL,
	PARENT INT
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;
	INSERT INTO PG_ROLES(ROLE_NAME,PARENT) VALUE ('ADMIN',0);
	INSERT INTO PG_ROLES(ROLE_NAME,PARENT) VALUE ('Employee',0);
    INSERT INTO PG_ROLES(ROLE_NAME,PARENT) VALUE ('Customer',0);
    
CREATE TABLE PG_MODULES(
	MODULE_ID INT AUTO_INCREMENT PRIMARY KEY,
	MODULE_NAME VARCHAR(100) NOT NULL,
	PARENT INT,
    MODULE_STATUS INT DEFAULT 1
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

	INSERT INTO PG_MODULES(MODULE_NAME,PARENT) VALUE ('Quản lý sản phẩm',0),
													('Quản lý danh mục',1),
													('Quản lý hàng hóa',1),
													('Quản lý nhà cung cấp',1),
													('Quản lý đơn hàng',0),
													('Quản lý khuyến mãi',0),
													('Quản lý tài khoản',0),
													('Quản lý phân quyền',0),
													('Phân quyền',8),
													('Quản lý danh mục chức năng',8);
CREATE TABLE PG_USERS(
	RECORD_ID INT AUTO_INCREMENT PRIMARY KEY,
	USER_ID VARCHAR(50) UNIQUE NOT NULL,
	FIRST_NAME VARCHAR(50) NOT NULL,
	LAST_NAME VARCHAR (50) NOT NULL,
	ADDRESS VARCHAR(100),
	PHONE_NUMBER VARCHAR(20) NOT NULL,
	CARD_ID VARCHAR(20),
	EMAIL VARCHAR(100),
	SEX TINYINT(1) DEFAULT 0,
	USER_PASSWORD VARCHAR(50) NOT NULL,
	ROLE_ID INT NOT NULL,
	CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFIED_TIME DATETIME,
	USER_STATUS INT NOT NULL DEFAULT 1,
	FOREIGN KEY (ROLE_ID) REFERENCES PG_ROLES(ROLE_ID)
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_USERS(USER_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER, USER_PASSWORD,ROLE_ID) 
VALUES ('admin','admin','painandgain','12345677874','admin',1),
		('khachhang', 'khach','hang','032658795','khachhang',3);
-- LOG ACTION
CREATE TABLE PG_LOG(
	LOG_ID INT AUTO_INCREMENT PRIMARY KEY,
	EMPLOYEE_ID INT NOT NULL,
	CREATED_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
	DESCRIPTION VARCHAR(300) NOT NULL,
	LOG_VALUE VARCHAR(300) NOT NULL,
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES PG_USERS(RECORD_ID)
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_LOG(EMPLOYEE_ID, DESCRIPTION, LOG_VALUE) 
VALUES (1,'add new procedure','ao thun dai tay');

CREATE TABLE PG_SUPPLIERS(
	SUPPLIER_ID INT AUTO_INCREMENT PRIMARY KEY,
	COMPANY_NAME VARCHAR(100) NOT NULL,
	CONTACT_NAME VARCHAR(100) NOT NULL,
	ADDRESS VARCHAR(100),
	REGION VARCHAR(100),
	PHONE VARCHAR(20) NOT NULL,
	EMAIL VARCHAR(100),
	SUPPLIER_STATUS INT DEFAULT 1
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_SUPPLIERS(COMPANY_NAME, CONTACT_NAME, PHONE) 
VALUES ('Công ty Thiên Trường','Trịnh Lan Hương','01254879635');

CREATE TABLE PG_PRODUCTS(
	PRODUCT_ID INT AUTO_INCREMENT PRIMARY KEY,
	PRODUCT_NAME VARCHAR(100) NOT NULL,
	SUPPLIER_ID INT NOT NULL,
	CATEGORY_ID INT NOT NULL,
	QUANTITY INT DEFAULT 0 NOT NULL CHECK(QUANTITY>=0),
	UNIT_PRICE INT DEFAULT 0 NOT NULL CHECK(UNIT_PRICE>=0),
	UNIT_ORDER INT DEFAULT 0 NOT NULL CHECK(UNIT_ORDER>=0),
	DESCRIPTION VARCHAR(300),
	PRODUCT_STATUS INT DEFAULT 1 NOT NULL,
	CREATE_TIME DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFIED_TIME DATETIME,
	IS_NEW TINYINT(1) DEFAULT 1,
	IS_HOT TINYINT(1) DEFAULT 1,
	FOREIGN KEY (SUPPLIER_ID) REFERENCES PG_SUPPLIERS(SUPPLIER_ID),
	FOREIGN KEY (CATEGORY_ID) REFERENCES PG_CATEGORIES(CATEGORY_ID)
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_PRODUCTS(PRODUCT_NAME, SUPPLIER_ID, CATEGORY_ID, QUANTITY, UNIT_PRICE, UNIT_ORDER) 
VALUES ('Áo thun dài tay',1,1,20,50000,75000);

-- SP KHUYEN MAI
CREATE TABLE PG_PRODUCT_SALES(
	SALE_ID INT AUTO_INCREMENT PRIMARY KEY,
	PRODUCT_ID INT NOT NULL,
	START_DATE DATETIME NOT NULL,
	END_DATE DATETIME NOT NULL CHECK(END_DATE >= START_DATE),
	SALE_VALUE INT NOT NULL,
	IS_PERCENT TINYINT(1) DEFAULT 0,
	SALES_STATUS INT DEFAULT 1,
	FOREIGN KEY (PRODUCT_ID) REFERENCES PG_PRODUCTS(PRODUCT_ID)
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE PG_PRODUCT_PICTURES(
	PICTURE_SET_ID INT AUTO_INCREMENT PRIMARY KEY,
	PATH VARCHAR(300) NOT NULL,
	PICTURE_TYPE VARCHAR(20),
	PICTURE_STATUS INT DEFAULT 1,
	PRODUCT_ID INT NOT NULL,
	ORDER_INDEX INT NOT NULL,
	FOREIGN KEY (PRODUCT_ID) REFERENCES PG_PRODUCTS(PRODUCT_ID)
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;


-- PHAN QUYEN NG DUNG VOI CAC CHUC NANG
CREATE TABLE PG_ROLE_PERMISSION(
	PERMISSION_ID INT AUTO_INCREMENT PRIMARY KEY,
	ROLE_ID INT NOT NULL,
	MODULE_ID INT NOT NULL,
	IS_INSERT TINYINT(1) DEFAULT 0,
	IS_UPDATE TINYINT(1) DEFAULT 0,
	
	IS_READ TINYINT(1) DEFAULT 0,
	PER_STATUS INT DEFAULT 1,
	DESCRIPTION VARCHAR(200),
	FOREIGN KEY (ROLE_ID) REFERENCES PG_ROLES(ROLE_ID),
	FOREIGN KEY (MODULE_ID) REFERENCES PG_MODULES(MODULE_ID)
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_ROLE_PERMISSION(ROLE_ID, MODULE_ID, IS_INSERT,IS_UPDATE,IS_READ) 
VALUES (1,1,1,1,1),(1,2,1,1,1),(1,3,1,1,1),(1,4,1,1,1),(1,5,1,1,1),(1,6,1,1,1),(1,7,1,1,1),(1,8,1,1,1),(1,9,1,1,1),(1,10,1,1,1)
	,(2,2,1,1,1),(2,3,1,1,1),(2,4,1,1,1),(2,5,1,1,1),(2,6,1,1,1);

CREATE TABLE PG_ORDER_STATUS(
	
	ORDER_STATUS_KEY INT NOT NULL PRIMARY KEY,
	ORDER_STATUS_NAME VARCHAR(50) NOT NULL
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_ORDER_STATUS(ORDER_STATUS_KEY,ORDER_STATUS_NAME) VALUES
	(0,'Hủy'),(1,'Đang xử lý tiếp nhận'),(2,'Đang giao hàng'),(3,'Hoàn thành');

-- DAT HANG
CREATE TABLE PG_ORDERS(
	ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
	CUSTOMER_ID INT NOT NULL,
	
	ORDER_DATE DATETIME,
	APPROVED_DATE DATETIME, 
	ORDER_STATUS_KEY INT DEFAULT 1,
	SHIP_NAME VARCHAR(100),
	SHIP_ADDRESS VARCHAR(300),
	SHIP_PHONE VARCHAR(20),
	
	FOREIGN KEY (CUSTOMER_ID) REFERENCES PG_USERS(RECORD_ID),
	FOREIGN KEY (ORDER_STATUS_KEY) REFERENCES PG_ORDER_STATUS(ORDER_STATUS_KEY)
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_ORDERS(CUSTOMER_ID,ORDER_DATE,APPROVED_DATE,ORDER_STATUS_KEY,SHIP_NAME,SHIP_ADDRESS,SHIP_PHONE) 
VALUES (2,'2018-6-22','2018-6-24',0,'Anh khánh','102 Trường CHinh','01662108386'),
	(2,'2018-6-20','2018-6-24',2,'Anh minh','102 Trường CHinh','0979954345'),
    (2,'2018-6-19','2018-6-24',3,'Anh long','102 Trường CHinh','016623477');

-- CHI TIET DAT HANG
CREATE TABLE PG_ORDER_DETAILS(
	ORDER_DETAIL_ID INT AUTO_INCREMENT PRIMARY KEY,
	ORDER_ID INT NOT NULL,
	PRODUCT_ID INT NOT NULL,
	AMOUNT INT NOT NULL DEFAULT 1 CHECK(AMOUNT>=1),
	UNIT_PRICE INT NOT NULL DEFAULT 0 CHECK( UNIT_PRICE>=0),
	UNIT_SALE INT NOT NULL DEFAULT 0 CHECK( UNIT_SALE>=0),
	FOREIGN KEY (PRODUCT_ID) REFERENCES PG_PRODUCTS(PRODUCT_ID),
	FOREIGN KEY (ORDER_ID) REFERENCES PG_ORDERS(ORDER_ID)
)ENGINE = INNODB
DEFAULT CHARACTER SET = utf8;

INSERT INTO PG_ORDER_DETAILS(ORDER_ID, PRODUCT_ID,AMOUNT,UNIT_PRICE,UNIT_SALE) 
VALUES (2,1,2,75000,15000),(3,1,2,75000,15000);
 
INSERT INTO PG_ORDER_DETAILS(ORDER_ID, PRODUCT_ID,AMOUNT,UNIT_PRICE,UNIT_SALE) 
VALUES (1,1,2,75000,15000);
UPDATE pg_orders SET pg_orders.ORDER_STATUS_KEY=0 WHERE pg_orders.ORDER_ID=1;
 
 
 INSERT INTO `pg_categories`(`CATEGORY_NAME`,`DESCRIPTION`,`SORT_INDEX`,`CATEGORY_STATUS`) 
VALUES('Áo cầu thủ','Giá Áo cầu thủ adidas',2,1)
,('Quần đùi thể thao','Quần đùi thể thao adidas',4,1)
,('Quần short thể thao','Quần short thể thao adidas',5,1)
,('Vớ thể thao','Vớ thể thao adidas',6,1)
,('Phụ kiện thể thao','Phụ kiện thể thao adidas',7,1)
,('Áo ngực thể thao','Áo ngực thể thao adidas',8,1);


INSERT INTO pg_users(`USER_ID`,`FIRST_NAME`,`LAST_NAME`,`PHONE_NUMBER`,`CARD_ID`,`EMAIL`,`SEX`,`USER_PASSWORD`,`ROLE_ID`,`CREATE_TIME`,`MODIFIED_TIME`,`USER_STATUS`)
VALUES('chieudt','Dang','Tien Chieu','01695038385','063402177','dangtien@gmail.com',1,'a38511967@',1,CURDATE(),CURDATE(),1)
,('chieunv','Dang','Tien Chieu','01695038385','063402177','dangtien@gmail.com',1,'a38511967@',2,CURDATE(),CURDATE(),1)
,('chieukh','Dang','Tien Chieu','01695038385','063402177','dangtien@gmail.com',1,'a38511967@',3,CURDATE(),CURDATE(),1);

INSERT INTO `pg_suppliers`(`COMPANY_NAME`,`CONTACT_NAME`,`ADDRESS`,`REGION`,`PHONE`,`EMAIL`,`SUPPLIER_STATUS`)
VALUES('Cám cò PTHDPT cổ phần Đầu tư','Hai bà trưng - Hà nội','213 Trường chinh - Hà nội','Hà nội','032813237','camco@camco.com',1),
('Quần áo phụ kiện DTC','Hai bà trưng - Hà nội','215 Trường chinh - Hà nội','Hà nội','0328342357','dtc@camco.com',1),
('Quần đùi messi','Hai bà trưng - Hà nội','245 Trường chinh - Hà nội','Hà nội','043568374','messi@quandui.com',1),
('Áo ngực độn VTKC','Hai bà trưng - Hà nội','10 Trường chinh - Hà nội','Hà nội','0435613237','vukhanhchi@aonguc.com',1);

INSERT INTO `pg_products`(`PRODUCT_NAME`,`SUPPLIER_ID`,`CATEGORY_ID`,`QUANTITY`,`UNIT_PRICE`,`UNIT_ORDER`,`DESCRIPTION`,`PRODUCT_STATUS`,`CREATE_TIME`,`MODIFIED_TIME`,`IS_NEW`,`IS_HOT`)
VALUES('CP SPORT',1,1,20,99000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('BỈ ĐỎ SÂN NHÀ WORLD CUP',1,1,20,99000,30000,'BỘ QUẦN ÁO ĐÁ BANH BỈ ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('BỒ ĐÀO NHA ĐEN TRAINING WORLD CUP',1,1,20,99000,30000,'BỘ QUẦN ÁO ĐÁ BANH BỒ ĐÀO NHA ĐEN TRAINING WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('CP NHẬT XANH',1,1,20,99000,30000,'Bộ Quần Áo Đá Banh CP NHẬT XANH 2017',1,CURDATE(),CURDATE(),1,0)
,('NEWPOINTCO',1,1,20,99000,30000,'Bộ đồ đá banh Real 2017-2018 CPSports (Đen)',1,CURDATE(),CURDATE(),1,0)
,('FIGO',1,1,20,99000,30000,'Bộ Đồ Đá Banh Figo Marseille Sân Nhà (Trắng)',1,CURDATE(),CURDATE(),1,0)

,('SPORTLINK',2,2,20,99000,30000,'BỘ QUẦN ÁO ĐÁ BANH NHẬT BÍCH SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('SET BỘ THỂ THAO NAM P9000 CAO CẤP',2,2,20,66000,30000,'SET BỘ THỂ THAO NAM P9000 CAO CẤP',1,CURDATE(),CURDATE(),1,0)
,('bộ thể thao nam hàng chất lượng hot',2,2,20,70000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('CP SPORT',2,2,20,50000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)

,('Set bộ đồ quần áo thể thao nam Uni ',3,3,20,99000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('BỘ THỂ THAO NAM P5000 VẢI MÈ SIÊU THOÁNG 4 MÀU',3,3,20,88000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('Quần áo đá banh đội tuyển Đức World Cup 2018',3,3,20,77000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('SET BỘ THỂ THAO NAM PHỐI SỌC ',3,3,20,55000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)

,('Set quần áo thể thao nam nữ chữ Mỹ GO! FORWARD ML37',4,4,20,45000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('ĐỒ THỂ THAO EROS - BARCE LEGEND',4,4,20,100000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('Set bộ đồ quần áo thể thao nam U&A ',4,4,20,90000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('BỘ QUẦN ÁO THỂ THAO NAM ',4,4,20,230000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)

,('(Giảm đến 50%) Áo thể thao nam cao ',4,5,20,123000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('Set quần áo thể thao nam nữ đơn giản đẹp rạng ngời ML82',4,5,20,234000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('bộ đồ thể thao nam chất lượng tôt thoát khí TT142',4,5,20,60000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('Bộ quần áo đá banh - đá bóng đội ',4,5,20,69000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)

,('Quần áo thủ môn Việt Nam xanh lá tay dài Bùi Tiến Dũng 2018',4,6,20,56000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('Bộ đồ quần áo đá banh - bóng đội tuyển Đức màu trắng Wolrd cup 2018',4,6,20,67000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0)
,('ĐỒ THỂ THAO EROS - MU LEGEND',4,6,20,87000,30000,'BỘ QUẦN ÁO ĐÁ BANH TÂY BAN NHA ĐỎ SÂN NHÀ WORLD CUP 2018',1,CURDATE(),CURDATE(),1,0);


INSERT INTO pg_product_sales(`PRODUCT_ID`,`START_DATE`,`END_DATE`,`SALE_VALUE`,`IS_PERCENT`,`SALES_STATUS`)
VALUES(1,'2018-06-01','2018-06-30',10,1,1)
,(2,'2018-06-01','2018-06-30',20,1,1)
,(3,'2018-06-01','2018-06-30',30,1,1)
,(10,'2018-06-01','2018-06-30',80,1,1)
,(23,'2018-06-01','2018-06-30',60,1,1)
,(12,'2018-06-01','2018-06-30',20000,0,1)
,(4,'2018-06-01','2018-06-30',10000,0,1)
,(9,'2018-06-01','2018-06-30',20000,0,1)
,(15,'2018-06-01','2018-06-30',10000,0,1)
,(11,'2018-06-01','2018-06-30',10,1,1);

INSERT INTO pg_product_pictures(`PATH`,`PICTURE_TYPE`,`PICTURE_STATUS`,`PRODUCT_ID`,`ORDER_INDEX`)
VALUES('/site/layouts/images/shop/product12.jpg',1,1,1,1)
,('/site/layouts/images/shop/product7.jpg',1,1,2,1)
,('/site/layouts/images/shop/product8.jpg',1,1,3,1)
,('/site/layouts/images/shop/product9.jpg',1,1,4,1)
,('/site/layouts/images/shop/product10.jpg',1,1,5,1)
,('/site/layouts/images/shop/product11.jpg',1,1,6,1)
,('/site/layouts/images/shop/product12.jpg',1,1,7,1)
,('/site/layouts/images/shop/product7.jpg',1,1,8,1)
,('/site/layouts/images/shop/product8.jpg',1,1,9,1)
,('/site/layouts/images/shop/product9.jpg',1,1,10,1)
,('/site/layouts/images/shop/product10.jpg',1,1,11,1)
,('/site/layouts/images/shop/product11.jpg',1,1,12,1)
,('/site/layouts/images/shop/product12.jpg',1,1,13,1)
,('/site/layouts/images/shop/product7.jpg',1,1,14,1)
,('/site/layouts/images/shop/product8.jpg',1,1,15,1)
,('/site/layouts/images/shop/product9.jpg',1,1,16,1)
,('/site/layouts/images/shop/product10.jpg',1,1,17,1)
,('/site/layouts/images/shop/product11.jpg',1,1,18,1)
,('/site/layouts/images/shop/product12.jpg',1,1,19,1)
,('/site/layouts/images/shop/product7.jpg',1,1,20,1)
,('/site/layouts/images/shop/product8.jpg',1,1,21,1)
,('/site/layouts/images/shop/product9.jpg',1,1,22,1)
,('/site/layouts/images/shop/product10.jpg',1,1,23,1)
,('/site/layouts/images/shop/product11.jpg',1,1,24,1)
,('/site/layouts/images/shop/product12.jpg',1,1,25,1)
,('/site/layouts/images/shop/product7.jpg',1,1,26,1)

,('/site/layouts/images/shop/product7.jpg',0,1,1,1)
,('/site/layouts/images/shop/product8.jpg',0,1,2,1)
,('/site/layouts/images/shop/product9.jpg',0,1,3,1)
,('/site/layouts/images/shop/product10.jpg',0,1,4,1)
,('/site/layouts/images/shop/product11.jpg',0,1,5,1)
,('/site/layouts/images/shop/product12.jpg',0,1,6,1)
,('/site/layouts/images/shop/product7.jpg',0,1,7,1)
,('/site/layouts/images/shop/product8.jpg',0,1,8,1)
,('/site/layouts/images/shop/product9.jpg',0,1,9,1)
,('/site/layouts/images/shop/product10.jpg',0,1,10,1)
,('/site/layouts/images/shop/product11.jpg',0,1,11,1)
,('/site/layouts/images/shop/product12.jpg',0,1,12,1)
,('/site/layouts/images/shop/product7.jpg',0,1,13,1)
,('/site/layouts/images/shop/product8.jpg',0,1,14,1)
,('/site/layouts/images/shop/product9.jpg',0,1,15,1)
,('/site/layouts/images/shop/product10.jpg',0,1,16,1)
,('/site/layouts/images/shop/product11.jpg',0,1,17,1)
,('/site/layouts/images/shop/product12.jpg',0,1,18,1)
,('/site/layouts/images/shop/product7.jpg',0,1,19,1)
,('/site/layouts/images/shop/product8.jpg',0,1,20,1)
,('/site/layouts/images/shop/product9.jpg',0,1,21,1)
,('/site/layouts/images/shop/product10jpg',0,1,22,1)
,('/site/layouts/images/shop/product11.jpg',0,1,23,1)
,('/site/layouts/images/shop/product12.jpg',0,1,24,1)
,('/site/layouts/images/shop/product7.jpg',0,1,25,1)
,('/site/layouts/images/shop/product8.jpg',0,1,26,1);


DELIMITER //

DROP TRIGGER IF EXISTS after_insert_order_detail //
CREATE TRIGGER after_insert_order_detail AFTER INSERT ON pg_order_details
FOR EACH ROW
BEGIN
	UPDATE pg_products SET pg_products.QUANTITY = pg_products.QUANTITY - New.AMOUNT WHERE pg_products.PRODUCT_ID = NEW.PRODUCT_ID ;
    
 END //

DROP TRIGGER IF EXISTS after_update_order //
CREATE TRIGGER after_update_order AFTER UPDATE ON pg_orders
FOR EACH ROW
BEGIN
	IF((new.ORDER_STATUS_KEY =0)) THEN
		UPDATE pg_products,pg_order_details SET pg_products.QUANTITY = pg_products.QUANTITY + pg_order_details.AMOUNT WHERE pg_products.PRODUCT_ID = pg_order_details.PRODUCT_ID AND pg_order_details.ORDER_ID = New.ORDER_ID;
    END IF;
END //

DELIMITER ;

