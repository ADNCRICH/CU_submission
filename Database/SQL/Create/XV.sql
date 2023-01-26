--This is a table for on/off valve
--This is a table for valve id
create table XV_Valve_id
(
	id int identity(1,1) primary key,
	Valve_id varchar(20),
	Client varchar(20),
	Tag_No varchar(20),
	Valve_id_No varchar(20),
	Plant varchar(20),
	Manufacturer varchar(20),
	Serial_No varchar(20),
	Model varchar(20),
	Type varchar(20),
	Size int,
	Size_Unit varchar(20),
	CWP_rating varchar(20),
	Body_Heat_No varchar(20),
	Bonnet_Heat_No varchar(20),
	Yoke_Heat_No varchar(20),
	Material_Body varchar(20),
	Material_Ball varchar(20),
	Material_Seat varchar(20),
	Material_Stem varchar(20),
	Material_Packing varchar(20),
	Material_PTFE varchar(20),
	Act_Manufacturer varchar(20),
	Act_Serial_No varchar(20),
	Act_Model varchar(20),
	Act_Type varchar(20),
	Act_Fail varchar(20),
	Act_Supply int,
	Act_Travel int
)
--This is a table for worklist
create table XV_Worklist
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Remove_Install int,
	Shop_Test int,
	Body_Overhaul int,
	Act_Overhaul int
)
--This is a table for shell test
create table XV_Shell_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Media varchar(20),
	Pressure int,
	Pressure_Unit varchar(20),
	Acceptance varchar(20),
	Ini_Satisfy varchar(20),
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo int,
	Final_Photo int
)
--This is a table for seat leakage Pressure closure test
create table XV_Seat_Leakage_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Media varchar(20),
	Pressure int,
	Pressure_Unit varchar(20),
	Allowable_Leakage_Rate int,
	Ini_Upstream_Leak_Rate int,
	Ini_Downstream_Leak_Rate int,
	Ini_Satisfy varchar(20),
	Final_Upstream_Leak_Rate int,
	Final_Downstream_Leak_Rate int,
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo int,
	Final_Photo int
)
--This is a table for Actuator function and leakage test
create table XV_Actuator_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Media varchar(20),
	Ini_Opening_Time int,
	Ini_Closing_Time int,
	Ini_Leak_Test varchar(20),
	Ini_Satisfy varchar(20),
	Final_Opening_Time int,
	Final_Closing_Time int,
	Final_Leak_Test varchar(20),
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo int,
	Final_Photo int
)
--This is a table for Recieve photo
create table XV_Recieve_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
--This is a table for Dismantle photo
create table XV_Dismantle_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
--This is a table for Part
create table XV_Part
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Name varchar(20),
	Material varchar(20),
	Size varchar(20),
	Quantity int
)