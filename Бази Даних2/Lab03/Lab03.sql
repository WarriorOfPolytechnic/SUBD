BACKUP DATABASE Lab1Student 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_FullDbBkup.bak' WITH INIT, 
NAME = 'Lab1Student Full Db backup',
DESCRIPTION = 'Lab1Student Full Database Backup'

RESTORE DATABASE Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_FullDbBkup.bak'
WITH RECOVERY, REPLACE

BACKUP DATABASE Lab1Student
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_FullDbBkup.bak'
WITH INIT, NAME = 'Lab1Student Full Db backup',
DESCRIPTION = 'Lab1Student Full Database Backup'

BACKUP LOG Lab1Student
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_TlogBkup.bak'
WITH NOINIT, NAME = 'Lab1Student Translog backup',
DESCRIPTION = 'Lab1Student Transaction Log Backup', NOFORMAT

ALTER DATABASE Lab1Student SET RESTRICTED_USER;

BACKUP LOG Lab1Student
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_TaillogBkup.bak'
WITH NORECOVERY

RESTORE DATABASE Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_FullDbBkup.bak'
WITH NORECOVERY

RESTORE LOG Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_TlogBkup.bak'
WITH NORECOVERY

RESTORE LOG Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_TaillogBkup.bak' 
WITH RECOVERY

BACKUP DATABASE Lab1Student
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student__DiffDbBkup.bak'
WITH INIT, DIFFERENTIAL, NAME = 'Lab1Student Diff Db backup',
DESCRIPTION = 'Lab1Student Differential Database Backup'


BACKUP LOG Lab1Student
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_TaillogBkup.bak'
WITH NORECOVERY

RESTORE DATABASE Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_FullDbBkup.bak'
WITH NORECOVERY

RESTORE LOG Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_TlogBkup.bak'
WITH NORECOVERY

RESTORE LOG Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student_TaillogBkup.bak' 
WITH RECOVERY

RESTORE DATABASE Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student__DiffDbBkup.bak' 
WITH NORECOVERY

RESTORE DATABASE Lab1Student
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1Student__DiffDbBkup.bak' 
WITH RECOVERY