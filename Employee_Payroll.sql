--uc1 Create data base
create database Payroll_servicee; 

--uc2 Create table
create table Employee_payroll(id int primary key identity(1,1),
Name varchar(200),Salary bigint,Startdate date);

--uc3 insert

insert into Employee_payroll values ('Charlie',30000,'2015-01-01');
insert into Employee_payroll values ('Bill',25000,'2018-01-01');
insert into Employee_payroll values ('ajay',28000,'2020-01-01');
insert into Employee_payroll values ('raj',20000,'2019-01-01');

--uc4 show
select * from Employee_payroll;
-- uc5 
select * from Employee_payroll where name = 'Bill'

select * from Employee_payroll where Startdate between CAST('2018-1-1' as date)and GETDATE();

--uc6 adding more columns
alter table Employee_payroll add Gender varchar(10);
update Employee_payroll set Gender ='M' where Name ='Bill'or Name='ajay';
insert into Employee_payroll values('Ram',32000,'2017-01-01','M')

--uc7
select SUM(Salary) as empsalary from Employee_payroll;
select Min(Salary) as Minsalary from Employee_payroll;
select Max(Salary) as Maxsalary from Employee_payroll;
select avg(Salary) as avgsalary from Employee_payroll;
select count(id) as TotalRecord from Employee_payroll where Gender='M'Group by Gender;

--uc8

alter table Employee_payroll add phone bigint;
alter table Employee_payroll add Emp_Address varchar(200) not null default 'pune';
alter table Employee_payroll add Department varchar(200) not null default 'IT';
Select * from Employee_payroll;

-- uc9 adding more columns

alter table Employee_payroll add Basic_Pay bigint;
alter table Employee_payroll add Deductions bigint;
alter table Employee_payroll add Taxable_Pay bigint;
alter table Employee_payroll add Income_Tax bigint;
alter table Employee_payroll add Net_Pay bigint;
Select * from Employee_payroll;

--uc10 adding tow more contact


insert into Employee_payroll values('Terissa',25000,'2017-01-01','F',7898234604,'mumbai','Sales',20000,2000,1800,200,18000)
insert into Employee_payroll values('Terissa',25000,'2017-01-01','F',7898234604,'mumbai','Marketing',20000,2000,1800,200,18000)
Select * from Employee_payroll where name= 'Terissa';

--uc11 deleting tables and re created with relation

create table Employee(Employee_Id int,Department_ID int);
Select * from Employee;
drop table Employee;
drop table Employee_payroll;

create table Company(CompanyID int primary key identity(1,1),
CompanyName varchar(200))
insert into Company values('Infosys'),('tata')
select * from Company

create table Employee(EmployeeID int primary key identity(1,1) ,
CompanyIdentity int,
EmployeeName varchar(200),
EmployeePhoneNumber bigInt,
EmployeeAddress varchar(200),
StartDate date,
Gender char,
Foreign key (CompanyIdentity) references Company(CompanyID))

insert into Employee values
(1,'Anita Yadav',9842905050,'5298 Wild Indigo, Georgia,340002','2012-03-28','F'),
(2,'Kriti Deshmuk',9842905550,'Constitution Ave Fairfield, California(CA), 94533','2017-04-22','F'),
(1,'Nandeeshwar',7812905050,'Bernard Shaw, Georgia,132001 ','2015-08-22','M'),
(2,'Sarang Nair',78129050000,'Bernard Shaw, PB Marg Bareilly','2012-08-29','M')

Select * from Employee


create table PayrollCalculate
(BasicPay float,
Deductions float,
TaxablePay float,
IncomeTax float,
NetPay float,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employee(EmployeeID)
)

insert into PayrollCalculate(BasicPay,Deductions,IncomeTax,EmployeeIdentity) values 
(4000000,1000000,20000,1),
(4500000,200000,4000,2),
(6000000,10000,5000,3),
(9000000,399994,6784,4)

update PayrollCalculate
set TaxablePay=BasicPay-Deductions

update PayrollCalculate
set NetPay=TaxablePay-IncomeTax

select * from PayrollCalculate

create table Department
(
DepartmentId int primary key identity(1,1),
DepartName varchar(100)
)

insert into Department values
('Marketing'),
('Sales'),
('Publishing')

select * from Department

create table EmployeeDepartment
(
DepartmentIdentity int ,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employee(EmployeeID),
Foreign key (DepartmentIdentity) references Department(DepartmentID)
)

insert into EmployeeDepartment values
(3,1),
(2,2),
(1,3),
(3,4)

select * from EmployeeDepartment