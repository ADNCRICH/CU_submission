--This is a table for Breather valve
--This is a table for valve id
create table PVRV_Valve_id
(
	id int identity(1,1) primary key,
	Valve_id varchar(20),
	Client varchar(20),
	Tag_No varchar(20),
	Valve_id_No varchar(20),
	Plant varchar(20),
	Brand varchar(20),
	Model varchar(20),
	Inlet_Size varchar(20),
	Outlet_Size varchar(20),
	Set_Pressure float,
	Set_Pressure_Unit varchar(20),
	Set_Vaccuum float,
	Set_Vaccuum_Unit varchar(20),
	Type_Pressure varchar(20),
	Type_Vaccuum varchar(20),
	Capacity_Pressure varchar(20),
	Capacity_Vaccuum varchar(20)
)
--this is a table for worklist
create table PVRV_Worklist
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Onsite_Test int,
	Shop_Test int,
	Test_Only int,
	Test_Adjust int,
	Overhaul int
)
--this is a table for recieve photo
create table PVRV_Recieve_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Overall_Condition int,
	Tag_Old int,
	Name_Plate int,
	Outlet_Condition int
)
--this is a table for pressure port test
create table PVRV_Pressure_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Port_Media varchar(20),
	Port_Criteria int,
	Port_Criteria_Value varchar(20),
	Port_Measurement_Type varchar(20),
	Port_Ini_Value varchar(20),
	Port_Final_Value varchar(20),
	Port_Measurement_Unit varchar(20),
	Port_Ini_Valve_Open float,
	Port_Final_Valve_Close float,
	Port_Ini_Satisfy varchar(20),
	Port_Final_Satisfy varchar(20),
	Leak_Pressure int,
	Leak_Pressure_Value int,
	Leak_Max_Leakage float,
	Leak_Ini_Satisfy varchar(20),
	Leak_Final_Satisfy varchar(20),
	--Photo
	Ini_Opening int,
	Ini_Reset_Value int,
	Ini_Leakage int,
	Final_Opening int,
	Final_Reset_Value int,
	Final_Leakage int
)
--this is a table for vaccuum port test
create table PVRV_Vaccuum_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Port_Media varchar(20),
	Port_Criteria int,
	Port_Criteria_Value varchar(20),
	Port_Measurement_Type varchar(20),
	Port_Ini_Value varchar(20),
	Port_Final_Value varchar(20),
	Port_Measurement_Unit varchar(20),
	Port_Ini_Valve_Open float,
	Port_Final_Valve_Close float,
	Port_Ini_Satisfy varchar(20),
	Port_Final_Satisfy varchar(20),
	Leak_Pressure int,
	Leak_Pressure_Value int,
	Leak_Max_Leakage float,
	Leak_Ini_Satisfy varchar(20),
	Leak_Final_Satisfy varchar(20),
	--Photo
	Ini_Opening int,
	Ini_Reset_Value int,
	Ini_Leakage int,
	Final_Opening int,
	Final_Reset_Value int,
	Final_Leakage int
)
--This is a table for shell test
create table PVRV_Shell_Test
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Pressure int,
	Ini_Satisfy varchar(20),
	Final_Satisfy varchar(20),
	--Photo
	Ini_Photo int,
	Final_Photo int
)
--This is a table for part replacement 
create table PVRV_Part_Replacement
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Pressure_Diaphragm_Material varchar(20),
	Pressure_Diaphragm_Supplier varchar(20),
	Pressure_Diaphragm_Dimension varchar(50),
	Vaccuum_Diaphragm_Material varchar(20),
	Vaccuum_Diaphragm_Supplier varchar(20),
	Vaccuum_Diaphragm_Dimension varchar(50),
	Pressure_Cover_Gasket_Material varchar(20),
	Pressure_Cover_Gasket_Supplier varchar(20),
	Pressure_Cover_Gasket_Dimension varchar(50),
	Vaccuum_Cover_Gasket_Material varchar(20),
	Vaccuum_Cover_Gasket_Supplier varchar(20),
	Vaccuum_Cover_Gasket_Dimension varchar(50),
	Oring_Diaphragm_Material varchar(20),
	Oring_Diaphragm_Supplier varchar(20),
	Oring_Diaphragm_Dimension varchar(50),
	Other_Diaphragm_Material varchar(20),
	Other_Diaphragm_Supplier varchar(20),
	Other_Diaphragm_Dimension varchar(50),
)
--This is a table for part replacement photo
create table PVRV_Part_Replacement_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),
	Old_Photo int,
	New_Photo int,
	Comment varchar(200)
)
--This is a table for pre delivery photo
create table PVRV_PreDelivery_Photo
(
	id int identity(1,1) primary key,
	Work_id varchar(20),	
	Before_Overhaul_1 int,
	Before_Overhaul_2 int,
	Name_Plate int,
	Seal_Tag int,
	Finish_Overhaul int,
	Prepare_Delivery int
)
--End of Breather Valve