CREATE DATABASE bdtest; 

create table test_index(
id int not null,
pole1 char(36) not null,
pole2 char(216) not null
)DROP TABLE dbo.test_index;SELECT * FROM test_indexselect OBJECT_NAME(object_id) as table_name,
name as index_name, type, type_desc
from sys.indexes
where OBJECT_ID = OBJECT_ID(N'test_index')

select index_type_desc, page_count, record_count, avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats
(db_id(), OBJECT_ID(OBJECT_ID(N'test_index')), null, null, 'Detailed')
where OBJECT_ID = OBJECT_ID(N'test_index')exec dbo.sp_spaceused @objname = N'test_index', @updateusage = true;insert into test_index
values(1, 'a', 'b')
SELECT * FROM test_index

declare @i as int=1
while @i<30
begin
set @i = @i+1;
insert into test_index
values(@i, 'a','b')
end;
SELECT * FROM test_index

insert into test_index
values(31, 'a','b')
SELECT * FROM test_index

declare @j as int=31
while @j<240
begin
set @j = @j+1;
insert into test_index
values(@j, 'a','b')
end;
SELECT * FROM test_index

insert into test_index
values(241, 'a','b')
SELECT * FROM test_index

truncate table test_index
create clustered index idx_cl_id on test_index(id)
select OBJECT_NAME(object_id) as table_name,
name as index_name, type, type_desc
from sys.indexes
where OBJECT_ID = OBJECT_ID(N'test_index')

declare @ii as int=0
while @ii<621
begin
set @ii = @ii+1;
insert into test_index
values(@ii, 'a','b')
end;
SELECT * FROM test_index

select index_type_desc, index_depth, index_level, page_count,
record_count, avg_page_space_used_in_percent, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats
(db_id(), OBJECT_ID(OBJECT_ID(N'dbo.test_index')), Null, Null, 'Detailed')
where OBJECT_ID = OBJECT_ID(N'dbo.test_index')
exec dbo.sp_spaceused @objname = N'test_index', @updateusage = true;

insert into test_index
values(622, 'a','b')
SELECT * FROM test_index

truncate table test_index
declare @jj as int=0
while @jj<8906
begin
set @jj = @jj+1;
insert into test_index
values(@jj%100, 'a','b')
end;
SELECT * FROM test_index

insert into test_index
values(8909%100, 'a','b')
SELECT * FROM test_index

truncate table test_index
drop index idx_cl_id on test_index
create clustered index idx_cl_pole1 on test_index(pole1)
declare @iii as int=0
while @iii<9000
begin
set @iii = @iii+1;
insert into test_index
values(@iii, format(@iii, '0000'),'b')
end;
SELECT * FROM test_indextruncate table test_index
declare @jjj as int=0
while @jjj<9000
begin
set @jjj = @jjj+1;
insert into test_index
values(@jjj, cast(newid() as char(36)),'b')
end;
SELECT * FROM test_indexalter index idx_cl_pole1 on test_index rebuilddrop index idx_cl_pole1 on test_index
/*реорганізація таблиці за допомогою стовпця pole1 як ключа некластеризації*/
create nonclustered index idx_ncl_pole1 on test_index(pole1)
truncate table test_index
/*перевірка*/
select OBJECT_NAME(object_id) as table_name,
name as index_name, type, type_desc
from sys.indexes
where OBJECT_ID = OBJECT_ID(N'test_index')

/*заповнення таблиці*/
declare @ij as int=0
while @ij<24472
begin
set @ij = @ij+1;
insert into test_index
values(@ij, format(@ij, '0000'),'b')
end;
SELECT * FROM test_index/*вставлення ще одного рядка*/
insert into test_index
values(24473, '000024473','b')drop index idx_cl_id on test_index
create clustered index idx_cl_pid on test_index(id)
create nonclustered index idx_ncl_pole1 on test_index(pole1)
truncate table test_index/*перевірка*/
select OBJECT_NAME(object_id) as table_name,
name as index_name, type, type_desc
from sys.indexes
where OBJECT_ID = OBJECT_ID(N'test_index')declare @ijj as int=0
while @ijj<28864
begin
set @ijj = @ijj+1;
insert into test_index
values(@ijj, format(@ijj, '0000'),'b')
end;insert into test_index
values(28865, '000028865','b')alter index idx_ncl_pole1 on test_index rebuild
alter index idx_cl_pid on test_index rebuild