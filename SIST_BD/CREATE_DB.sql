-- =============================================
-- Create database on multiple filegroups
-- =============================================
IF EXISTS (
  SELECT * 
    FROM sys.databases 
   WHERE name = N'Hotel'
)
  DROP DATABASE Hotel
GO

CREATE DATABASE Hotel
ON PRIMARY
	(NAME = Hotel_Data,
	  FILENAME = N'D:\Sist_BD_II2021\DATABASE\DATA\Hotel_Data.mdf',
          SIZE = 10MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),
	
	( NAME = Hotel_Data_2,
	  FILENAME = N'D:\Sist_BD_II2021\DATABASE\DATA\Hotel_Data_2.ndf',
          SIZE = 10MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),

FILEGROUP Hotel_filegroup1
	( NAME = Hotel_Data_3,
	  FILENAME = N'D:\Sist_BD_II2021\DATABASE\DATA\Hotel_Data_3.ndf',
          SIZE = 10MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),
	
	( NAME = Hotel_Data_4,
	  FILENAME = N'D:\Sist_BD_II2021\DATABASE\DATA\Hotel_Data_4.ndf',
          SIZE = 10MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),

FILEGROUP Hotel_group_2
	( NAME = Hotel_Data_5,
	  FILENAME = N'D:\Sist_BD_II2021\DATABASE\DATA\Hotel_Data_5.ndf',
          SIZE = 10MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)

LOG ON
	( NAME = Hotel_Log_1,
	  FILENAME = N'D:\Sist_BD_II2021\DATABASE\LOG\Hotel_Log_1.ldf',
          SIZE = 10MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%),

	( NAME = Hotel_Log_2,
	  FILENAME = N'D:\Sist_BD_II2021\DATABASE\LOG\Hotel_Log_2.ldf',
          SIZE = 5MB,
          MAXSIZE = 25MB,
          FILEGROWTH = 5MB)
GO