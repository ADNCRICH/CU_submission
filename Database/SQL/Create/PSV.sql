--This is a table for safety valve
--This is a table for valve id
create table PSV_Valve_id
(
	id int identity(1,1) primary key,
	Valve_id varchar(20),
	Client varchar(20),
	Tag_No varchar(20),
	Valve_id_No varchar(20),
	Plant varchar(20),
	Brand varchar(20),
	Model varchar(20),
	Classify_Code varchar(20),
	Valve_Type varchar(20),
	Seat_Type varchar(20),
	Inlet_Size varchar(20),
	Outlet_Size varchar(20),
	Orfice_Size varchar(20),
	Set_Pressure int,
	CDTP int,
	Unit varchar(20),
	Back_Pressure_Start int,
	Back_Pressure_End int,
	Service varchar(20),
	Capacity int,
	Operation_temp int,
	TC_Set varchar(20),
	TC_Unit varchar(20)
)
--This is a table for workList
create table PSV_Worklist
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Onsite_Test int,
	Shop_Test int,
	Test_Only int,
	Test_Adjust int,
	Overhaul int
)
--This is a table for opening test
create table PSV_Opening_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Media varchar(20),
	Criteria int,
	Lower_V float,
	Upper_V float,
	Ini_1 float,
	Ini_2 float,
	Ini_Satisfy varchar(20),
	Final_Test int,
	Final_1 float,
	Final_2 float,
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo int,
	Final_Photo int
)
--this is a table for seat tightness test
create table PSV_Seat_Tightness_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Media varchar(20),
	Pressure_Unit varchar(20),
	Pressure float,
	Max_Leakage int,
	Leakage_Unit varchar(20),
	Ini_Leakage_rate int,
	Ini_Satisfy varchar(20),
	Final_Leakage_rate int,
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Final_Photo_1 int,
	Final_Photo_2 int
)
--This is a table for back pressure test
create table PSV_Back_Pressure_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Unit varchar(20),
	Test_Pressure int,
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
--This is a table for Measurement and adjustment 
create table Measurement_Adjustment
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	NR_Before int,
	NR_After int,
	GR_Before int,
	GR_After int,
	Adjusting_Bolt_Initial float,
	Adjusting_Bolt_Final float,
	Free_Length float,
	Form_Model varchar(20),
	Disc_Before_Lap float,
	Disc_After_Lap float,
	Disc_SPEC float,
	Nozzle_Model varchar(20),
	Nozzle_Id float,
	Nozzle_Before_Lap float,
	Nozzle_After_Lap float,
	Nozzle_SPEC float,
	Comment_1 varchar(200),
	Comment_2 varchar(200)
)
--this is a table for inspection photo
create table PSV_Inspection_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Valve_Recieve_1 int,
	Valve_Recieve_2 int,
	Tag int,
	Name_Plate int,
	Inlet_Condition int,
	Outlet_Condition int
)
--this is a table for dismantle and assemble photo
create table PSV_Dismantle_Assemble_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Ini_Preassemble int,
	Ini_Disc int,
	Ini_Nozzle int,
	Final_Preassemble int,
	Final_Disc int,
	Final_Nozzle int,
)
--This is a table for delivery photo
create table PSV_Delivery_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
--This is a table for Replace part
create table PSV_Replace_Part
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int,
	Detail varchar(100),
	Quantity int
)
--End of Safety Valve