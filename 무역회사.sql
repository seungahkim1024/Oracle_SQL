create table Customers(
customer_id varchar2(15) primary key,
contact_name varchar2(15) not null,
address varchar2(15) not null,
city varchar2(15) not null,
postal_code varchar2(15) not null,
country varchar2(15) not null
);

create table Employees(
employee_id varchar2(15) primary key,
last_name varchar2(15) not null,
first_name varchar2(15) not null,
birth_date varchar2(15) not null unique,
photo varchar2(15),
notes varchar2(15)
);

create table Shippers(
shipper_id varchar2(15) primary key,
shipper_name varchar2(15) not null,
phone varchar2(15) not null
);

create sequence order_id
start with 1000
increment by 1; 
create table Orders(
order_id number primary key,
customer_id varchar2(15) not null, 
constraint Orders_fk_Customers foreign key(customer_id)
references Customers(customer_id),
employee_id varchar2(15) not null,
constraint Orders_fk_Employees foreign key(employee_id)
references Employees(employee_id),
oder_date DATE default sysdate,
shipper_id varchar2(15) not null,
constraint Orders_fk_Shippers foreign key(shipper_id)
references Shippers(shipper_id)
);
drop sequence order_id;


create table Suppliers(
supplier_id varchar2(15) primary key,
supplier_name varchar2(15) not null,
contact_name varchar2(15) not null,
address varchar2(15) not null,
city varchar2(15) not null,
postal_code varchar2(15) not null,
country varchar2(15) not null,
phone varchar2(15) not null
);

create sequence category_id
start with 1000
increment by 1;
create table Categories(
category_id number primary key,
category_name varchar2(15) not null,
description varchar2(15)    
);


create sequence product_id
start with 1000
increment by 1;
create table Products(
product_id number primary key,
product_name varchar2(15) not null,
supplier_id varchar2(15) not null,
constraint Products_fk_Suppliers foreign key(supplier_id)
references Suppliers(supplier_id),
category_id number not null,
constraint Products_fk_Categories foreign key(category_id)
references Categories(category_id),
unit varchar2(15) not null,
price number not null
);

create sequence order_detail_id
start with 1000
increment by 1;
create table Order_details(
order_detail_id number primary key,
order_id number(15) not null,
constraint Order_details_fk_Orders foreign key(order_id)
references Orders(order_id),
product_id number(15) not null,
constraint Order_details_fk_Products foreign key(product_id)
references Products(product_id),
quantity number default 1
);


select * from tab;