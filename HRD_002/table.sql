create table guest_2024(
	userid char(15) primary key,
	username varchar2(20) not null,
	passwd char(10),
	jumin char(13),
	gender char(1),
	address varchar2(50),
	jobcd number(2),
	mailrcv char(1),
	intro varchar2(50)
);

select * from guest_2024;

insert into guest_2024 values('seojm','서정만','s123!','0000001111111','1','평택시 비전동 283',3,'Y','한국대교수');
insert into guest_2024 values('kks','김규성','k345!!','1111112222222','1','수원시 영통구 그린아파트',2,'Y','삼성전자 부장');
insert into guest_2024 values('shm','손흥민','s678!!','3333334444444','1','서울시 여의도동 23',3,'Y','토트넘 FC');
insert into guest_2024 values('kds','김다솔','k222!!','5555556666666','2','수원시 영통구 111',1,'N','수원공고 학생');
insert into guest_2024 values('jhk','김연경','k007!!','7777778888888','2','청주시 청원군 항군로 108',5,'N','육군장교');

