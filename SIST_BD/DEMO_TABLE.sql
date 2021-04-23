USE Hotel
GO

CREATE TABLE dbo.DemoTable
( DemoTableId int IDENTITY(1,1) PRIMARY KEY,
  FirstLargeColumn nvarchar(600),
  BigIntColumn bigint
);
GO