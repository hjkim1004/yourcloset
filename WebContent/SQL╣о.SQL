DROP DATABASE IF EXISTS  yourcloset;
CREATE DATABASE yourcloset DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE yourcloset;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
	id varchar(100),
    pw varchar(100),
    name varchar(100),
    address varchar(100),
    point int,
    `position` varchar(50),
    PRIMARY KEY(id)
);
select * from user;

DROP TABLE IF EXISTS product;
CREATE TABLE product (
	pid int AUTO_INCREMENT,
	pname varchar(100),
    price int,
    size varchar(100),
    category varchar(100),
    stock int,
    point int,
    PRIMARY KEY(pid)
);

select * FROM product;
DROP TABLE IF EXISTS sale;
CREATE TABLE sale (
	oid int AUTO_INCREMENT,
    pid int,
    address varchar(100),
    payment varchar(100),
    userid varchar(100),
    delivery varchar(100),
    price int,
    PRIMARY KEY(oid)
);

DROP TABLE IF EXISTS bookmark;
CREATE TABLE bookmark (
	bid int,
    pname varchar(100),
    pid int,
    userid varchar(100),
    PRIMARY KEY(bid)
);

SHOW TABLES;

SELECT * FROM user;

SELECT * FROM product;

DESC sale;

SELECT * FROM sale s, product p WHERE s.pid = p.pid AND userid = 'jhr';

SELECT * FROM product;

UPDATE product SET stock = stock -1 WHERE pid = 1;

SELECT * FROM product;

SELECT * FROM bookmark;

INSERT INTO USER
VALUES('hyeri', md5('1059'), '전혜리', '수원시 권선구', 0,'staff');
INSERT INTO USER
VALUES('adam', md5('0000'), '채아담', '인천광역시 연수구', 0,'customer');
INSERT INTO USER
VALUES('siyeon', md5('0000'), '권시연', '오산시 양산동', 0,'customer');
INSERT INTO USER
VALUES('heejeong', md5('0000'), '김희정', '오산시 양산동', 0,'customer');
INSERT INTO USER
VALUES('hyoseok', md5('1234'), '최효석', '오산시 양산동', 0,'customer');


INSERT INTO product
VALUES(1,'crop mtm', 22000, 'free', 'top', 25, 220);

INSERT INTO product
VALUES(2,'denim pants', 33000, 'S', 'bottom', 14, 330);

INSERT INTO product
VALUES(3,'white dress', 48000, 'free', 'one_piece', 45, 480);

INSERT INTO product
VALUES(4,'bus handle earring', 9000, 'M', 'acc', 13, 90)
;
insert into sale
values(0, 2, '오산시 양산동', 'card', 'hyeri', '배송 준비중',33000);

insert into sale
values(0, 4, '수원시 권선구', 'cash', 'adam', '배송 완료',9000);

insert into sale
values(0, 1, '인천광역시 연수구', 'card', 'siyeon', '배송 준비중',22000);

insert into sale
values(0, 3, '오산시 양산동', 'card', 'hyeri', '배송 준비중',48000);

insert into sale
values(0, 3, '수원시 영통구', 'card','heejeong','배송 준비중',48000);
insert into bookmark
values(001, 'crop mtm', 1, 'adam');

insert into bookmark
values(002, 'bus handle earring', 4, 'adam');

insert into bookmark
values(003, 'white dress', 3, 'hyeri');

SELECT * FROM sale;
