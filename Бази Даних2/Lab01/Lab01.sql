Create Database Lab1Student; 

create table Lab1Student.dbo.kafedra
 (id_kafedru int IDENTITY(1,1) not null primary key,
  nazva_kafedru varchar(100) constraint  nazva_kafedru_format check (nazva_kafedru like '[А-я]%'),
  name_zav_kafedru varchar(50) constraint name_zav_kafedru_format check (name_zav_kafedru like '[А-Я]%') ,
  surname_zav_kafedru  varchar(50) constraint surname_zav_kafedru_format check (surname_zav_kafedru like '[А-Я]%') ,
  middlename_zav_kafedru  varchar(50) constraint middlename_zav_kafedru_format check (middlename_zav_kafedru like '[А-Я]%') ,
  kabinet varchar(50) not null,
  telefon char(12) check (telefon like '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

  create table Lab1Student.dbo.Specialnist
 (id_specialnosti int IDENTITY(1,1) not null primary key,
  nazva_specialnosti varchar(50) constraint  nazva_specialnosti_format check (nazva_specialnosti like '[А-я]%'),
  shufr_specialnosti varchar(50) not null,
  kvalifikacia  varchar(50) constraint  kvalifikacia_format check (kvalifikacia like '[А-я]%'),
  id_kafedru int not null references kafedra(id_kafedru) on update cascade on delete cascade)

  create table Lab1Student.dbo.grupa
 (id_group int IDENTITY(1,1) not null primary key,
  shufr_group varchar(50) not null,
  forma_navchanna varchar(50) not null,
  id_specialnosti int not null references Specialnist(id_specialnosti) on update cascade on delete cascade)

  create table Lab1Student.dbo.Pruchuna_vidrahuvanna
 (id_pruchuna_vidrah int IDENTITY(1,1) not null primary key,
   nazva_vidrah varchar(50) constraint  nazva_vidrah_format check (nazva_vidrah like '[А-я]%'))

    create table Lab1Student.dbo.Student
 (id_studenta int IDENTITY(1,1) not null primary key,
  name_st varchar(50) constraint name_st_format check (name_st like '[А-Я]%') ,
  surname_st varchar(50) constraint surname_st_format check (surname_st like '[А-Я]%') ,
  middlename_st  varchar(50) constraint middlename_st_format check (middlename_st like '[А-Я]%') ,
  datanarod_st  date not null,
  adresa_st varchar(100) not null,
  tel_st char (12) check (tel_st like '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  rik_vstupu_st datetime not null,
  byudzhet_contrack varchar(50) not null,
  nom_zalikovki varchar(50) not null,
  data_vidrahuvanna  datetime not null,
  id_pruchuna_vidrah int not null references Pruchuna_vidrahuvanna(id_pruchuna_vidrah) on update cascade on delete cascade,
  id_group int not null references grupa(id_group) on update cascade on delete cascade)


 Insert into
  Lab1Student.dbo.kafedra (nazva_kafedru,name_zav_kafedru,surname_zav_kafedru,middlename_zav_kafedru,kabinet,telefon)
 Values ('Кафедра физики и высшей математикие', 'Константин', 'Гнатюк', 'Петрович', '221', '(093)2616175'),
 ('Кафедра физики и высшей математикие', 'Константин', 'Гнатюк', 'Петрович', '221', '(093)2616175'),
 ('Кафедра автомобили и транспортные технологии', 'Олег', 'Романченко', 'Сергеевич', '310', '(096)3773435'),
 ('Кафедра прикладной механики и компьютерно-интегрированных технологий, мехатроники и робототехники', 'Елена', 'Остапенко', 'Петровна', '417', '(063)7645142')

   Insert into
 Lab1Student.dbo.Pruchuna_vidrahuvanna (nazva_vidrah)
 Values ('По собственному желанию'),
 ('По собственному желанию'),
 ('За академическую неуспеваемость'),
 ('По завершению обучения')

 Insert into
  Lab1Student.dbo.Specialnist (nazva_specialnosti,shufr_specialnosti,kvalifikacia, id_kafedru)
 Values ('Прикладная математика', '113', 'Специалист по информационным технологиям,математик', '3'),
 ('Отраслевое машиностроение', '133', 'Техник-механик', '1'),
 ('Компьютерные науки', '122', 'Специалист по информационным технологиям', '2')

  Insert into
  Lab1Student.dbo.grupa (shufr_group,forma_navchanna, id_specialnosti)
 Values ('ПМ-20-1', 'Дневная','4' ),
 ('ОМ-4', 'Заочная', '2'),
 ('КН-19-2', 'Дневная', '3')

  Insert into
   Lab1Student.dbo.Student (Student.name_st,surname_st ,middlename_st,datanarod_st,adresa_st,tel_st,rik_vstupu_st,byudzhet_contrack,nom_zalikovki,data_vidrahuvanna, id_pruchuna_vidrah,id_group)
 Values ('Георгий', 'Филиппов', 'Андреевич', '2001-04-02', 'Киевская область, город Киев, ул. Генерала Жадова, 81', '(063)5968840', '2018-09-01', 'Бюджет', '0334243', '2022-06-30','2','3'),
 ('Ольга', 'Дроздова', 'Евгеньевна', '2002-05-15', 'Житомирская область, город Житомир, ул. Киевская, 48', '(099)4481459', '2019-09-01', 'Контракт', '0344243', '2023-06-30','1','1'),
 ('Анатолий', 'Щукин', 'Борисович', '2003-06-21', 'Житомирская область, город Житомир, ул. Небесной Сотни, 11', '(096)4843973', '2020-09-01', 'Контракт', '0349243', '2024-06-30','3','2')

   CREATE PROCEDURE Procedure1 AS
  BEGIN
  SELECT * FROM Pruchuna_vidrahuvanna WHERE nazva_vidrah LIKE '%'
  END;
  EXEC Procedure1;

  CREATE TRIGGER Insert_Pruchuna_vidrahuvanna ON Pruchuna_vidrahuvanna FOR INSERT AS
IF EXISTS(SELECT * FROM inserted I
JOIN Pruchuna_vidrahuvanna T ON I.[nazva_vidrah] = T.[nazva_vidrah])
BEGIN
	ROLLBACK TRAN PRINT '     '
END

/*        .*/
CREATE TRIGGER Delete_Student ON Student FOR DELETE AS
IF NOT EXISTS(SELECT * FROM deleted D
WHERE adresa_st like '%')
BEGIN
	ROLLBACK TRAN PRINT '   .  '
END



 -- Імена сервера і примірника 
Select @@SERVERNAME as [Server\Instance]; 
-- версія SQL Server 
Select @@VERSION as SQLServerVersion; 
-- примірник SQL Server 
Select @@ServiceName AS ServiceInstance;
 -- Поточна БД (БД, в контексті якої виконується запит)
Select DB_NAME() AS CurrentDB_Name;



SELECT  @@Servername AS ServerName ,
        create_date AS  ServerStarted ,
        DATEDIFF(s, create_date, GETDATE()) / 86400.0 AS DaysRunning ,
        DATEDIFF(s, create_date, GETDATE()) AS SecondsRunnig
FROM    sys.databases
WHERE   name = 'tempdb'; 



EXEC sp_helpserver; 
--OR 
EXEC sp_linkedservers; 
--OR 
SELECT  @@SERVERNAME AS Server ,
        Server_Id AS  LinkedServerID ,
        name AS LinkedServer ,
        Product ,
        Provider ,
        Data_Source ,
        Modify_Date
FROM    sys.servers
ORDER BY name; 




EXEC sp_helpdb; 
--OR 
EXEC sp_Databases; 
--OR 
SELECT  @@SERVERNAME AS Server ,
        name AS DBName ,
        recovery_model_Desc AS RecoveryModel ,
        Compatibility_level AS CompatiblityLevel ,
        create_date ,
        state_desc
FROM    sys.databases
ORDER BY Name; 
--OR 
SELECT  @@SERVERNAME AS Server ,
        d.name AS DBName ,
        create_date ,
        compatibility_level ,
        m.physical_name AS FileName
FROM    sys.databases d
        JOIN sys.master_files m ON d.database_id = m.database_id
WHERE   m.[type] = 0 -- data files only
ORDER BY d.name; 





USE Lab1Student;
SELECT  *
FROM    sys.objects
WHERE   type = 'U';



EXEC sp_Helpfile; 
--OR 
SELECT  @@Servername AS Server ,
        DB_NAME() AS DB_Name ,
        File_id ,
        Type_desc ,
        Name ,
        LEFT(Physical_Name, 1) AS Drive ,
        Physical_Name ,
        RIGHT(physical_name, 3) AS Ext ,
        Size ,
        Growth
FROM    sys.database_files
ORDER BY File_id; 




EXEC sp_tables; -- Пам'ятайте, що цей метод поверне і таблиці, і відображення 
--OR 
SELECT  @@Servername AS ServerName ,
        TABLE_CATALOG ,
        TABLE_SCHEMA ,
        TABLE_NAME
FROM     INFORMATION_SCHEMA.TABLES
WHERE   TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME ;
--OR
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        o.name AS 'TableName' ,
        o.[Type] ,
        o.create_date
FROM    sys.objects o
WHERE   o.Type = 'U' -- User table 
ORDER BY o.name;
--OR 
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        t.Name AS TableName,
        t.[Type],
        t.create_date
FROM    sys.tables t
ORDER BY t.Name;




SELECT  'Select ''' + DB_NAME() + '.' + SCHEMA_NAME(SCHEMA_ID) + '.'
        + LEFT(o.name, 128) + ''' as DBName, count(*) as Count From ' + SCHEMA_NAME(SCHEMA_ID) + '.' + o.name
        + ';' AS ' Script generator to get counts for all tables'
FROM    sys.objects o
WHERE   o.[type] = 'U'
ORDER BY o.name;



SELECT  @@ServerName AS ServerName ,
        DB_NAME() AS DBName ,
        OBJECT_NAME(ddius.object_id) AS TableName ,
        SUM(ddius.user_seeks + ddius.user_scans + ddius.user_lookups)
                                                               AS  Reads ,
        SUM(ddius.user_updates) AS Writes ,
        SUM(ddius.user_seeks + ddius.user_scans + ddius.user_lookups
            + ddius.user_updates) AS [Reads&Writes] ,
        ( SELECT    DATEDIFF(s, create_date, GETDATE()) / 86400.0
          FROM      master.sys.databases
          WHERE     name = 'tempdb'
        ) AS SampleDays ,
        ( SELECT    DATEDIFF(s, create_date, GETDATE()) AS SecoundsRunnig
          FROM      master.sys.databases
          WHERE     name = 'tempdb'
        ) AS SampleSeconds
FROM    sys.dm_db_index_usage_stats ddius
        INNER JOIN sys.indexes i ON ddius.object_id = i.object_id
                                     AND i.index_id = ddius.index_id
WHERE    OBJECTPROPERTY(ddius.object_id, 'IsUserTable') = 1
        AND ddius.database_id = DB_ID()
GROUP BY OBJECT_NAME(ddius.object_id)
ORDER BY [Reads&Writes] DESC;




DECLARE DBNameCursor CURSOR
FOR
    SELECT  Name
    FROM    sys.databases
    WHERE    Name NOT IN ( 'master', 'model', 'msdb', 'tempdb',
                            'distribution' )
    ORDER BY Name; 
DECLARE @DBName NVARCHAR(128) 
DECLARE @cmd VARCHAR(4000) 
IF OBJECT_ID(N'tempdb..TempResults') IS NOT NULL
    BEGIN 
        DROP TABLE tempdb..TempResults 
    END 
CREATE TABLE tempdb..TempResults
    (
      ServerName NVARCHAR(128) ,
      DBName NVARCHAR(128) ,
      TableName NVARCHAR(128) ,
      Reads INT ,
      Writes INT ,
      ReadsWrites INT ,
      SampleDays DECIMAL(18, 8) ,
      SampleSeconds INT
    ) 
OPEN DBNameCursor 
FETCH NEXT FROM DBNameCursor INTO @DBName 
WHILE @@fetch_status = 0
    BEGIN 
        SELECT   @cmd = 'Use ' + @DBName + '; ' 
        SELECT   @cmd = @cmd + ' Insert Into tempdb..TempResults 
SELECT @@ServerName AS ServerName, 
DB_NAME() AS DBName, 
object_name(ddius.object_id) AS TableName , 
SUM(ddius.user_seeks 
+ ddius.user_scans 
+ ddius.user_lookups) AS Reads, 
SUM(ddius.user_updates) as Writes, 
SUM(ddius.user_seeks 
+ ddius.user_scans 
+ ddius.user_lookups 
+ ddius.user_updates) as ReadsWrites, 
(SELECT datediff(s,create_date, GETDATE()) / 86400.0 
FROM sys.databases WHERE name = ''tempdb'') AS SampleDays, 
(SELECT datediff(s,create_date, GETDATE()) 
FROM sys.databases WHERE name = ''tempdb'') as SampleSeconds 
FROM sys.dm_db_index_usage_stats ddius 
INNER JOIN sys.indexes i
ON ddius.object_id = i.object_id 
AND i.index_id = ddius.index_id 
WHERE objectproperty(ddius.object_id,''IsUserTable'') = 1 --True 
AND ddius.database_id = db_id() 
GROUP BY object_name(ddius.object_id) 
ORDER BY ReadsWrites DESC;' 
        EXECUTE (@cmd) 
        FETCH NEXT FROM DBNameCursor INTO @DBName 
    END 
CLOSE DBNameCursor 
DEALLOCATE DBNameCursor 
SELECT  *
FROM    tempdb..TempResults
ORDER BY DBName ,
        TableName; 







SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        o.name AS ViewName ,
        o.[Type] ,
        o.create_date
FROM    sys.objects o
WHERE   o.[Type] = 'V' -- View 
ORDER BY o.NAME  
--OR 
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        Name AS ViewName ,
        create_date
FROM    sys.Views
ORDER BY Name 
--OR
SELECT  @@Servername AS ServerName ,
        TABLE_CATALOG ,
        TABLE_SCHEMA ,
        TABLE_NAME ,
        TABLE_TYPE
FROM     INFORMATION_SCHEMA.TABLES
WHERE   TABLE_TYPE = 'VIEW'
ORDER BY TABLE_NAME 
--OR 
-- CREATE VIEW Code 
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DB_Name ,
        o.name AS 'ViewName' ,
        o.Type ,
        o.create_date ,
        sm.[DEFINITION] AS 'View script'
FROM    sys.objects o
        INNER JOIN sys.sql_modules sm ON o.object_id = sm.OBJECT_ID
WHERE   o.Type = 'V' -- View 
ORDER BY o.NAME;


SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        o.name AS StoredProcedureName ,
        o.[Type] ,
        o.create_date
FROM    sys.objects o
WHERE   o.[Type] = 'P' -- Stored Procedures 
ORDER BY o.name

--OR 
-- Додаткова інформація про ЗП
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DB_Name ,
        o.name AS 'ViewName' ,
        o.[type] ,
        o.Create_date ,
        sm.[definition] AS 'Stored Procedure script'
FROM    sys.objects o
        INNER JOIN sys.sql_modules sm ON o.object_id = sm.object_id
WHERE   o.[type] = 'P' -- Stored Procedures 
        -- AND sm.[definition] LIKE '%insert%'
        -- AND sm.[definition] LIKE '%update%'
        -- AND sm.[definition] LIKE '%delete%'
        -- AND sm.[definition] LIKE '%tablename%'
ORDER BY o.name;






SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DB_Name ,
        o.name AS 'Functions' ,
        o.[Type] ,
        o.create_date
FROM    sys.objects o
WHERE   o.Type = 'FN' -- Function 
ORDER BY o.NAME;

--OR 
-- Додаткова інформація про функції

SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DB_Name ,
        o.name AS 'FunctionName' ,
        o.[type] ,
        o.create_date ,
        sm.[DEFINITION] AS 'Function script'
FROM    sys.objects o
        INNER JOIN sys.sql_modules sm ON o.object_id = sm.OBJECT_ID
WHERE   o.[Type] = 'FN' -- Function 
ORDER BY o.NAME;




SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        parent.name AS TableName ,
        o.name AS TriggerName ,
        o.[Type] ,
        o.create_date
FROM    sys.objects o
        INNER JOIN sys.objects parent ON o.parent_object_id = parent.object_id
WHERE   o.Type = 'TR' -- Triggers 
ORDER BY parent.name ,
        o.NAME 
--OR 
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DB_Name ,
        Parent_id ,
        name AS TriggerName ,
        create_date
FROM    sys.triggers
WHERE   parent_class = 1
ORDER BY name;
--OR 
-- Додаткова інформація по тригерах
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DB_Name ,
        OBJECT_NAME(Parent_object_id) AS TableName ,
        o.name AS 'TriggerName' ,
        o.Type ,
        o.create_date ,
        sm.[DEFINITION] AS 'Trigger script'
FROM    sys.objects o
        INNER JOIN sys.sql_modules sm ON o.object_id = sm.OBJECT_ID
WHERE   o.Type = 'TR' -- Triggers 
ORDER BY o.NAME;



SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        parent.name AS 'TableName' ,
        o.name AS 'Constraints' ,
        o.[Type] ,
        o.create_date
FROM    sys.objects o
        INNER JOIN sys.objects parent
               ON o.parent_object_id = parent.object_id
WHERE   o.Type = 'C' -- Check Constraints 
ORDER BY parent.name ,
        o.name 
--OR 
--CHECK constriant definitions
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        OBJECT_SCHEMA_NAME(parent_object_id) AS SchemaName ,
        OBJECT_NAME(parent_object_id) AS TableName ,
        parent_column_id AS  Column_NBR ,
        Name AS  CheckConstraintName ,
        type ,
        type_desc ,
        create_date ,
        OBJECT_DEFINITION(object_id) AS CheckConstraintDefinition
FROM    sys.Check_constraints
ORDER BY TableName ,
        SchemaName ,
        Column_NBR 






		SELECT  @@Servername AS Server ,
        DB_NAME() AS DBName ,
        isc.Table_Name AS TableName ,
        isc.Table_Schema AS SchemaName ,
        Ordinal_Position AS  Ord ,
        Column_Name ,
        Data_Type ,
        Numeric_Precision AS  Prec ,
        Numeric_Scale AS  Scale ,
        Character_Maximum_Length AS LEN , -- -1 means MAX like Varchar(MAX) 
        Is_Nullable ,
        Column_Default ,
        Table_Type
FROM     INFORMATION_SCHEMA.COLUMNS isc
        INNER JOIN  information_schema.tables ist
              ON isc.table_name = ist.table_name 
--      WHERE Table_Type = 'BASE TABLE' -- 'Base Table' or 'View' 
ORDER BY DBName ,
        TableName ,
        SchemaName ,
        Ordinal_position;  
-- Назви стовпців та кількість повторів
-- Використовується для пошуку одноіменних стовпців з різними типами даних
SELECT  @@Servername AS Server ,
        DB_NAME() AS DBName ,
        Column_Name ,
        Data_Type ,
        Numeric_Precision AS  Prec ,
        Numeric_Scale AS  Scale ,
        Character_Maximum_Length ,
        COUNT(*) AS Count
FROM     information_schema.columns isc
        INNER JOIN  information_schema.tables ist
               ON isc.table_name = ist.table_name
WHERE   Table_type = 'BASE TABLE'
GROUP BY Column_Name ,
        Data_Type ,
        Numeric_Precision ,
        Numeric_Scale ,
        Character_Maximum_Length; 
--Інформація по типам даних, що використовуються
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        Data_Type ,
        Numeric_Precision AS  Prec ,
        Numeric_Scale AS  Scale ,
        Character_Maximum_Length AS [Length] ,
        COUNT(*) AS COUNT
FROM     information_schema.columns isc
        INNER JOIN  information_schema.tables ist
               ON isc.table_name = ist.table_name
WHERE   Table_type = 'BASE TABLE'
GROUP BY Data_Type ,
        Numeric_Precision ,
        Numeric_Scale ,
        Character_Maximum_Length
ORDER BY Data_Type ,
        Numeric_Precision ,
        Numeric_Scale ,
        Character_Maximum_Length  
-- Пам'ятайте, що індекси по цих таблиць не можуть бути перебудовані в режимі "online"
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        isc.Table_Name ,
        Ordinal_Position AS  Ord ,
        Column_Name ,
        Data_Type AS  BLOB_Data_Type ,
        Numeric_Precision AS  Prec ,
        Numeric_Scale AS  Scale ,
        Character_Maximum_Length AS [Length]
FROM     information_schema.columns isc
        INNER JOIN  information_schema.tables ist
               ON isc.table_name = ist.table_name
WHERE   Table_type = 'BASE TABLE'
        AND ( Data_Type IN ( 'text', 'ntext', 'image', 'XML' )
              OR ( Data_Type IN ( 'varchar', 'nvarchar', 'varbinary' )
                   AND Character_Maximum_Length = -1
                 )
            ) -- varchar(max), nvarchar(max), varbinary(max) 
ORDER BY isc.Table_Name ,
        Ordinal_position;




		SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        OBJECT_SCHEMA_NAME(object_id) AS SchemaName ,
        OBJECT_NAME(object_id) AS Tablename ,
        Column_id ,
        Name AS  Computed_Column ,
        [Definition] ,
        is_persisted
FROM    sys.computed_columns
ORDER BY SchemaName ,
        Tablename ,
        [Definition]; 
--Or 
-- Computed Columns 
SELECT  @@Servername AS ServerName ,
        DB_NAME() AS DBName ,
        OBJECT_SCHEMA_NAME(t.object_id) AS SchemaName,
        t.Name AS TableName ,
        c.Column_ID AS Ord ,
        c.Name AS Computed_Column
FROM    sys.Tables t
        INNER JOIN sys.Columns c ON t.object_id = c.object_id
WHERE   is_computed = 1
ORDER BY t.Name ,
        SchemaName ,
        c.Column_ID 


