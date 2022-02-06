--LIBRARY MANAGEMENT SYSTEM 

create database Library

use Library

create table Book_Details
(
ISBN_Code int primary key,
Book_Title varchar(100),
Language varchar(10),
Binding_id int,
No_Copies_Actual int,
No_Copies_Current int,
Category_id int,
Publication_year int
)

--Insert values in the table

insert into Book_Details
select 001,'Programming Concepts','English',2,20,15,2,2006 union all
select 002,'Digital logic','English',3,21,16,3,2005 union all
select 003,'SQL Basics','English',4,22,17,4,2004 union all
select 004,'Sanskrit','Sanskrit',5,23,18,5,2001 union all
select 005,'Python Basics','English',6,24,19,6,1994 union all
select 006,'Microprocessor','English',7,25,20,7,1996 union all
select 007,'Digital Communication','English',8,26,21,8,2003 union all
select 008,'Physics','English',9,27,22,9,2004 union all
select 009,'Mathematics','English',10,28,23,10,2009 union all
select 010,'Computer Scince','English',11,29,24,11,2010 

--Create Binding Table

create table Binding_Details
(
Binding_id int primary key,
Binding_Name varchar(50)
)

--Insert values in the table

insert into Binding_Details
select 1,'MCGraw Hill' union all
select 2,'BPB Publication' union all
select 3,'Chand Publication' union all
select 4,'Mercury Books' union all
select 5,'Prime Publication' union all
select 6,'TCK Publishing' union all
select 7,'Harper Collins' union all
select 8,'Reed Elsevier' union all
select 9,'Barnes and Noble' union all
select 10,'Kindle Direct Publication' 

--Create relationship between Book_Details and Binding_Details tables

Alter table Book_Details
add constraint Binding_id_fk foreign key(Binding_id) references Binding_Details(Binding_id);

--Create category table

create table Category_Details
(
 Category_id int primary key,
 Category_Name varchar(50)
 )

--Insert into category table

 insert into Category_Details
 select 1,'Database' union all
 select 2,'Programming Language' union all
 select 3,'Language' union all
 select 4,'Electronics' union all
 select 5,'Science' Union all
 Select 6,'Mathematics' union all
 select 7,'Computer Basics' union all
 select 8,'Basics' union all
 select 9,'Communication' union all
 select 10,'Social'

--Create realtionship between Book_Details and Category_Details

Alter table Book_Details
add constraint Category_id_FK foreign key(Category_id) references 
Category_Details(Category_id)

--Create borower table

create table Borrower_Details
(
Borrower_id int primary key,
Book_id int,
Borrower_From Date,
Borrower_To Date,
Actual_Return_Date date,
Issued_by int
)

--Insert values into borower table

insert into Borrower_Details
select 1,004,'01-Aug-2021','05-Aug-2021','05-Aug-2021',1 union all
select 2,005,'08-Aug-2021','16-Aug-2021','16-Aug-2021',2 union all
select 3,006,'10-Aug-2021','15-Aug-2021','15-Aug-2021',3 union all
select 4,007,'20-Aug-2021','25-Aug-2021',NULL,4 union all
select 5,008,'19-Aug-2021','24-Aug-2021','24-Aug-2021',5


--Create relationship between Book_Details and Borrower_Details

Alter table Borrower_Details
add constraint Book_id_FK foreign key(Book_id) references Book_Details(ISBN_Code)

--Create staff table

create table Staff_Details
(
Staff_id int primary key,
Staff_Name varchar(50),
Password varchar(30),
Is_Admin binary,
Designation varchar(20)
)

--Insert value in the table

insert into Staff_Details
select 1,'Tarek Hossain','1234ali',0,'Lib_mgr' union all
select 2,'Raju','521ra',1,'Lib_clr' union all
select 3,'Ria','521r1',2,'Lib_clr' union all
select 4,'Ankit Prasad','789an',0,'Lib_mgr' union all
select 5,'Tiku Mishra','456ti',0,'Lib_HOD'

--Create relationship between Borrower_Details and Staff_Details

Alter table Borrower_Details
add constraint Issued_by_fk foreign key(Issued_by) references Staff_Details(Staff_id)

--Create student table

create table Student_Details
(
Student_id varchar(20) primary key,
Student_Name varchar(50),
Gender varchar(10),
DOB date,
Borrower_id int,
Department varchar(20),
Contact_Number varchar(11)
)

--Insert into table

insert into Student_Details
select '13-23059-1','Ahmed Ali','Male','05-oct-1999',1,'CSSE',123456789 union all
select '14-23059-2','Shyam Bjaj','Male','06-nov-1998',2,'ECE',789546123 union all
select '15-23059-3','Ankita','Female','07-apr-1995',3,'MEC',8553477669 union all
select '16-23059-4','Vishu','Male','08-mar-1997',4,'ISE',123465987 union all
select '17-23059-5','Arti walia','Female','09-jan-1998',5,'CHEM',985632147 

--Create relationship between Student_Details and Borrower_Details

Alter table Student_Details
add constraint Borrower_id_fk foreign key(Borrower_id)
references Borrower_Details(Borrower_id)

--Create table Shelf

create table Shelf_Details
(
Shelf_id int primary key,
Shelf_No int,
Floor_No int
)


--Insert into Shelf table

insert into Shelf_Details
select 1,1,1 union all
select 2,2,202 union all
select 3,1,1 union all
select 4,2,101 union all
select 5,3,105 
