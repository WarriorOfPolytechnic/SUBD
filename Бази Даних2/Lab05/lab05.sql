USE [laboratory5] 

create table student(
		id int IDENTITY(1,1) not null primary key,
		[name] varchar(50),
		birthday date,
		stat varchar(20),
		name_group varchar(10)
	);
	create table vukladach(
		id int IDENTITY(1,1) not null primary key,
		[name] varchar(50),
		birthday date,
		stat varchar(20),
	);
	create table groups(
		id int IDENTITY(1,1) not null primary key,
		[name] varchar(50),
		number varchar(10)
	);
 
	insert into student ([name], birthday, stat, name_group) values 
		('Дмитро', '2002-06-15', 'male', 'ІПЗ-19-3'),
		('Тарас', '2002-06-15', 'male', 'ІПЗ-19-3'),
		('Максим', '2002-06-15', 'male', 'ІПЗ-19-3'),
		('Олег', '2002-06-15', 'male', 'ІПЗ-19-3'),
		('Іван', '2002-06-15', 'male', 'ІПЗ-19-3');

	insert into  vukladach([name], birthday, stat) values 
		('Олена Іванівна', '2002-06-15', 'male'),
		('Дмитро Олегович', '2002-06-15', 'female'),
		('Анна Сергіївна', '2002-06-15', 'female');

	insert into  groups([name], number) values 
		('ІПЗ-19-3', '121'),
		('КБ-19-1', '125'),
		('КІ-19-1', '123');

	select * from student;
	select * from vukladach;
	select * from groups;


	create proc Find_student
	@name varchar(20)
	as
		select [name], birthday, stat, name_group
		from student
		where [name] like @name;
	

	create proc Add_student
	   @name varchar(50),
	   @birthday varchar(20),
	   @stat varchar(20),
	   @name_group varchar(10)
	   as
	   begin
		   insert into student
		   values(@name, @birthday, @stat, @name_group)
	end;


	create proc Update_student
		@name varchar(50),
		@birthday varchar(30)
		as
		begin
			update student
			set birthday=@birthday
			where [name]=@name;
	end;


	create proc Delete_student
		@name varchar(50)
		as
		begin
			delete
			from student
			where [name]=@name;
	end;

