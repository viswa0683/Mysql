/* Table Creation */
create Table V_Users
(
user_id  number PRIMARY KEY,
name VARCHAR2(100) NOT NULL,
email VARCHAR2(150) UNIQUE NOT NULL,
registered_date DATE NOT NULL,
membership VARCHAR2(10) DEFAULT 'Basic' 
    CHECK (membership IN ('Basic', 'Prime'))
);


Create table Products(
product_id number PRIMARY KEY,
name VARCHAR2(210) NOT NULL,
price number(10, 2) NOT NULL,
category VARCHAR2(100) NOT NULL,
stock number NOT NULL);


create table Orders
(order_id number PRIMARY KEY, 
user_id number,
--(INT, FOREIGN KEY REFERENCES Users(user_id))
order_date DATE NOT NULL,
total_amount number(10, 2)NOT NULL,
FOREIGN KEY(user_id) REFERENCES V_Users(user_id)
);

create table OrderDetails
(
order_details_id number PRIMARY KEY, 
order_id number,
--FOREIGN KEY REFERENCES Orders(order_id))
product_id number,
--(INT, FOREIGN KEY REFERENCES Products(product_id))
quantity number NOT NULL,
FOREIGN KEY(order_id) REFERENCES Orders(order_id),
FOREIGN KEY(product_id) REFERENCES Products(product_id));

--------SEQUENCE
CREATE SEQUENCE V_USER_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  NOCACHE ;

CREATE SEQUENCE Products_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  NOCACHE ;

CREATE SEQUENCE Order_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  NOCACHE ;

CREATE SEQUENCE Orderdetail_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  NOCACHE ;

/*Insertion*/

Begin
INSERT INTO v_users (user_id,name, email, registered_date, membership) 
VALUES (V_USER_SEQ.nextval,'Alice Johnson', 'alice.j@example.com', to_date('2024-01-15','YYYY-MM-DD'), 'Prime');

INSERT INTO v_users (user_id,name, email, registered_date, membership) 
values (V_USER_SEQ.nextval,'Bob Smith', 'bob.s@example.com', to_date('2024-02-01','YYYY-MM-DD'), 'Basic');

INSERT INTO v_users (user_id,name, email, registered_date, membership) 
values (V_USER_SEQ.nextval,'Charlie Brown', 'charlie.b@example.com', to_date('2024-03-10','YYYY-MM-DD'), 'Prime');

INSERT INTO v_users (user_id,name, email, registered_date, membership) 
values (V_USER_SEQ.nextval,'Daisy Ridley', 'daisy.r@example.com', to_date('2024-04-12','YYYY-MM-DD'), 'Basic');
Commit;
End;

SELECT * FROM V_Users;

3	Alice Johnson	alice.j@example.com	15-01-24 00:00:00	Prime
4	Bob Smith	bob.s@example.com	01-02-24 00:00:00	Basic
5	Charlie Brown	charlie.b@example.com	10-03-24 00:00:00	Prime
6	Daisy Ridley	daisy.r@example.com	12-04-24 00:00:00	Basic;/



INSERT INTO Products (product_id,name, price, category, stock) 
VALUES (Products_SEQ.nextval,'Echo Dot', '49.99', 'Electronics', 120);

INSERT INTO Products (product_id,name, price, category, stock) 
VALUES (Products_SEQ.nextval,'Kindle Paperwhite', '129.99', 'Books', 50);

INSERT INTO Products (product_id,name, price, category, stock) 
VALUES(Products_SEQ.nextval,'Fire Stick', '39.99', 'Electronics', 80);

INSERT INTO Products (product_id,name, price, category, stock) 
VALUES(Products_SEQ.nextval,'Yoga Mat', '19.99', 'Fitness', 200);

INSERT INTO Products (product_id,name, price, category, stock) 
VALUES(Products_SEQ.nextval,'Wireless Mouse', '24.99', 'Electronics', 150);

Commit;

SELECT * FROM Products;
1	Echo Dot	49.99	Electronics	120
2	Kindle Paperwhite	129.99	Books	50
3	Fire Stick	39.99	Electronics	80
4	Yoga Mat	19.99	Fitness	200
5	Wireless Mouse	24.99	Electronics	150


INSERT INTO Orders (order_id,user_id, order_date, total_amount) 
VALUES (Order_SEQ.nextval,3, to_date('2024-05-01','YYYY-MM-DD'), 79.98);

INSERT INTO Orders (order_id,user_id, order_date, total_amount) 
VALUES (Order_SEQ.nextval,3, to_date('2024-05-01','YYYY-MM-DD'), 79.98);

INSERT INTO Orders (order_id,user_id, order_date, total_amount) 
VALUES(Order_SEQ.nextval,4, to_date('2024-05-03','YYYY-MM-DD'), 129.99);

INSERT INTO Orders (order_id,user_id, order_date, total_amount) 
VALUES (Order_SEQ.nextval,3,to_date('2024-05-04','YYYY-MM-DD') , 49.99);

INSERT INTO Orders (order_id,user_id, order_date, total_amount) 
VALUES(Order_SEQ.nextval,5, to_date('2024-05-05','YYYY-MM-DD'), 24.99);

select * from Orders;

2	3	01-05-24 00:00:00	79.98
3	3	01-05-24 00:00:00	79.98
4	4	03-05-24 00:00:00	129.99
5	3	04-05-24 00:00:00	49.99
6	5	05-05-24 00:00:00	24.99


INSERT INTO OrderDetails (order_details_id,order_id, product_id, quantity) VALUES
(Orderdetail_SEQ.nextval,2, 1, 2);

INSERT INTO OrderDetails (order_details_id,order_id, product_id, quantity) VALUES
(Orderdetail_SEQ.nextval,3, 2, 1);

INSERT INTO OrderDetails (order_details_id,order_id, product_id, quantity) VALUES
(Orderdetail_SEQ.nextval,4, 1, 1);

INSERT INTO OrderDetails (order_details_id,order_id, product_id, quantity) VALUES
(Orderdetail_SEQ.nextval,5, 5, 1);

select * from OrderDetails;

1	2	1	2
2	3	2	1
3	4	1	1
4	5	5	1