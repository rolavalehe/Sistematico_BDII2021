USE master;  
GO
--Crea dispositivo de almacenamiento
EXEC sp_addumpdevice 'disk', 'HotelData',   
'D:\Sist_BD_II2021\DATABASE\BACKUP\HotelData.bak';  
GO

--Crear el primer backup
BACKUP DATABASE Hotel   
 TO HotelData  
   WITH FORMAT, INIT, NAME = N'Hotel – Full Backup' ;  
GO  

--Crea nuevos backups
DECLARE @BackupName VARCHAR(100)
SET @BackupName = N'Hotel – Full Backup ' + FORMAT(GETDATE(),'yyyyMMdd_hhmmss');

BACKUP DATABASE Hotel
TO HotelData
WITH NOFORMAT, NOINIT, NAME = @BackupName,
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

RESTORE FILELISTONLY FROM HotelData
GO
RESTORE HEADERONLY FROM HotelData
GO

SELECT      *
FROM        sys.backup_devices
GO

--EXEC sp_dropdevice 'HotelData', 'delfile' ;  
--GO 