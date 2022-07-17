/*------------UC1------------------*/
show databases;
create database addressbook_service;
use addressbook_service;
/*------------UC2------------------*/
create table addressbook (
	id int not null auto_increment,
	firstname varchar(50) not null,
	lastname varchar(50) not null,
	address varchar(100),
	city varchar(50) not null,
	state varchar(50) not null,
	zip varchar(6) not null,
	phonenumber varchar(12),
	email varchar(50),
    PRIMARY KEY (id)
);
/*------------UC3------------------*/
insert into addressBook(firstname, lastname, address, city, state, zip, phonenumber, email) values('Faisal','Ahmad','Abc', 'Mumbai','Maharashtra','400082','7778889990','ashok@gmail.com'), ('Sameer','Khan','xyz', 'Mumbai','Maharashtra','400083','8899775566','xyz@gmail.com'), ('Anup','Singh','def', 'Vizag','AP','403201','6688557799','def@gmail.com'), ('Yash','Kumar','asd', 'Warangal','TN','340340','9988776655','asd@gmail.com'), ('Aman','Kumar','qwe', 'Jaipur','Rajasthan','340321','6655447788','zxc@gmail.com');
select * from addressbook;
/*------------UC4------------------*/
update addressbook set email = 'qwe@gmail.com' where id = 1;
/*------------UC5------------------*/
delete from addressbook where id = 5;
/*------------UC6------------------*/
select * from addressbook where state = 'AP';
select * from addressbook where city = 'Vizag';
/*------------UC7------------------*/
select state, count(state) from addressbook group by state;
select city, count(city) from addressbook group by city;
/*------------UC8------------------*/
select * from addressbook where city = 'Mumbai' order by firstname ASC;
/*------------UC9------------------*/
alter table addressbook
add column addressbookname varchar(50),
add column addressbooktype varchar(50);
update addressbook set addressbookname = 'Book1' where id = 1;
update addressbook set addressbookname = 'Book2' where id = 2;
update addressbook set addressbookname = 'Book3' where id = 3;
update addressbook set addressbookname = 'Book1' where id = 4;
update addressbook set addressbooktype = 'Family' where id = 1;
update addressbook set addressbooktype = 'Friends' where id = 2;
update addressbook set addressbooktype = 'Profession' where id = 3;
update addressbook set addressbooktype = 'Friends' where id = 4;
/*------------UC10------------------*/
select addressbooktype, count(addressbooktype) from addressbook group by addressbooktype;
