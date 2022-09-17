Create Database Lab6StudentZaVariantom;  

create table Lab6StudentZaVariantom.dbo.kafedra
 (id_kafedru int IDENTITY(1,1) not null primary key,
  nazva_kafedru varchar(100) constraint  nazva_kafedru_format check (nazva_kafedru like '[�-�]%'),
  name_zav_kafedru varchar(50) constraint name_zav_kafedru_format check (name_zav_kafedru like '[�-�]%') ,
  surname_zav_kafedru  varchar(50) constraint surname_zav_kafedru_format check (surname_zav_kafedru like '[�-�]%') ,
  middlename_zav_kafedru  varchar(50) constraint middlename_zav_kafedru_format check (middlename_zav_kafedru like '[�-�]%') ,
  kabinet varchar(50) not null,
  telefon char(12) check (telefon like '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

  create table Lab6StudentZaVariantom.dbo.Specialnist
 (id_specialnosti int IDENTITY(1,1) not null primary key,
  nazva_specialnosti varchar(50) constraint  nazva_specialnosti_format check (nazva_specialnosti like '[�-�]%'),
  shufr_specialnosti varchar(50) not null,
  kvalifikacia  varchar(50) constraint  kvalifikacia_format check (kvalifikacia like '[�-�]%'),
  id_kafedru int not null references kafedra(id_kafedru) on update cascade on delete cascade)

  create table Lab6StudentZaVariantom.dbo.grupa
 (id_group int IDENTITY(1,1) not null primary key,
  shufr_group varchar(50) not null,
  forma_navchanna varchar(50) not null,
  id_specialnosti int not null references Specialnist(id_specialnosti) on update cascade on delete cascade)

  create table Lab6StudentZaVariantom.dbo.Pruchuna_vidrahuvanna
 (id_pruchuna_vidrah int IDENTITY(1,1) not null primary key,
   nazva_vidrah varchar(50) constraint  nazva_vidrah_format check (nazva_vidrah like '[�-�]%'))

    create table Lab6StudentZaVariantom.dbo.Student
 (id_studenta int IDENTITY(1,1) not null primary key,
  name_st varchar(50) constraint name_st_format check (name_st like '[�-�]%') ,
  surname_st varchar(50) constraint surname_st_format check (surname_st like '[�-�]%') ,
  middlename_st  varchar(50) constraint middlename_st_format check (middlename_st like '[�-�]%') ,
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
  Lab6StudentZaVariantom.dbo.kafedra (nazva_kafedru,name_zav_kafedru,surname_zav_kafedru,middlename_zav_kafedru,kabinet,telefon)
 Values ('������� ������ � ������ �����������', '����������', '������', '��������', '221', '(093)2616175'),
 ('������� ���������� � ������������ ����������', '����', '����������', '���������', '310', '(096)3773435'),
 ('������� ���������� �������� � �����������-��������������� ����������, ����������� � �������������', '�����', '���������', '��������', '417', '(063)7645142')

   Insert into
 Lab6StudentZaVariantom.dbo.Pruchuna_vidrahuvanna (nazva_vidrah)
 Values ('�� ������������ �������'),
 ('�� ������������� ��������������'),
 ('�� ���������� ��������')

 Insert into
  Lab6StudentZaVariantom.dbo.Specialnist (nazva_specialnosti,shufr_specialnosti,kvalifikacia, id_kafedru)
 Values ('���������� ����������', '113', '���������� �� �������������� �����������,���������', '3'),
 ('���������� ��������������', '133', '������-�������', '1'),
 ('������������ �����', '122', '���������� �� �������������� �����������', '2')

  Insert into
  Lab6StudentZaVariantom.dbo.grupa (shufr_group,forma_navchanna, id_specialnosti)
 Values ('��-20-1', '�������','4' ),
 ('��-4', '�������', '2'),
 ('��-19-2', '�������', '3')

  Insert into
   Lab6StudentZaVariantom.dbo.Student (Student.name_st,surname_st ,middlename_st,datanarod_st,adresa_st,tel_st,rik_vstupu_st,byudzhet_contrack,nom_zalikovki,data_vidrahuvanna, id_pruchuna_vidrah,id_group)
 Values ('�������', '��������', '���������', '2001-04-02', '�������� �������, ����� ����, ��. �������� ������, 81', '(063)5968840', '2018-09-01', '������', '0334243', '2022-06-30','2','3'),
 ('�����', '��������', '����������', '2002-05-15', '����������� �������, ����� �������, ��. ��������, 48', '(099)4481459', '2019-09-01', '��������', '0344243', '2023-06-30','1','1'),
 ('��������', '�����', '���������', '2003-06-21', '����������� �������, ����� �������, ��. �������� �����, 11', '(096)4843973', '2020-09-01', '��������', '0349243', '2024-06-30','3','2')

 /*��������� ������ ��� ������ �� �������� ���������.*/
  CREATE PROCEDURE Procedure1 AS
  BEGIN
  SELECT * FROM Pruchuna_vidrahuvanna WHERE nazva_vidrah LIKE '��%'
  END;
  EXEC Procedure1

  /*��������� ������ ��� ��������� ������.*/
 CREATE PROCEDURE Procedure2 AS
 BEGIN
 INSERT INTO 
 Lab6StudentZaVariantom.dbo.grupa (shufr_group,forma_navchanna, id_specialnosti) 
 Values ('���-19-3', '�������','4' );
 UPDATE grupa SET shufr_group=1 WHERE id_specialnosti='4'
 END;
 EXEC Procedure2

 /*��������� ������ ��� ��������� ������.*/
 CREATE PROCEDURE Procedure3 AS
 BEGIN
 DELETE FROM kafedra WHERE surname_zav_kafedru='������';
 END;
 EXEC Procedure3


 /*������ ��� ��������� ���������� ��� ������� ��� �������� ������, ��� ��� ��������� ������.*/
CREATE TRIGGER Insert_Pruchuna_vidrahuvanna ON Pruchuna_vidrahuvanna FOR INSERT AS
IF EXISTS(SELECT * FROM inserted I
JOIN Pruchuna_vidrahuvanna T ON I.[nazva_vidrah] = T.[nazva_vidrah])
BEGIN
	ROLLBACK TRAN PRINT '�� ������ ��� ������� ������� �����������'
END

/*������ ��� ��������� ���������� ��� ����������� ��������� ������� ������.*/
CREATE TRIGGER Delete_Student ON Student FOR DELETE AS
IF NOT EXISTS(SELECT * FROM deleted D
WHERE adresa_st like '%����')
BEGIN
	ROLLBACK TRAN PRINT '������� ������� � ���. ������� ���������'
END

/*������ ��� ��������� ���������� ��� ������������� ��������� ���� "���� ����������".*/
CREATE TRIGGER Vozrast ON dbo_Student FOR INSERT AS
IF EXISTS((SELECT count(*)
FROM Student
WHERE datanarod_st(current_date(), interval 16 year) < new.birthday) > 0)
BEGIN
     ROLLBACK TRAN PRINT '��������� �� �� 16 ����';
END