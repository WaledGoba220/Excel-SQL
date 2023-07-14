-- create database

create database testData;


-- create table
use  testData;
create table students (
Roll_Num int ,
Name varchar(10),
Age int,
Phone int,
  );


  -- read data

  select * from	students;


 -- insert data 

 insert into students values(1,'Arya', 21, 21261623);

 insert into students values (2,'Ahmed', 19, 21266561623),
 (3,'Eman', 20, 2446612),
 (4,'Shimaa', 30, 48465);


 -- Constraints
 create table persons(
 ID int NOT NULL,
 FirtName varchar(10) NOT NULL,
 LastName varchar(10) NULL,
 Age int NULL,
 );


 select * from persons;

 -- Drop Table
 drop table persons;

 insert into persons values(1,'waled', 'saied', 22);

 insert into persons values(2,'saied','khames',54);


 -- if not make any value make default when create columns

 -- Unique constraint make like id ==> unique(ID)


 use testData;
 create table customer(
 Name varchar(10),
 Product varchar(10),
 Product_Id int primary key,
 );

 select * from customer;



 -- to modify using Alter

alter table persons Add primary key(ID);

select * from persons;


create table orders(
order_id int not null, -- make it primary key
order_num varchar(5) not null,
Product_Id int not null, -- make it forign key to concatinate with customer
);

select * from orders;

---------------------------------------------------------------------------------------------------------------------