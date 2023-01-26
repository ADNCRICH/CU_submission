--This is a Control Valve Table
--This is a table for Control Valve id
create table CV_Valve_id
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
	Leakage_class varchar(20),
	Flow_Direction varchar(20),
	Body varchar(20),
	Plug varchar(20),
	Seat_ring varchar(20),
	Stem varchar(20),
	Packing varchar(20),
	Gasket varchar(20),
	Act_Brand varchar(20),
	Act_Serial_No varchar(20),
	Act_Model varchar(20),
	Act_Type varchar(20),
	Act_Air_Fail varchar(20),
	Supply int,
	Travel int,
	Pos_Brand varchar(20),
	Pos_Serial_No varchar(20),
	Pos_Model varchar(20),
	Pos_Type varchar(20),
	Pos_Signal varchar(20),
	Pos_Action varchar(20)
)
--This table record the work that the work_id has to do
create table CV_Worklist
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Remove_Install int,
	Shop_Test int,
	Body_Overhaul int,
	Act_Overhaul int
)
--This is a table for overall picture
create table CV_Overall_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo_1 int,
	Photo_2 int,
	Photo_3 int,
	Photo_4 int,
	Photo_5 int,
	Photo_6 int,
	Comment varchar(100)
)
--This is a table for shell test
create table CV_Shell_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Media varchar(20),
	Pressure int,
	Duration int,
	Acceptance varchar(20),
	Ini_Satisfy varchar(20),
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Ini_Comment varchar(100),
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int,
	Final_Comment varchar(100),
)
--This is a table for seat leakage test
create table CV_Seat_Leakage_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Media varchar(20),
	Pressure int,
	Duration int,
	Allowable int,
	Ini_Leak_Rate int,
	Ini_Satisfy varchar(20),
	Final_Leak_Rate int,
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Ini_Comment varchar(100),
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int,
	Final_Comment varchar(100),
)
--This is a table for function test
create table CV_Function_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Ini_In_0 int,
	Ini_In_25 int,
	Ini_In_50 int,
	Ini_In_75 int,
	Ini_In_100 int,
	Ini_Do_0 int,
	Ini_Do_25 int,
	Ini_Do_50 int,
	Ini_Do_75 int,
	Ini_Do_100 int,
	Ini_Open_Time int,
	Ini_Closing_Time int,
	Ini_Start_Point int,
	Ini_Limit_SW varchar(20),
	Final_In_0 int,
	Final_In_25 int,
	Final_In_50 int,
	Final_In_75 int,
	Final_In_100 int,
	Final_Do_0 int,
	Final_Do_25 int,
	Final_Do_50 int,
	Final_Do_75 int,
	Final_Do_100 int,
	Final_Open_Time int,
	Final_Closing_Time int,
	Final_Start_Point int,
	Final_Limit_SW varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Ini_Comment varchar(100),
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int,
	Final_Comment varchar(100),
)
--This is a table for Actuator leak test
create table CV_Act_Leak_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Ini_Condition int,
	Ini_Satisfy varchar(20),
	Final_Condition int,
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo_1 int,
	Ini_Photo_2 int,
	Ini_Photo_3 int,
	Ini_Comment varchar(100),
	Final_Photo_1 int,
	Final_Photo_2 int,
	Final_Photo_3 int,
	Final_Comment varchar(100),
)
--This is a table for Dismantle, Assemble and Replacement Photo
--the name is too long so i just gona rename it as DAR
create table CV_DAR_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
--This is a table for a Part Replacement detail
create table CV_Part_Replacement
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Detail varchar(200)
)
--This is a table for Photo of Valve After the Overhaul
create table CV_After_Overhaul_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Photo int
)
-- end of CV Valve