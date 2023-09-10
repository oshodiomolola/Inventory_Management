use Database_Inventory;

-- create user table
CREATE TABLE USER (
  id bigint,
  email varchar(255),
  password varchar(20),
 username varchar(50),
 phone_number varchar(11),
 address varchar(255),
 gender varchar(7),
 PRIMARY KEY (id)
);

-- create admin table
CREATE TABLE ADMIN (
  id bigint,
user_id bigint,
token varchar(14),
last_name varchar(30),
first_name varchar(30),
FOREIGN KEY (user_id) REFERENCES USER(id),
PRIMARY KEY (id)
);

-- create sales_reps table
CREATE TABLE SALES_REPS (
  id bigint,
  last_name varchar(50),
  first_name varchar(50),
  user_id bigint,
  FOREIGN KEY (user_id) REFERENCES USER(id),
PRIMARY KEY (id)
);


-- create category table
CREATE TABLE CATEGORY (
  id bigint,
  category_name varchar(40),
  description varchar(255),
  PRIMARY KEY (id)
);

-- create products table
CREATE TABLE PRODUCTS (
  id bigint,
products_name varchar(60),
description varchar(255),
unit_price varchar(30),
size varchar(255),
color varchar(50),
flavor varchar(50),
quantity_in_a_unit varchar(255),
category_id bigint,
FOREIGN KEY (category_id) REFERENCES CATEGORY(id),
PRIMARY KEY (id)
);

-- create sales_reps-products table
CREATE TABLE SALES_REPS_PRODUCTS (
id bigint,
sales_reps_id bigint,
products_id bigint,
FOREIGN KEY (sales_reps_id)REFERENCES SALES_REPS(id),
FOREIGN KEY (products_id)REFERENCES PRODUCTS(id),
PRIMARY KEY (id)
);

-- create customer table
CREATE TABLE CUSTOMER (
  id bigint,
  user_id bigint,
  last_name varchar(50),
  first_name varchar(50),
  city varchar(255),
  postal_code varchar(12),
  region varchar(255),
  country varchar(60),
  FOREIGN KEY (user_id) REFERENCES USER (id),
  PRIMARY KEY (id)
);

-- create order table
CREATE TABLE SELECT_PRODUCTS (
  id bigint,
  sales_reps_id bigint,
  customer_id bigint,
  select_date datetime DEFAULT CURRENT_TIMESTAMP,
  delivery_date datetime DEFAULT CURRENT_TIMESTAMP,
  delivery_fee decimal,
  pick_up_address varchar(255),
  ship_address varchar(255),
  ship_postal_code varchar(15),
  ship_region varchar(30),
  ship_city varchar(30),
  ship_country varchar(50),
  FOREIGN KEY (sales_reps_id) REFERENCES SALES_REPS (id),
   FOREIGN KEY (customer_id) REFERENCES CUSTOMER (id),
   PRIMARY KEY (id)
);

-- create selected_products table
CREATE TABLE SELECTED_PRODUCTS (
  id bigint,
  select_products_id bigint,
  products_id bigint,
  FOREIGN KEY (select_products_id) REFERENCES SELECT_PRODUCTS (id),
  FOREIGN KEY (products_id) REFERENCES PRODUCTS (id),
  PRIMARY KEY (id)
);

-- create payment table
CREATE TABLE PAYMENT (
  id bigint,
  user_id bigint,
  selected_products_id bigint,
  payment_date datetime DEFAULT CURRENT_TIMESTAMP,
  amount float,
  FOREIGN KEY (user_id) REFERENCES USER (id),
  FOREIGN KEY (selected_products_id) REFERENCES SELECTED_PRODUCTS (id),
  PRIMARY KEY (id)
);

-- create feedback table
CREATE TABLE FEEDBACK (
  id bigint,
  user_id bigint,
  selected_products_id bigint,
  rating float,
   FOREIGN KEY (user_id) REFERENCES USER (id),
   FOREIGN KEY (selected_products_id) REFERENCES SELECTED_PRODUCTS (id),
   PRIMARY KEY (id)
);


-- insert records into entities
INSERT INTO USER
(id, email, password, username, address, phone_number, gender)
values (1, 'techgirlie@gmail.com', 'techpondat123', 'justDev', '14b, mc queens, ontario', '112 4563 67655', 'female');

INSERT INTO ADMIN
(id, user_id, token, last_name, first_name)
values(2, 1, 'admin123gb', 'Don', 'Belle');

INSERT INTO PAYMENT 
(id, user_id, ordered_products_id, payment_date, amount),
values(3, 1, 10, '2023-11-23 15:30:13', '$450.00');

-- getting records from entities
SELECT id, email, username FROM USER;
SELECT * FROM ADMIN;
SELECT products_name, size, unit_price FROM PRODUCTS;

-- updating enties
UPDATE PRODUCTS
SET products_name = 'MacBook pro'
WHERE id = 5;

UPDATE ADMIN
SET last_name = 'Queens'
WHERE id = 2;

-- delete records
DELETE from PRODUCTS
WHERE id = 2;

DELETE from ADMIN
WHERE id = 3