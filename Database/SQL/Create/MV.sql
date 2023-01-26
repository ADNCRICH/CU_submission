--This is Manual Valve Table
--This is a table for Valve id
create table MV_Valve_id
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
	Connection varchar(20),
	MOP_rating varchar(20),
	Body_Heat_No varchar(20),
	Bonnet_Heat_No varchar(20),
	Yoke_Heat_No varchar(20),
	--Material
	Body_M varchar(20),
	Disc_M varchar(20),
	Seat_M varchar(20),
	Stem_M varchar(20),
	Packing varchar(20),
	Gasket varchar(20)
)
--This is a table for worklist
create table MV_WorkList
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Remove_Install int,
	Inspection int,
	Shop_Test int,
	Overhaul int
)
--This is a table for Unit that use int the test
create table MV_Unit_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Duration varchar(20),
	Pressure varchar(20),
	Leakage varchar(20)
)
--This is a table for Backseat Test
create table MV_Backseat_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Duration int,
	Media varchar(20),
	Pressure int,
	Acceptance varchar(20),
	Ini_Satisfy varchar(20),
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int
)
--This is a table for Shell Test
create table MV_Shell_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Duration int,
	Media varchar(20),
	Pressure int,
	Acceptance varchar(20),
	Ini_Satisfy varchar(20),
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int
)
--This is a table for low pressure closure test
create table MV_Low_Pressure_Closure_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Duration int,
	Media varchar(20),
	Pressure int,
	Allowable_Leakage_Rate int,
	Ini_Upstream_Leakage_Rate int,
	Ini_Downstream_Leakage_Rate int,
	Ini_Satisfy varchar(20),
	Final_Upstream_Leakage_Rate int,
	Final_Downstream_Leakage_Rate int,
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int
)
--This is a table for High pressure closure test
create table MV_High_Pressure_Closure_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Duration int,
	Media varchar(20),
	Pressure int,
	Allowable_Leakage_Rate int,
	Ini_Upstream_Leakage_Rate int,
	Ini_Downstream_Leakage_Rate int,
	Ini_Satisfy varchar(20),
	Final_Upstream_Leakage_Rate int,
	Final_Downstream_Leakage_Rate int,
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int
)
--This is a table that store the Receive valve condition Photo
create table MV_Receive_Valve_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Overall_1 int,
	Overall_2 int,
	Name_Plate int,
	Upsteam_Flange int,
	Downsteam_Flange int
)
--This is a table that store Dismantle to Overhual Photo
create table MV_Dismantle_to_Overhual_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
--This is a table that store Part Replacement Detail
create table MV_Part_Replacement
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Part varchar(100),
	Quantity int
)
--This is a table that store PreDelivery photo
create table MV_PreDelivery_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
--End of Manual Valve