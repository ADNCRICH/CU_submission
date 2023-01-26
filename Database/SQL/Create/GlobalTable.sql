--This is Work_ID Table
--Not sure about signature
CREATE Table Work_ID
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Valve_id varchar(20),
	Lot_id varchar(20),
	Client varchar(20),
	Valve_type varchar(20),
	Stat varchar(20),
	Init_Test_by varchar(20),
	Init_Test_date date,
	Init_Signature image,
	Final_Test_by varchar(20),
	Final_Test_date date,
	Final_Signature image,
	Witness varchar(20),
	Witness_date date,
	Witness_Signature image,
	Review varchar(20),
	Review_date date,
	Review_Signature image,
	Approve_by varchar(20),
	Approve_date date,
	Approve_Signature image,
)
--This is a photo table
create table Photo
(
	id int identity(1,1) primary key,
	Photo image
)
--This is a test equipment data
create table TestEquipment_Data
(
	id int identity(1,1) primary key,
	Certificate varchar(20),
	Serial varchar(20),
	Range varchar(20),
	Type varchar(20)
)
--This is a test equipment that was used in a work_id
create table TestEquipment
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Certificate_1 varchar(20),
	Certificate_2 varchar(20),
	Certificate_3 varchar(20)
)