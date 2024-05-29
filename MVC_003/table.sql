create table student_202205(
	studentid char(8) primary key,
	studentname varchar2(20),
	majorcode char(2),
	jumin varchar2(14),
	phone varchar2(13),
	course char(2)
);
insert into student_202205 values('2022001','김길동','03','030101-3000001','010-1111-0001','BD');
insert into student_202205 values('2022002','이길동','03','030101-3000002','010-1111-0002','BD');
insert into student_202205 values('2022003','박길동','03','030101-3000003','010-1111-0003','BD');
insert into student_202205 values('2022004','정길동','03','030101-3000004','010-1111-0004','BD');
insert into student_202205 values('2022005','최길동','03','030101-3000005','010-1111-0005','BD');
insert into student_202205 values('2022006','황길동','03','030101-3000006','010-1111-0006','BD');

select * from student_202205;

create table subject_202205(
	subjectcode char(4) primary key,
	subjectname varchar2(40),
	professorname varchar2(20),
	classification char(2)
);

insert into subject_202205 values('S001','메타버스의이해','김교수','02');
insert into subject_202205 values('S002','게임엔진기초','이교수','01');
insert into subject_202205 values('S003','게임엔진심화','박교수','01');
insert into subject_202205 values('S004','인문학개론','정교수','04');

select * from subject_202205;

create table grade_202205(
	studentid char(8),
	subjectcode char(4),
	mid number(3,0),
	finals number(3,0),
	attend number(3,0),
	report number(3,0),
	etc number(3,0),
	primary key(studentid,subjectcode)
);

drop table grade_202205;
select * from grade_202205;

insert into grade_202205 values('2022001','S001',70,80,100,100,90);
insert into grade_202205 values('2022001','S002',80,85,100,90,90);
insert into grade_202205 values('2022001','S003',70,80,100,100,100);

insert into grade_202205 values('2022002','S001',70,80,90,90,100);
insert into grade_202205 values('2022002','S002',60,70,100,90,100);
insert into grade_202205 values('2022002','S003',70,70,100,100,90);

insert into grade_202205 values('2022003','S001',90,90,90,100,100);
insert into grade_202205 values('2022003','S002',90,85,100,100,100);
insert into grade_202205 values('2022003','S003',100,100,100,90,100);

insert into grade_202205 values('2022004','S004',90,90,90,90,90);
insert into grade_202205 values('2022004','S001',100,85,90,85,90);

select a.studentid, a.studentname, a.jumin, b.subjectname, 
 b.classification, b.professorname, 
 c.mid, c.finals, c.attend, c.report, c.etc
 from  student_202205 a,  subject_202205 b, grade_202205 c
where a.studentid = c.studentid and b.subjectcode = c.subjectcode
order by b.subjectname asc;

select a.course, a.studentid, a.studentname, 
 sum((b.mid*0.3)+(b.finals*0.3)+(b.attend*0.2)+(b.report*0.1)+(b.etc*0.1)) score, 
 count(a.studentid) count, 
 sum((b.mid*0.3)+(b.finals*0.3)+(b.attend*0.2)+(b.report*0.1)+(b.etc*0.1)) / count(a.studentid) score2
 from   student_202205 a, grade_202205 b
where a.studentid = b.studentid
group by a.course, a.studentid, a.studentname
order by a.studentid asc;