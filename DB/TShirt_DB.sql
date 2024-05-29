--creare tabele
create table CUSTOM_COLOR (
    custom_color_id int primary key,
    custom_color varchar2(50)
);

create table CUSTOM_SIZE (
    custom_size_id int primary key,
    custom_size_length int not null,
    custom_size_width int not null
);

create table CUSTOMIZE_BACK (
    customize_back_id int primary key,
    custom_color_id int not null,
    custom_size_id int not null,
    constraint fk_custom_color_id1 foreign key (custom_color_id) references CUSTOM_COLOR(custom_color_id),
    constraint fk_custom_size_id1 foreign key (custom_size_id) references CUSTOM_SIZE(custom_size_id)
);

create table CUSTOMIZE_FRONT (
    customize_front_id int primary key,
    custom_color_id int not null,
    custom_size_id int not null,
    constraint fk_custom_color_id2 foreign key (custom_color_id) references CUSTOM_COLOR(custom_color_id),
    constraint fk_custom_size_id2 foreign key (custom_size_id) references CUSTOM_SIZE(custom_size_id)
);

create table T_SIZE (
    size_id int primary key,
    t_size varchar2(30) unique not null
);

create table CATEGORIES (
    category_id int primary key,
    name varchar2(100) not null unique
);

create table IMAGES (
    image_id int primary key,
    file_name varchar2(100) not null unique,
    file_path varchar2(500) not null
);

create table PRODUCTS (
    product_id int primary key,
    image_id int not null,
    size_id int not null,
    customize_front_id int not null,
    customize_back_id int not null,
    price int not null,
    sku int,
    t_name varchar2(100) not null,
    t_description varchar2(100),
    constraint fk_image_id foreign key (image_id) references IMAGES(image_id),
    constraint fk_size_id foreign key (size_id) references T_SIZE(size_id),
    constraint fk_customize_front_id foreign key (customize_front_id) references CUSTOMIZE_FRONT(customize_front_id),
    constraint fk_customize_back_id foreign key (customize_back_id) references CUSTOMIZE_BACK(customize_back_id)
);

create table BELONGS (
    belongs_id int primary key,
    category_id int not null,
    product_id int not null,
    constraint fk_category_id foreign key (category_id) references CATEGORIES(category_id),
    constraint fk_product_id1 foreign key (product_id) references PRODUCTS(product_id)
);

create table USERS (
    user_id int primary key,
    first_name varchar2(100) not null,
    last_name varchar2(100) not null,
    email_address varchar2(100) not null unique,
    password varchar2(100) not null unique
);

create table ORDER_STATUS (
    status_id int primary key,
    status_name varchar2(100) not null unique
);

create table ORDER_DETAILS (
    detail_id int primary key,
    product_id int not null,
    quantity int not null,
    ppu int not null,
    constraint fk_product_id2 foreign key (product_id) references PRODUCTS(product_id)
);

create table ORDERS (
    order_id int primary key,
    user_id int not null,
    detail_id int not null,
    status_id int not null,
    placed_at timestamp default CURRENT_TIMESTAMP not null,
    constraint fk_user_id foreign key (user_id) references USERS(user_id),
    constraint fk_detail_id foreign key (detail_id) references ORDER_DETAILS(detail_id),
    constraint fk_status_id foreign key (status_id) references ORDER_STATUS(status_id)
);

describe CUSTOM_COLOR;
describe CUSTOM_SIZE;
describe CUSTOMIZE_BACK;
describe CUSTOMIZE_FRONT;
describe T_SIZE;
describe CATEGORIES;
describe IMAGES;
describe PRODUCTS;
describe BELONGS;
describe USERS;
describe ORDER_STATUS;
describe ORDER_DESTAILS;
describe ORDERS;

drop table ORDERS;
drop table ORDER_DETAILS;
drop table ORDER_STATUS;
drop table USERS;
drop table BELONGS;
drop table PRODUCTS;
drop table CUSTOMIZE_BACK;
drop table CUSTOMIZE_FRONT;
drop table orders;

--inserare in tabele

--custom_color
INSERT INTO CUSTOM_COLOR
VALUES (1200, 'black');

INSERT INTO CUSTOM_COLOR
VALUES (1201, 'white');

INSERT INTO CUSTOM_COLOR
VALUES (1202, 'red');

INSERT INTO CUSTOM_COLOR
VALUES (1203, 'blue');

INSERT INTO CUSTOM_COLOR
VALUES (1204, 'green');

select *
from CUSTOM_COLOR;

--custom_size
INSERT INTO CUSTOM_SIZE
VALUES (1100, 30, 30);

INSERT INTO CUSTOM_SIZE
VALUES (1101, 50, 30);

INSERT INTO CUSTOM_SIZE
VALUES (1102, 30, 50);

INSERT INTO CUSTOM_SIZE
VALUES (1103, 50, 50);

INSERT INTO CUSTOM_SIZE
VALUES (1104, 100, 100);

select *
from CUSTOM_SIZE;

--customize_back
INSERT INTO CUSTOMIZE_BACK
VALUES (1000, 1200, 1100);

INSERT INTO CUSTOMIZE_BACK
VALUES (1001, 1201, 1100);

INSERT INTO CUSTOMIZE_BACK
VALUES (1002, 1200, 1101);

INSERT INTO CUSTOMIZE_BACK
VALUES (1003, 1202, 1104);

INSERT INTO CUSTOMIZE_BACK
VALUES (1004, 1204, 1103);

