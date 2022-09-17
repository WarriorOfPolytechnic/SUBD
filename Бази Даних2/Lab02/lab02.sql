create login db_prorector with password = '11111111' 
use Lab1Student
create user db_prorector for login db_prorector

--роли БД
alter role dbcreator add member db_prorector
exec sp_helprolemember
exec sp_helpsrvrolemember

--разрешения для пользователя
grant select, insert, alter, delete to db_prorector

--новая роль БД
create role owner_role authorization db_ddladmin
alter role db_ddladmin add member db_prorector


--Проверка прав доступа:
SELECT DB_NAME() AS 'Database', p.name, p.type_desc, p.is_fixed_role, dbp.state_desc,
dbp.permission_name, so.name, so.type_desc
FROM sys.database_permissions dbp
LEFT JOIN sys.objects so ON dbp.major_id = so.object_id
LEFT JOIN sys.database_principals p ON dbp.grantee_principal_id = p.principal_id
--WHERE p.name = 'ProdDataEntry'
ORDER BY so.name, dbp.permission_name;exec sp_addlogin 
@loginame = 'db_student', 
@passwd='11111111'
exec sp_adduser 'db_student'
grant select ON Specialnist to db_student
grant select ON grupa to db_student
grant select ON Student to db_student

--создание роли
exec sp_addrole reader
grant select to reader

--Проверка
exec sp_helpuser
