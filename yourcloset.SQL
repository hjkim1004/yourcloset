DROP DATABASE IF EXISTS  yourcloset;
CREATE DATABASE yourcloset DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE yourcloset;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
	id varchar(100) primary key,
    pw varchar(100),
    name varchar(100),
    address varchar(100),
    point int default 0,
    position varchar(10)
);

DROP TABLE IF EXISTS product;
CREATE TABLE product (
	pid int AUTO_INCREMENT primary key,
	pname varchar(100) not null,
    price int not null,
    size varchar(100),
    category varchar(100) not null,
    stock int not null default 0,
    point int
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	order_id int AUTO_INCREMENT primary key,
    product_id int,
    order_time datetime,
    address varchar(100),
    payment varchar(100),
    user_id varchar(100),
    delivery varchar(100),
    price int
);

DROP TABLE IF EXISTS bookmark;
CREATE TABLE bookmark (
	bookmark_id int auto_increment primary key,
    product_id int,
    user_id varchar(100),
    foreign key(user_id) references user(id) on delete cascade,
    foreign key(product_id) references product(pid) on delete cascade
);

INSERT INTO user
VALUES('dadmi97', md5('gmlwjd97'), 'heejeong','suwon', 0,'staff');

INSERT INTO product
VALUES('crop mtm', 22000, 'free', 'top', 25, 220);

INSERT INTO product
VALUES('denim pants', 33000, 'S', 'bottom', 14, 330);

INSERT INTO product
VALUES('white dress', 48000, 'free', 'one_piece', 45, 480);

INSERT INTO product
VALUES('bus handle earring', 9000, 'M', 'acc', 13, 90);

insert into bookmark values(1, 'dadmi97');
insert into bookmark values(4, 'dadmi97');
insert into bookmark values(3, 'dadmi97');

SELECT * FROM orders;
