--This is a Table for Pressure control valve
--This is a table for Valve id
create table PCV_Valve_id
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
	Class varchar(20),
	CWP_rating varchar(20),
	CV int,
	Char varchar(20),
	Leakage_Class varchar(20),
	Flow_Direction varchar(20),
	Body varchar(20),
	Plug varchar(20),
	Seat_Ring varchar(20),
	Max_Inlet_Pressure int,
	Spring_Range_Start int,
	Spring_Range_End int,
	Set_Pressure int
)
--This is a table of Work_List
create table PCV_Worklist
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Remove_Install int,
	Shop_Test int,
	Body_Overhaul int,
	Onsite_Test int
)
--This is a table of Shell Test
create table PCV_Shell_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Pressure int,
	Ini_Body varchar(20),
	Ini_Satisfy varchar(20),
	Final_Body varchar(20),
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int
)
--This is a table for Pressure Reducing test
create table PCV_Pressure_Reducing_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Inlet_Pressure int,
	Ini_Outlet_Pressure_Reduce varchar(20),
	Ini_Satisfy varchar(20),
	Final_Outlet_Pressure_Reduce varchar(20),
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int
)
--This is a table for sense/shut off pressure test
create table PCV_Sense_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Inlet_Pressure int,
	Ini_Opening int,
	Ini_Closing int,
	Ini_Satisfy varchar(20),
	Final_Opening int,
	Final_Closing int,
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int
)
--This is a table for part inspection
create table PCV_Part_Inspection
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Diaphragm_Result varchar(20),
	Diaphragm_Remark varchar(100),
	Spring_Result varchar(20),
	Spring_Remark varchar(100),
	MainPlug_Result varchar(20),
	MainPlug_Remark varchar(100),
	MainSeat_Result varchar(20),
	MainSeat_Remark varchar(100),
	PilotPlug_Result varchar(20),
	PilotPlug_Remark varchar(100),
	PilotSeat_Result varchar(20),
	PilotSeat_Remark varchar(100),
	Gasket_Result varchar(20),
	Gasket_Remark varchar(100),
)
--This is a table for Dismantle to inspect photo
create table PCV_Dismantle_Inspect_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
--This is a table for onsite photo
create table PCV_Onsite_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
--This is a table for part recommend
create table PCV_Part_Recommend
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Detail varchar(200)
)
--End of Pressure control valve