select *
from CUSTOMIZE_BACK;

--customize_front
INSERT INTO CUSTOMIZE_FRONT
VALUES (900, 1200, 1100);

INSERT INTO CUSTOMIZE_FRONT
VALUES (901, 1201, 1100);

INSERT INTO CUSTOMIZE_FRONT
VALUES (902, 1200, 1101);

INSERT INTO CUSTOMIZE_FRONT
VALUES (903, 1202, 1104);

INSERT INTO CUSTOMIZE_FRONT
VALUES (904, 1204, 1103);

select *
from CUSTOMIZE_FRONT;

--t_size
INSERT INTO T_SIZE
VALUES (800, 'XS');

INSERT INTO T_SIZE
VALUES (801, 'S');

INSERT INTO T_SIZE
VALUES (802, 'M');

INSERT INTO T_SIZE
VALUES (803, 'L');

INSERT INTO T_SIZE
VALUES (804, 'XL');

select *
from T_SIZE;

--categories
INSERT INTO CATEGORIES
VALUES (700, 'Vinland Saga');

INSERT INTO CATEGORIES
VALUES (701, 'Berserk');

INSERT INTO CATEGORIES
VALUES (702, 'Summer');

INSERT INTO CATEGORIES
VALUES (703, 'Flowers');

INSERT INTO CATEGORIES
VALUES (704, 'Animals');

select *
from CATEGORIES;

--images
INSERT INTO IMAGES
VALUES (600, 'Thorfin.jpg', 'Baza_Date/Images/Vinland_Saga/');

INSERT INTO IMAGES
VALUES (601, 'Guts.jpg', 'Baza_Date/Images/Berserk/');

INSERT INTO IMAGES
VALUES (602, 'Beach,jpg', 'Baza_Date/Images/Summer/');

INSERT INTO IMAGES
VALUES (603, 'Rose,jpg', 'Baza_Date/Images/Flowers/');

INSERT INTO IMAGES
VALUES (604, 'White_Mamba,jpg', 'Baza_Date/Images/Animals/');

select *
from IMAGES;

--products
INSERT INTO PRODUCTS
VALUES (500, 600, 802, 900, 1000, 90, 239, 'Custom T-shirt Vinland Saga', '');

INSERT INTO PRODUCTS
VALUES (501, 601, 800, 902, 1003, 100, 106, 'Custom T-shirt Berserk', '');

INSERT INTO PRODUCTS
VALUES (502, 602, 803, 901, 1002, 60, 1000, 'Beach Ready T-shirt', '');

INSERT INTO PRODUCTS
VALUES (503, 603, 801, 900, 1000, 85, 364, 'Black Rose T-shirt', '');

INSERT INTO PRODUCTS
VALUES (504, 604, 800, 901, 1001, 120, 12, 'White Mamba T-shirt', '');

select * 
from PRODUCTS;

--belongs
INSERT INTO BELONGS
VALUES (400, 700, 500);

INSERT INTO BELONGS
VALUES (401, 701, 501);

INSERT INTO BELONGS
VALUES (402, 702, 502);

INSERT INTO BELONGS
VALUES (403, 703, 503);

INSERT INTO BELONGS
VALUES (404, 704, 504);

select *
from belongs;

--users
INSERT INTO USERS
VALUES (300, 'Ryan', 'Garcia', 'ryangarcia@gmail.com', 'ryan123');

INSERT INTO USERS
VALUES (301, 'Danna', 'White', 'dannawhite@gmail.com', 'danna123');

INSERT INTO USERS
VALUES (302, 'Khabib', 'Nurmagomenov', 'khabibN@gmail.com', 'khabib123');

INSERT INTO USERS
VALUES (303, 'Khamzat', 'Chimaev', 'khamzatchimaev@gmail.com', 'khamzat123');

INSERT INTO USERS
VALUES (304, 'Poatan', 'Pereira', 'poatanpereira@gmail.com', 'poatan123');

select *
from USERS;

--order_status
INSERT INTO ORDER_STATUS
VALUES (200, 'Delivered');

INSERT INTO ORDER_STATUS
VALUES (201, 'On route');

INSERT INTO ORDER_STATUS
VALUES (202, 'Order Placed');

INSERT INTO ORDER_STATUS
VALUES (203, 'Cancelled');

INSERT INTO ORDER_STATUS
VALUES (204, 'Error');

select *
from order_status;

--order_details
INSERT INTO ORDER_DETAILS
VALUES (100, 500, 2, 80);

INSERT INTO ORDER_DETAILS
VALUES (101, 501, 1, 100);

INSERT INTO ORDER_DETAILS
VALUES (102, 502, 2, 60);

INSERT INTO ORDER_DETAILS
VALUES (103, 503, 3, 85);

INSERT INTO ORDER_DETAILS
VALUES (104, 504, 1, 120);

select *
from order_details;

--orders
INSERT INTO ORDERS
VALUES (1, 300, 100, 200);

INSERT INTO ORDERS
VALUES (2, 301, 100, 200, CURRENT_TIMESTAMP);

INSERT INTO ORDERS
VALUES (3, 302, 101, 203, CURRENT_TIMESTAMP);

INSERT INTO ORDERS
VALUES (4, 303, 102, 202, CURRENT_TIMESTAMP);

INSERT INTO ORDERS
VALUES (5, 304, 103, 201, CURRENT_TIMESTAMP);

select *
from ORDERS;