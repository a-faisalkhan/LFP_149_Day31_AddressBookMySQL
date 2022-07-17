/*----UC1--------*/
create database payroll_service;
show databases;
use payroll_service;

/*-------UC2-------*/
create table employee_payroll (id INT unsigned NOT NULL AUTO_INCREMENT, name VARCHAR(150) NOT NULL, salary Double NOT NULL, start DATE NOT NULL, PRIMARY KEY (id));
desc employee_payroll;

/*--------UC3----------*/
insert into employee_payroll ( name, salary, start) values ( 'Faisal', 10000.00, '2020-06-25' ), ( 'Rahul', 20000.00, '2021-04-20' ), ( 'Kailas', 30000.00, '2022-03-12' );

/*--------UC4----------*/
select * from employee_payroll;

/*--------UC5----------*/
select salary from employee_payroll where name = 'Faisal';
insert into employee_payroll ( name, salary, start) values ( 'Bill', 25000.00, '2019-01-01' );
select * from employee_payroll WHERE start BETWEEN CAST( '2017-01-01' AS DATE) AND DATE (now());

/*--------UC6----------*/
insert into employee_payroll ( name, salary, start) values ( 'Ruchira', 35000.00, '2018-05-01' ), ( 'Kajol', 41000.00, '2017-011-09' );
insert into employee_payroll ( name, salary, start) values ( 'Sam', 11000.00, '2018-05-30' );
ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
ALTER TABLE employee_payroll DROP gender;
SET SQL_SAFE_UPDATES = 0;
UPDATE employee_payroll SET gender = 'F' WHERE name = 'Ruchira' OR name = 'Kajol';
SET SQL_SAFE_UPDATES = 1;

/*--------UC7----------*/
SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
SELECT SUM(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
SELECT SUM(salary) FROM employee_payroll WHERE gender = 'NULL' GROUP BY gender;
SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
SELECT MIN(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
SELECT MAX(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
SELECT COUNT(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
SELECT COUNT(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;

/*--------UC8----------*/
select * from employee_payroll;

alter table employee_payroll
add phoneno varchar(15),
add department varchar(50) not null after salary;

alter table employee_payroll
add address varchar(250) default 'Address' after phoneno;

/*--------UC9 , UC10----------*/
select * from employee_payroll;
alter table employee_payroll rename column salary to basic_pay;

alter table employee_payroll
add deduction int,
add taxable_pay int,
add income_tax int,
add net_pay int;

select * from employee_payroll where name="Faisal";
desc employee_payroll;

/*--------UC11, UC12----------*/
create table department_tbl (
	dept_id int auto_increment,
    dept_name varchar(15),
    dept_desc varchar(30),
    primary key(dept_id)
);

select * from department_tbl;

insert into department_tbl (dept_name, dept_desc) 
values("Sales","Handling sales of company"),
("Marketing", "marketing department"),
("IT", "Technical team"),
("HR","Human Resource"),
("Account","accounting of company");

alter table employee_payroll drop column department;

create table employee_department (
	id int auto_increment,
    emp_id int,
    dept_id int,
    primary key(id),
    foreign key(emp_id) references employee_payroll(id),
    foreign key(dept_id) references department_tbl(dept_id)
);

