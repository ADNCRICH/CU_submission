/****** Script for SelectTopNRows command from SSMS  ******/

--create table data(valve_id varchar(50),status int)

--ALTER TABLE data ADD N int NOT NULL IDENTITY(1,1) primary key
abc

ALTER TABLE data
ALTER COLUMN image IMAGE NOT NULL;

Alter table data
ALTER column status VARCHAR(50) NOT NULL

ALTER table data
ADD Image image


-- set image data from c:\temp\image.jpg
update data
set image = (select BulkColumn
from Openrowset(Bulk 'D:\IDM\Downloads\BMW-M4-CSL-2023-01-640x480_c.jpg', Single_Blob) as image) where N = 4


INSERT INTO data
VALUES('asd-654', 'has have and or', GETDATE(), 'ME It''s ME!', 0, (select BulkColumn
                from Openrowset(Bulk 'D:\IDM\Downloads\Porsche-911-GT3-RS-1-660x400@2x.jpg', Single_Blob) as image))

-- create table of statements
create table ValveStatements
(
        id int identity(1,1) primary key,
        statement varchar(max) not null
)

SELECT *
from ValveStatements

ALTER table ValveStatements
add value INT NOT NULL

insert into ValveStatements
values('Maintenance', 3)

CREATE table safetyValveImage
(
        id int identity(1,1) primary key,
        valve_id varchar(50) not null,
        image image not null
)

-- Get a list of tables and views in the current database
SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
FROM INFORMATION_SCHEMA.TABLES
GO

DELETE FROM [data]

-- delete image column in data table
ALTER TABLE data
DROP COLUMN image

select *
from data

SELECT *
from safetyValveImage

INSERT into [data]
VALUES('asd-654wd', 'has have and or', GETDATE(), 'ME It''s ME!', 'asd')

DBCC Checkident ('data', reseed, 0)
DBCC Checkident ('safetyValveImage', reseed, 0)

DELETE from [data]
DELETE from [safetyValveImage]

--edit column datatype in safetyValveImage table
ALTER TABLE safetyValveImage
ALTER COLUMN image varbinary(max) NOT NULL

--create table of admin users
CREATE TABLE [dbo].[AdminUsers]
(
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Username] [varchar](50) NOT NULL,
        [Password] [varchar](50) NOT NULL,
        [Email] [varchar](50) NOT NULL,
        [Role] [varchar](50) NOT NULL,
        [CreatedDate] [datetime] NOT NULL,
        [ModifiedDate] [datetime] NOT NULL,
        [CreatedBy] [varchar](50) NOT NULL,
        [ModifiedBy] [varchar](50) NOT NULL,
        CONSTRAINT [PK_AdminUsers] PRIMARY KEY CLUSTERED 
(
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
--insert into admin user
INSERT INTO [dbo].[AdminUsers]
        ([Username]
        ,[Password]
        ,[Email]
        ,[Role]
        ,[CreatedDate]
        ,[ModifiedDate]
        ,[CreatedBy]
        ,[ModifiedBy])
VALUES
        ('admin', 'adminadmin', 'mail', 'admin', GETDATE(), GETDATE(), 'master', 'master')

DELETE FROM [AdminUsers]

DROP TABLE [AdminUsers]

SELECT *
from AdminUsers
--create table of users
CREATE TABLE [dbo].[Users]
(
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Username] [varchar](50) NOT NULL,
        [Password] [varchar](50) NOT NULL,
        [Email] [varchar](50) NOT NULL,
        [Role] [varchar](50) NOT NULL,
        [CreatedDate] [datetime] NOT NULL,
        [ModifiedDate] [datetime] NOT NULL,
        [CreatedBy] [varchar](50) NOT NULL,
        [ModifiedBy] [varchar](50) NOT NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

insert into Users
values('admin', 'adminadmin', 'null', 'Admin', GETDATE(), GETDATE(), 'master', 'master')

select *
from Users

--edit data in Users table
update Users
set Role = 'Developer' where Role = 'developer'


delete from Users

--create user role table
CREATE TABLE [dbo].[UserRole]
(
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Role] [varchar](50) NOT NULL,
)

insert into UserRole
values('Employee')

SELECT *
FROM UserRole

UPDATE UserRole
SET Role = 'Admin' WHERE Role = 'admin'

SELECT *
FROM PSV_Valve_id

--insert into CV_Valve_id
INSERT INTO CV_Valve_id
        (Valve_id,Client,Tag_No)
VALUES('a', 'b', 'c')

        select id, Valve_id
        FROM CV_Valve_id
UNION
        select id, Valve_id
        from PSV_Valve_id

DELETE FROM CV_Valve_id
DELETE FROM PSV_Valve_id
DELETE FROM MV_Valve_id
DELETE FROM PCV_Valve_id
DELETE FROM PVRV_Valve_id
DELETE FROM XV_Valve_id