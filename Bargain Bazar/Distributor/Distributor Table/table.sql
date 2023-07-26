drop user distributor cascade
/
create user distributor identified by distributor
/
grant dba to distributor
/
conn distributor/distributor
/
create table customer
(
	id nvarchar2(10),
	fnm nvarchar2(40),
	lnm nvarchar2(40),
	phone number(12)
)
/
create table employee
(
	id nvarchar2(10),
	fnm nvarchar2(40),
	lnm nvarchar2(40),
	email nvarchar2(70),
	phone number(12),
	job_id nvarchar2(10),
	location_id nvarchar2(10)
)
/
create table job
(
	job_id nvarchar2(10),
	job_title nvarchar2(40),
	salary number(8)
)
/
create table location
(
	id nvarchar2(10),
	city nvarchar2(40),
	street nvarchar2(40)
)
/
create table manager
(
	fname nvarchar2(40),
	lname nvarchar2(40),
	location_id nvarchar2(10),
	email nvarchar2(70),
	phone number(13)
)
/
create table category
(
	id nvarchar2(10),
	name nvarchar2(40),
	descr nvarchar2(40)
)
/
create table product
(
	id nvarchar2(10),
	name nvarchar2(40),
	descr nvarchar2(40),
	qty_stock number(8),
	price number(8),
	category_id nvarchar2(10)
)
/
create table supplier
(
	id nvarchar2(10),
	comp_nm nvarchar2(40),
	location_id nvarchar2(10),
	phone number(13)
)
/