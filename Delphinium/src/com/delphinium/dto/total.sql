-----------------------------------------------------------------------------------------------------------CLEAR EVERYTHING

drop table review;
drop table qa;
drop table cart;
drop table orders;
drop table board;
drop table MERCHANDISE;
drop table member;

drop sequence md_seq;
drop sequence no_seq;
drop sequence pro_seq;
drop sequence od_seq;
drop sequence cart_seq;
drop sequence qa_seq;
drop sequence rv_seq;


-----------------------------------------------------------------------------------------------------------MAKE NEW THINGS

create table member(
userlevel number(1) not null,
userid varchar2(20) primary key,
userpw varchar2(20) not null,
cname varchar2(20) default 1 not null ,
name  varchar2(20) not null,
birth varchar2(20) default '2000-01-01' not null,
gender number(1) default 1 not null ,
phone varchar2(20) not null,
address varchar2(100) not null,
regidate date default sysdate not null,
sns varchar2(1000) default 0 not null,
event number(1) default 1 not null 
);

create table merchandise (
md_num varchar2(20) primary key,
md_name varchar2(100) not null,
userID varchar2(20) not null,
cname varchar2(40) not null,
md_cate varchar2(100) not null,
md_date date default sysdate not null,
md_price number not null,
md_sim_info varchar2(1000) not null,
md_sim_pic varchar2(1000) not null,
md_det_info varchar2(4000) not null,
md_det_pic varchar2(1000) not null,
md_op1_name varchar2(1000) not null,
md_op2_name varchar2(1000) not null,
md_op3_name varchar2(1000) not null,
md_op1_val varchar2(2000) not null,
md_op2_val varchar2(2000) not null,
md_op3_val varchar2(2000) not null
);

create table board(
b_cate number(1) not null,
b_num number not null,
b_title varchar2(200) not null,
b_date date default sysdate not null,
b_content varchar2(4000) not null,
b_pic1 varchar2(1000) default '사진없음' not null,
b_pic2 varchar2(1000) default '사진없음' not null,
b_pic3 varchar2(1000) default '사진없음' not null
);

create table cart (
num number primary key,
userID varchar2(20) not null,
md_num varchar2(20) not null,
md_name varchar2(100) not null,
cname varchar2(40) not null,
md_price number not null,
md_sim_pic varchar2(1000) not null,
qty number not null,
md_op1_name varchar2(1000) not null,
md_op2_name varchar2(1000) not null,
md_op3_name varchar2(1000) not null,
md_op1_val varchar2(2000) not null,
md_op2_val varchar2(2000) not null,
md_op3_val varchar2(2000) not null
);

create table orders (
od_num varchar2(20) not null primary key,
od_date date default sysdate not null,
userID varchar2(20) not null,
md_num varchar2(20) not null,
md_name varchar2(100) not null,
cname varchar2(40) not null,
md_price number not null,
md_sim_pic varchar2(1000) not null,
qty number not null,
md_op1_name varchar2(1000) not null,
md_op2_name varchar2(1000) not null,
md_op3_name varchar2(1000) not null,
md_op1_val varchar2(2000) not null,
md_op2_val varchar2(2000) not null,
md_op3_val varchar2(2000) not null
);

create table qa (
md_num varchar2(20) not null,
qa_num number primary key,
userid varchar2(20) not null,
qa_title varchar2(1000) not null,
qa_date date default sysdate not null,
qa_content varchar2(4000) not null,
qa_ans varchar2(4000) not null
);

create table review(
md_num varchar2(20) not null,
rv_num number not null primary key,
userid varchar2(20) not null,
rv_md_star number default 3 not null,
rv_date date default sysdate not null,
rv_content varchar2(4000) not null
);

--------------------
create sequence od_seq start with 1 increment by 1;
create sequence md_seq start with 1 increment by 1;
create sequence no_seq increment by 1 start with 1;
create sequence pro_seq increment by 1 start with 1;
create sequence cart_seq start with 1 increment by 1;
create sequence qa_seq increment by 1 start with 1;
create sequence rv_seq increment by 1 start with 1;

alter table merchandise add constraint md_userID foreign key (userID) references member (userID);
alter table cart add constraint cart_md_num foreign key(md_num) references merchandise(md_num);
alter table cart add constraint cart_userID foreign key(userID) references member(userID);
alter table qa add constraint qa_md_num foreign key (md_num) references merchandise (md_num);
alter table qa add constraint qa_userid foreign key (userid) references member (userid);
alter table review add constraint rv_md_num foreign key(md_num) references merchandise(md_num);
alter table review add constraint rv_userid foreign key(userid) references member(userid);







-----------------------------------------------------------------------------------------------------------MEMBER


insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(0,'admin','delp','델피니움','2020-01-01','1993-07-01','010-1234-4561','서울시 송파구');


insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'curtain12','1234','이영애','2020-02-09','1993-07-01','010-1234-4561','서울시 송파구');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'perl34','1234','손예진','2020-02-10','1993-01-09','010-7894-5612','서울시 강남구 ');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'speaker56','1234','서지혜','2020-02-11','1993-10-08','010-4512-5623','서울시 강북구');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'moni78','1234','김태희','2020-02-12','1993-09-01','010-7894-4568','서울시 동대문구');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'cd90','1234','전지현','2020-02-13','1993-07-13','010-8956-7845','서울시 서대문구');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'tile12','1234','송혜교','2020-02-14','1993-05-19','010-5656-4545','서울시 마포구');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'win34','1234','김희선','2020-02-15','1993-09-06','010-9632-8521','서울시 도봉구');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'stripe56','1234','문채원','2020-02-16','1993-04-01','010-7896-4569','서울시 종로구');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'white78','1234','문근영','2020-02-17','1993-05-17','010-7532-9512','서울시 강서구');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'glass90','1234','하지원','2020-02-18','1993-06-04','010-1587-4593','서울시 구로구');

insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-75221','1234','리틀파머스','2020-04-14','강동원','010-7854-8569','http://littlefarmers.co.kr','서울시 금천구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-64-74562','1234','Avesu','2020-04-15','공유','010-7852-9852','https://www.avesu.eu/','서울시 중랑구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'335-45-75223','1234','붐베이직','2020-04-16','김우빈','010-7896-3214','http://boombasic.co.kr','서울시 중구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-75-74624','1234','Etsy','2020-04-17','하정우','010-8547-1452.','https://www.etsy.com/','서울시 서초구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'679-45-75225','1234','망넛이네','2020-04-18','김윤석','010-9652-7854','https://mangnut2.com/index.html','서울시 성북구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-15-74556','1234','sweet meal','2020-04-19','원빈','010-4562-6542','http://www.sweetmeal.net/goods/goods_view.php?goodsNo=1000000591&inflow=naver&NaPm=ct%3Dke3z80sw%7Cci%3D0z80003-vxXtD-YVCLnT%7Ctr%3Dpla%7Chk%3D1304608adac3440b84ef5032640cdf9248605319','서울시 성동구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-75227','1234','Eat''s Better','2020-04-20','장동건','010-8547-7458','https://smartstore.naver.com/eatsbetter/products/3455023703?n_media=27758&n_query=%EB%B9%84%EA%B1%B4%EB%A7%88%EC%9A%94%EB%84%A4%EC%A6%88&n_rank=1&n_ad_group=grp-a001-02-000000012911940&n_ad=nad-a001-02-000000091302432&n_campaign_type=2&n_mall_pid=3455023703&n_ad_group_type=2&NaPm=ct%3Dke3zchao%7Cci%3D0zq0002ovNXt37lOWuXm%7Ctr%3Dpla%7Chk%3D972013dee94c23623f7243823480e440bfe23c6a','서울시 동작구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'799-96-75228','1234','헬로네이처','2020-04-21','이정재','010-6655-4455','https://www.hellonature.co.kr/fsr000.do?goTo=searchYn&keyword=%25EB%259D%25BC%25EB%25B0%259C%25EB%259E%2580%25EC%258A%25A4&tapItem=Y&stamp=S1234','서울시 광진구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-75229','1234','SERUMKIND','2020-04-22','정우성','010-8546-6549','https://www.completone.com/serumkind.html','서울시 금천구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-75230','1234','DEARDAHLIA','2020-04-23','고수','010-8462-9431','https://deardahlia.com/index.html','서울시 관악구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-46-78521','1234','phykology','2020-04-24','임시완','010-8852-9431','http://www.phykology.com/?NaPm=ct%3Dke54uud4%7Cci%3D0z40003NzO1tkkJWXuWt%7Ctr%3Dsa%7Chk%3D78602cd6df05fda7d707164839aecae68e00f314','서울시 관악구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'459-45-75232','1234','Gilla8','2020-04-25','김도영','010-8462-1431','http://www.gilla8.com/index.html','서울시 관악구');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-36933','1234','BEIGIC','2020-04-26','김오이','010-9662-9431','https://www.beigic.com/index.html','서울시 관악구');







-----------------------------------------------------------------------------------------------------------MERCHANDISE

insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'숄더백-JUTE-HOBO-IL7FHB4034_GI','359-45-75221','리틀파머스','FASHION','2020-04-01',20000,'오리지널 햄프린넨 소재로 독특한 두께감과 내츄럴하면서도 엔틱함이 느껴지는 숄더백','upload\숄더백-JUTE-HOBO-IL7FHB4034_GI.jpg','린넨 가로 51cm 세로 63cm','upload\숄더백-JUTE-HOBO-IL7FHB4034_GI_디테일 사진.jpg','컬러','옵션없음','옵션없음','그레이','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'숄더백-SOFT-JUTE-BAG 1L7FHB4009_G2','359-45-75221','리틀파머스','FASHION','2020-04-02',20000,'크롬을 사용하지 않는 베지터블 가죽으로 식물에서 유래한 탄닌으로 무두질한 숄더백','upload\숄더백 SOFT JUTE BAG.png','린넨 가로 45cm 세로 55cm','upload\숄더백 SOFT JUTE BAG_디테일 사진.jpg','컬러','옵션없음','옵션없음','그레이','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM WALLET 1L7FWL0184_KR','359-45-75221','리틀파머스','FASHION','2020-04-03',10000,'가죽의 질감은 그대로 유지 무독성 특수 코팅제를 사용한 친환경적인 식물성 가죽 원단 지갑입니다.','upload\SUUM WALLET 1L7FWL0184_KR.jpg','페이퍼코튼 가로 12cm 세로 9cm 두께 0.07cm','upload\SUUM WALLET 1L7FWL0184_KR_디테일 사진.jpg','컬러','옵션없음','옵션없음','화이트,블랙,크라프트','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM BACKPACK 876 1L7FHB0876_D2','359-45-75221','리틀파머스','FASHION','2020-04-04',30000,'한지와 코튼을 접합시킨 소재로 특별한 장식없이 심플하게 디자인된 백팩입니다.','upload\SUUM BACKPACK 876 1L7FHB0876_D2.jpg','하운지, 리사이클 레더 가로 40cm 세로 39cm 끈길이 86cm (조절가능)','upload\SUUM BACKPACK 876 1L7FHB0876_D2_디테일 사진.jpg','컬러','옵션없음','옵션없음','블랙,브라운','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'DAYPACK BICHROME BLOOM','359-64-74562','Avesu','FASHION','2020-04-05',100000,'AEVOR의 배낭은 일상적인 사용을 위해 만들어진 기능적인 도시 백팩입니다. 소재는 50 %의 재활용 PET를 포함한 특수 마이크로 섬유로 만들어져 있습니다.','upload\DAYPACK BICHROME BLOOM.jpg','소재: 극세사 크기: 가로 48cm 세로 34cm 폭 14cm','upload\DAYPACK BICHROME BLOOM_디테일 사진.jpg','컬러','옵션없음','옵션없음','핑크랑라이트블루,블랙,핑크,바닐라','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'TRIPLET OMBRE','359-64-74562','Avesu','FASHION','2020-04-06',80000,'고품질 합성 피혁 안감은 재활용 나일론으로 제작된 여성백입니다.','upload\TRIPLET OMBRE.jpg','소재: 합성 피혁','upload\TRIPLET OMBRE_디테일 사진.jpg','컬러','옵션없음','옵션없음','블랙,릴리','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'COTTON BEANIE BLACK','359-64-74562','Avesu','FASHION','2020-04-07',30000,'심플하고 스타일리쉬한 면으로 제작된 비니입니다.','upload\COTTON BEANIE BLACK.jpg','소재: 면','upload\COTTON BEANIE BLACK_디테일 사진.jpg','컬러','옵션없음','옵션없음','블랙','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM HAUNJI CROSS BAG 1L6AHB0829_N2','359-45-75221','리틀파머스','FASHION','2020-04-08',15000,'하운지 소재 바디에 리사이클 소가죽이 콤비 되어 매우 가볍고 내구성이 뛰어난 파우치입니다.','upload\SUUM HAUNJI CROSS BAG 1L6AHB0829_N2.jpg','하운지, 리사이클 레더 가로 33cm 세로 20cm 끈길이 58cm','upload\SUUM HAUNJI CROSS BAG 1L6AHB0829_N2_디테일 사진.jpg','컬러','옵션없음','옵션없음','블랙, 네이비, 브라운','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM TOTE LONG SHOULDER BAG','359-45-75221','리틀파머스','FASHION','2020-04-09',30000,'언벨런스한 패턴, 코튼과 리사이클 소가죽이 콤비되어 매우 가볍고 내구성이 뛰어나며 미니멀하면서도 내추럴한 디자인입니다.','upload\SUUM TOTE LONG SHOULDER BAG.jpg','리사이클 레더 가로 47cm, 31cm 끈길이 96cm (조절불가능)','upload\SUUM TOTE LONG SHOULDER BAG_디테일 사진.jpg','컬러','옵션없음','옵션없음','블랙, 네이비, 브라운','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM SLOUCHY 873 1L7FHB0873_B2','359-45-75221','리틀파머스','FASHION','2020-04-10',18000,'한지와 코튼을 접합시킨 소재로 장식 없이 디자인된 심플하면서도 소프트한 바디감이 매력적인 백입니다.','upload\SUUM SLOUCHY 873 1L7FHB0873_B2.jpg','페이퍼코튼 가로 35cm 세로 27cm 끈길이 65cm (조절불가능)','upload\SUUM SLOUCHY 873 1L7FHB0873_B2_디테일 사진.jpg','컬러','옵션없음','옵션없음','블랙, 브라운','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'잉그리드 원피스','335-45-75223','붐베이직','FASHION','2020-04-11',140000,'린넨과 텐셀이 혼방된 원단으로 만들어진 반소매 원피스입니다.','upload\잉그리드 원피스.jpg','린넨 텐셀 어깨 38cm 가슴 51cm 팔길이 19.5cm 밑단 91cm 총기장 107cm','upload\잉그리드 원피스_디테일 사진.jpg','컬러','옵션없음','옵션없음','화이트,베이지,네이비','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'엘리아나 셔츠','335-45-75223','붐베이직','FASHION','2020-04-12',98000,'면 100% 트윌지로 만들어진 루즈한 핏의 롱기장의 원피스 스타일 셔츠입니다.','upload\엘리아나 셔츠.jpg','면 어깨 62cm 가슴 59cm 팔길이 50cm 총기장 106cm','upload\엘리아나 셔츠_디테일 사진.jpg','컬러','옵션없음','옵션없음','베이지,화이트,네이비,블랙','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'세탁비누','335-45-75223','붐베이직','LIFE','2020-04-14',12000,'일상생활에 스트레스를 받은 당신에게 힐링을 안겨줄 편안한 향기를 담은 세탁비누입니다.','upload\세탁비누.jpg','용량: 약 300g 가로 6cm 세로 9.5cm 두께 4cm ','upload\세탁비누_디테일 사진.jpg','향원료','종이가방','옵션없음','해스페리데스,레몬그라스,라벤더','1호(18+23cm/폭9cm),2호(22+28cm/폭9cm),3호(31+48cm/폭12cm),4호(50+38cm/폭15cm)','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'린넨 앞치마','335-45-75223','붐베이직','LIFE','2020-04-15',39000,'물기는 빨리 흡수하고 잘 마르는 린넨의 장점을 살린 내추럴한 감각의 앞치마입니다.','upload\린넨 앞치마.jpg','린넨 50% 면 50% 총폭 101cm 총기장 78cm 목끈길이 72cm 허리끈길이 86cm ','upload\린넨 앞치마_디테일 사진.jpg','컬러','옵션없음','옵션없음','스카이블루,아이보리,오트밀','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'에이스 침구커버 세트','335-45-75223','붐베이직','LIFE','2020-04-16',135000,'순면으로 만들어져 피부에 닿는 코튼의 감촉이 좋은 내추럴한 스트라이프 패턴의 침구커버 세트입니다.','upload\에이스 침구커버 세트.jpg','소재: 면 크기: 싱글/퀸 (이불커버 1개+베개커버 1개)','upload\에이스 침구커버 세트_디테일 사진.jpg','컬러','옵션없음','옵션없음','네이비,브라운,레드','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'자수 쿠션커버','335-45-75223','붐베이직','LIFE','2020-04-17',25000,'순면으로 만들어져 피부에 닿는 코튼의 감촉이 좋은 자수 쿠션커버입니다.','upload\자수 쿠션커버.jpg','소재: 면 크기: 가로 48cm 세로 48cm','upload\자수 쿠션커버_디테일 사진.jpg','컬러','옵션없음','옵션없음','아이스크림,병정,별','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'네추럴린넨 러너','335-45-75223','붐베이직','LIFE','2020-04-18',15000,'린넨과 코튼 소재의 내추럴한 감성의 러너입니다.','upload\네추럴린넨 러너.jpg','소재: 면 50% 린넨 50% 가로 62cm 세로 50cm','upload\네추럴린넨 러너_디테일 사진.jpg','컬러','옵션없음','옵션없음','브라운,오트밀,블랙,오렌지,스카이블루,옐로우,핑크','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'미모사 패브릭 미스트','335-45-75223','붐베이직','LIFE','2020-04-19',14000,'달콤하면서도 화사한 노란꽃의 향기처럼 파우더리한 린넨향을 느낄 수 있는 향입니다.','upload\미모사 패브릭 미스트.jpg','향원료: Orange, Raspberries, Lime, Mimosa petals, Jasmine, Ceder, Musk, Amber','upload\미모사 패브릭 미스트_디테일 사진.jpg','용량','옵션없음','옵션없음','100ml,500ml','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'슐 라 메르 제이드 프리미엄 세탁세제','335-45-75223','붐베이직','LIFE','2020-04-20',38000,'시원한 바다향을 맡으며 자란 제이드 찻잎에 포멜로 노트가 에워싸고 마테잎이 들어가서 허브같은 신선함이 느껴지는 강렬하면서도 차분한 향입니다.','upload\슐 라 메르 제이드 프리미엄 세탁세제.jpg','향원료: Jade leaves, Lemon, Pomelo, Mate Leaves, Jasmine','upload\슐 라 메르 제이드 프리미엄 세탁세제_디테일 사진.jpg','용량','옵션없음','옵션없음','100ml,500ml','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'Vegan Art Gifts Botanical Pencil Case','359-75-74624','Etsy','LIFE','2020-04-21',12500,'복스 가죽으로 제작된 예쁜 꽃무늬가 수놓아진 필통입니다.','upload\Vegan Art Gifts Botanical Pencil Case.jpg','가로: 29cm 세로 9cm ','upload\Vegan Art Gifts Botanical Pencil Case_디테일 사진.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'Go Vegan Face Mask Unisex Adult Kid Mouth Mask','359-75-74624','Etsy','LIFE','2020-04-22',10000,'면으로 제작된 친환경 마스크입니다.','upload\Go Vegan Face Mask Unisex Adult Kid Mouth Mask.jpg','소재: 면','upload\Go Vegan Face Mask Unisex Adult Kid Mouth Mask_디테일 사진.jpg','컬러','옵션없음','옵션없음','화이트,네이비,라이트블루','옵션없음','옵션없음');

insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'쇼콜라빵','679-45-75225','망넛이네','FOOD','2020-04-01',3510,'깊고 진한 비건 초콜릿의 풍미, 쇼콜라빵!','upload\쇼콜라빵.jpg','초코가 진해요','upload\D쇼콜라빵.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'얌핑거','679-45-75225','망넛이네','FOOD','2020-04-02',1710,'간편하고 맛있는 비건 간식 얌핑거','upload\얌핑거.jpg','얌얌 한입거리','upload\D얌핑거.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'찹싸루니','679-45-75225','망넛이네','FOOD','2020-04-03',3400,'베스트셀러, 쫀득한 비건 찹쌀 브라우니','upload\찹싸루니.jpg','쫀득찰떡','upload\D찹싸루니.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'비욘드미트 소시지','359-15-74556','sweet meal','FOOD','2020-04-04',17900,'고기 없는 고기, 비욘드미트','upload\비욘드미트소시지.jpg','아주 좋은 식감','upload\D비욘드미트소시지.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'잇츠베러마요','359-45-75227','Eats Better','FOOD','2020-04-05',5500,'약콩의 건강함과 고소함이 담긴 순식물성 마요네즈','upload\잇츠베러마요.jpg','부담없는 칼로리','upload\D잇츠베러마요.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'라발란스','799-96-75228','헬로네이처','FOOD','2020-04-06',3500,'식물성 단백질로 가득 채운 고단백 스낵','upload\라발란스_포도.jpg','바삭한 스낵','upload\D라발란스_포도.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'오틀리','799-96-75228','헬로네이처','FOOD','2020-04-07',6800,'고소하고 거품이 풍성하게 일어나는 귀리 음료','upload\오틀리.jpg','맛좋은 귀리 음료','upload\D오틀리.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'뷰티스위티즈 사우어캣츠','799-96-75228','헬로네이처','FOOD','2020-04-08',2300,'상큼새콤한 맛과 귀여운 고양이 모양의 콜라보','upload\뷰티스위티즈 사우어 캣츠.jpg','새콤달콤쫀득','upload\D뷰티스위티즈 사우어캣츠.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'바이오라이프 비건치즈 핫페퍼 슬라이스','799-96-75228','헬로네이처','FOOD','2020-04-09',15300,'감자 전분으로 구현한 완벽한 치즈의 식감!','upload\비건치즈 핫페퍼슬라이스.jpg','치즈라니~!','upload\D비건치즈.jpg','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');

insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'YELLOWMELLO DROP','359-45-75229','SERUMKIND','BEAUTY','2020-02-01',38000,'싱그러운 모과가 선사하는 포어밸런싱','upload\1-1.세럼카인드(옐로우드롭).png','포르투갈 마르멜로(털모과) 잎 추출물을 담은 마르멜로 콤플렉스 89%를 함유, 모공의 개수, 크기, 부피, 넓이 까지 4중 멀티 케어가 가능한 모공세럼','upload\1-2.세럼카인드(옐로우드롭).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'메즈머라이징 모먼트 컬렉션 팔레트 문라이트 실루엣','359-45-75230','DEARDAHLIA','BEAUTY','2020-02-02',48000,'내면 속 아름다움과 우아함이 피어나는 황홀한 순간 메즈머라이징 모먼트 컬렉션','upload\2-1.디어달리아(문라이트 실루엣).png','디어달리아 메즈머라이징 모먼트 컬렉션 팔레트는 내면 속 아름다움과 우아함이 피어나는 황홀한 순간을 담은 컬렉션입니다. 벨벳 매트, 실키 쉬머, 하이 스파클 글리터의 다양한 텍스쳐가 한번의 터치만으로 풍부한 컬러감을 선사하며 감각적이고 럭셔리한 8가지 쉐이드가 손쉬운 컬러 조합으로 구성되어 단독 또는 레이어링하여 원하는 룩에 따라 다양한 룩을 완성해줍니다.','upload\2-2.디어달리아(문라이트 실루엣).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'센슈어스 매트 립 수트','359-45-75230','DEARDAHLIA','BEAUTY','2020-02-03',26000,'내 입술에 수트를 입히다','upload\3-1.디어달리아(센슈어스매트립 수트).png','고발색의 컬러가 입술에 바르는 순간 가볍게 밀착되는 에어리 핏팅 포뮬러로 건조함이나 주름 부각 없이 실크 투 매트 피니쉬를 선사하는 리퀴드 립스틱입니다. 블렌딩이 쉬운 리퀴드 텍스처가 정교한 풀립부터 자연스러운 그라데이션까지 다양한 연출을 도와주며 묻어남과 번짐 없이 오랜 시간 유지 시켜줍니다.','upload\3-2.디어달리아(센슈어스매트립수트).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'파이콜로지 멀티 태스킹 토너','359-46-78521','phykology','BEAUTY','2020-02-04',29000,'거친 바닷속 끊임없이 재생하는 바다생명의 근원 미역귀의 힘으로 탄생한 미라클 보습','upload\4-1.파이콜로지(멀티태스킹 토너).png','물 같은 토너에 만족하셨다면 한방울 한방울 영양을 담은 에센스 토너를 만나보세요. 영양감 넘치는 롤링감과 피부에 즉시 스며드는 흡수력과 저밀도 수분 홀딩 시스템으로 건조한 피부에 즉각적 수분 공급해드립니다.','upload\4-2.파이콜로지(멀티태스킹 토너).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'듀얼 슈퍼 파워 래디언스 크림','459-45-75232','Gilla8','BEAUTY','2020-02-05',38000,'칙칙하고 어두운 피부, 피부에 조명이 필요할 때','upload\5-1.길라에잇(듀얼 슈퍼파워 래디언스 크림).png','끈적임 없이 부드럽고 촉촉한 보스렵으로 토너, 세럼 사용 후 적당량을 덜어 피부에 고르게 펴 바르고 부드럽게 흡수시켜줍니다.','upload\5-2.길라에잇(듀얼 슈퍼파워 래디언스 크림).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'비건 듀얼 슈퍼 파워 래디언스 에센스 부스터','459-45-75232','Gilla8','BEAUTY','2020-02-06',28000,'칙칙하고 어두운 피부, 피부에 조명이 필요할 때','upload\6-1.길라에잇(비건 듀얼 슈퍼파워 래디언스 에센스 부스터).png','수분 에센스와 오일에센스 하나로 강력한 더블 에센스로 핑크빛 피부완성','upload\6-2.길라에잇(비건 듀얼 슈퍼파워 래디언스 에센스 부스터).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'트리트먼트 로션','359-45-36933','BEIGIC','BEAUTY','2020-02-07',42000,'계절과 온도의 변화로 쉽게 건조해지고 민감해질 수 있는 피부를 수분으로 촘촘하게 채워 기초체력을 올려주는 워터 에센스','upload\7-1.베이지크(트리트먼트 로션).png','그린 커피빈 오일과 6가지 복합 펩타이드가 함유되어 자연적인 피부 재생을 도와 피부를 탄력있고 매끄럽게 해주고, 페퍼민트 잎과 프라지아 꽃 추출물이 예민해진 피부를 진정시켜 안색을 생기있고 화사하게 개선하는 데에 도움을 주는 점성이 있는 워터 에센스','upload\7-2.베이지크(트리트먼트 로션).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'스칼프_헤어 스파 케어 듀오','359-45-36933','BEIGIC','BEAUTY','2020-02-08',77000,'모발&두피 케어를 한번에','upload\8-1.베이지크(스칼프_헤어 스파 케어 듀오).png','항산화 성분과 비타민 E, 영양이 풍부한 그린 커비빈 오일로 최적의 유수분 밸런스를  맞춰 건강한 두피와 탄력있는 모발로 가꾸어 주는 100% 비건 포뮬러 딥케어 듀오 ','upload\8-2.베이지크(스칼프_헤어 스파 케어 듀오).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'코렉팅 페이셜 스크럽','359-45-36933','BEIGIC','BEAUTY','2020-02-09',38000,'커비빈 파우더의 효과적인 각질제거, 그린 커피빈 오일과 코코넛 오일의 수분감 있는 마무리로 깨끗하고 생기있는 피부로 가꿔주는 페이셜 스크럽','upload\9-1.베이지크(코렉팅 페이셜 스크럽).png','신선하게 로스팅된 커피파우더, 항산화 성분 및 비타민 E가 함유되어 자극 없이 각질을 제거해주고 동물성 성분이 없는 비건 성분으로 피부 본연의 재생 능력을 강화하여 메마른 겨울철에도 매끈하고 맑은 피부로 가꾸어주는 페이셜 스크럽','upload\9-2.베이지크(코렉팅 페이셜 스크럽).png','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음','옵션없음');





-----------------------------------------------------------------------------------------------------------NOTICE

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[안내] 고객센터 단축 운영 안내','2020-08-15','<pre>안녕하세요, 델피늄입니다.

 

\코로나19\ 2단계 격상으로 지역 사회 감염예방 및 확산 방지를 위해 아래와 같이 일시적으로 고객센터 상담 시간이 단축 운영됩니다. 

 

- 단축운영기간 : 8월 20일(목)-8월 28일(금)

- 운영시간 : 10:00-17:00

- 대상업무 : 대표번호 전화상담, 카카오톡 채팅 상담 

 

※ 사이트에 노출되는 상담 시간은 기존 운영 시간으로 노출되는 점 양해 부탁 드립니다.

※ 상기 운영 시간은 변경되거나 추가 연장될 수 있습니다.

 

단축근무 시간 내 모든 업무는 정상적으로 이루어질 예정이며,

상품페이지 내 QA 또는 1:1 게시판을 통해 남겨주시면 담당자가 순차적으로 답변드리겠습니다.

 

고객센터 단축 운영으로 인해 서비스 이용에 불편을 드려 사과의 말씀드리며, 

더욱 편리하고 만족하실 수 있는 서비스를 제공하고자 노력하겠습니다. 

 

감사합니다.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[안내] 8/14(택배 없는 날) , 8/17(임시공휴일) 배송 일정 및 고객센터 휴무 안내','2020-08-11','<pre>안녕하세요. 델피늄입니다.

항상 델피늄을 이용해주시는 고객님께 깊이 감사드립니다.

8/14일 (택배 없는 날), 8/17일 (임시공휴일)로 지정되어 배송일정과 

당사 고객센터 휴무에 대해 안내드리오니 사이트 이용에 참고 부탁드립니다.

 

■ 배송 일정

- 8/12 (수) 오후 4시 이전 결제 시 : 당일 출고

- 8/12 (수) 오후 4시 이후 결제 시 : 8/18 (화) 배송 개시

※ 도서산간지역의 경우 기재된 일정보다 1-2일 정도 일찍 마감될 수 있습니다.

※ 배송 물량이 급증되는 8월 18일부터 택배사의 사정에 따라 4-5일 배송 지연될 수 있습니다.

 - 각 브랜드/상품 유형 또는 택배사별로 안내드린 마감 일정과 상이할 수 있으니 정확한 배송 일정 문의는 상품 상세정보의 마감 일정 안내를 우선하여 참고 부탁드립니다.

 - 택배사 집하 마감 전 상품 출고가 되었으나, 지역/택배사별 사정에 따라 배송이 지연될 수 있습니다.

  

■ 고객센터 휴무 일정

- 8월 17일 (월)

- 주말을 포함한 연휴 기간 동안 전화상담/1:1문의/카카오톡 문의 및 상품문의를 포함한 상담 서비스가 중단되며, 8월 18일(화)부터 정상적으로 운영됩니다.

 

무더위에 지쳐 쉬고 싶은 마음이 가득한 뜨거운 여름입니다. 가뭄의 단비같은 휴가로 더위에 지치지않게 시원한 하루 되시길 바랍니다.

감사합니다
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '델피늄 사이트 접속 장애 사과 안내','2020-07-26','<pre>안녕하세요 델피늄입니다.

 

금일 오전,  델피늄 사이트 접속 장애가 발생하여 서비스 이용이 일시 중단되었습니다.

현재는 조치되어  정상 이용이 가능합니다. 

 

사이트 이용에 불편을 드린 점 진심으로 사과의 말씀 드립니다.

 

 

▧ 내용 : PC/Mobile 접속 일체

▧ 일시 : 2020년 05월 27일(수) 오전 9시 53분 ~ 11시 30분까지

 

추후 서비스 이용에 불편을 드리지 않도록 최선을 다하겠습니다.

감사합니다.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[안내] 카카오톡 운영시간 변경 안내','2020-07-02','<pre>안녕하세요, 고객님

델피늄을 이용해주시는 고객님께 깊이 감사드립니다.

 

카카오톡 상담 가능 시간이 5월 18일부터(월) 새롭게 변경되어 아래와 같이 운영됩니다.

 

- 기존 운영시간 :  평일 오전 09:00~18:00 (토/일, 공휴일 휴무)

- 변경 운영시간 :  평일 오전 09:00~17:00 (토/일, 공휴일 휴무)

 

카카오톡 외 모든 업무는 기존 운영 시간대로 이루어질 예정이며 상품페이지 내 QA 또는 1:1 게시판을 통해 남겨주시면 담당자가 순차적으로 답변드리겠습니다.

 

고객님께 더욱 편리하고 만족하실 수 있는 서비스를 제공하고자 노력하겠습니다.

감사합니다
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '개인정보 처리방침 변경 안내','2020-06-29','<pre>안녕하세요, 고객님

 

2020년 6월 29일자로 델피늄의 \\개인정보 처리방침\\에 변경된 사항을 안내드립니다.

 

1. 변경 조항

  - 15조 (개인정보 보호 책임자) 

 

2. 변경 사유 

  - 개인정보 보호책임자 및 청소년보호 책임자 및 관리자 변경

 

3. 내용 상세

  - 기존 책임/관리자 : 권지용 이사

  - 변경 책임/관리자 : 임시완 상무

 

자세한 내용은 다음 링크에서 확인 가능합니다

https://www.delphinium.com

  

감사합니다.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[델피늄] K패션오디션 댓글 당첨자10명 발표','2020-06-15','<pre>안녕하세요.

델피늄입니다.

 

05/25 - 06/05 동안 진행했던 "K패션오디션 : 올스타 ! 10명의 디자이너에게 투표하세요!"의 당첨자를 발표합니다. 

진행했던 이벤트 : https://delphinium.com

 

  

[당첨상품] 

*델피늄 쇼핑바우처 3만원증정(포인트로 지급예정)

 

 

 

[당첨자 10명] 

 





댓글번호 아이디 핸드폰번호 
155 cat7***@naver.com 010-8***-7049 
163 hyoj******@hanmail.net 010-9***-2800 
400 pong****@naver.com 010-9***-9051 
427 lesi***@me.com 010-3***-3604 
561 mirk*@naver.com 010-2***-7757 
604 masi*******@naver.com 010-5***-3140 
810 spri*******@naver.com 010-8***-8712 
826 euge*****@naver.com 010-9***-8318 
853 love***@hanmail.net 010-5***-7128 
900 limv*****@naver.com 
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[델피늄] 프론트로우 이벤트 적립금 지급 연기 안내','2020-06-05','<pre>안녕하세요.델피늄입니다. 

프론트로우 데님 기간 내 구매 시

무료교환 및 포토리뷰 시 2배 지급 적립금은 

익일 지급 될 예정입니다. 

기존 지급일 : 6월 05일 

변경일 : 6월 06일







사전 말씀드린 일정보다 지연된 점에 대해 사죄의 말씀드리며,

더 좋은 모습으로 나아가겠습니다.

감사합니다.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[델피늄] 땡스기빙포인트 투표 이벤트 당첨자 발표','2020-05-24','<pre>안녕하세요.

델피늄입니다.

 
 \\땡스기빙포인트\\ 투표 이벤트 당첨자를 발표합니다.

앞으로도 더 좋은 이벤트로 찾아오겠습니다.

감사합니다.

 






fre****@naver.com
 

j-yuj****@hanmail.net
 

aure******@naver.com
 

use*****@naver.com
 

mys***@gmail.com
 

ych***@naver.com
 

hyes*****@hanmail.net
 

phk***@hanmail.net
 

wldu*****@hanmail.net
 

konh*****@naver.com
 
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[델피늄] 수신동의 이벤트 당첨자 발표','2020-05-14','<pre>안녕하세요. 델피늄입니다.

4월 진행한 수신동의 이벤트 당첨자를 발표합니다!







ID 회원명 상품 
leedasom7**@naver.com 이다* Salondeju SJ17105WT+BW 
my1004sim**@hanmail.net 박올* OSOI MINI BROT [BRICK] 
gptjs**@nate.com 송혜* Salondeju SJ17105WT+BW 
sucre20**@naver.com 이지* ANCOTO X-STRAP SANDAL 
hyunk**@naver.com 남궁* Salondeju SJ17105WT+BW 
choiyl**@naver.com 최유* ANCOTO X-STRAP SANDAL 
bijou88**@naver.com 심용* ANCOTO DOUBLE-STRAP SANDAL 
a0011**@naver.com 이보* ANCOTO DOUBLE-STRAP SANDAL 


당첨된 회원님께는 제세공과금 관련하여 델피늄 고객센터에서 순차적으로 개별 연락이 진행될 예정입니다.

고객님 본인확인을 위해 신분확인에 대한 자료 요청이 있을 수 있으며 확인 종료 후 제품 발송해 드릴 예정입니다.

연락이 닿지 않거나, 상품증정에 필요한 절차(고객정보 미제출)에 따라주지 않으신 분들은 상품증정이 어려울 수 있습니다.

번거로우시더라도 반드시 고객센터 담당자 안내에 따라주시기 바랍니다.


다시한번 당첨을 축하드리며, 더 좋은 이벤트로 찾아뵙겠습니다.


감사합니다.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[안내] 5/1(근로자의 날) 고객센터 휴무 안내','2020-04-25','<pre>안녕하세요, 고객님.

 
델피늄을 이용해 주시는 고객님께 깊이 감사 말씀드리며,

2020년 5월 1일(근로자의 날) 당사 고객센터 휴무에 대해 안내드리오니 사이트 이용에 참고 부탁드립니다.

 

- 휴무일 : 2020년 5월 1일(금)

 

궁금하신 사항은 상품 페이지 내 Q&A 또는 1:1게시판을 통해 남겨주시면 휴무 후 담당자가 순차적으로 답변드리겠습니다. 




고객센터 이용에 불편을 드린 점 사과 말씀드리며, 

고객님께 더욱 편리하고 만족하실 수 있는 서비스를 제공하고자 노력하는 델피늄이 되겠습니다. 




감사합니다.</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[델피늄] Chillin Day 무료반품 페이백 지급 연기 안내','2020-04-12','<pre>안녕하세요. 델피늄입니다. 

4월 Chillin Day 에 진행한

무료반품 페이백 일정이 변경되었습니다. 

 

기존 지급일 : 4월 12일 오후 6시 이후

변경일 : 4월 13일 오후 6시 이후

 







사전 말씀드린 일정보다 지연된 점에 대해 사죄의 말씀드리며,

더 좋은 모습으로 나아가겠습니다.

감사합니다.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[델피늄] 3월 `별이 빛나는 삼월에` 이벤트 안내','2020-04-10','<pre>안녕하세요.

델피늄입니다.

 

3월 중 진행했던 \\별이 빛나는 삼월에\\ 이벤트에서 별 5개를 모은 고객님들께 이벤트 쿠폰이 발행되었습니다.

지난 이벤트는 아래 링크에서 확인해주세요.

https://delphinium.com

 

추가 문의사항은 고객센터를 통해 문의해주세요.

감사합니다.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '오프라인 Live 사전예약 당첨자 발표','2020-04-03','<pre>[당첨자발표]


안녕하세요. 델피늄입니다.
3/3~21까지 오프라인 Live 사전예약 이벤트 당첨을 축하드립니다.


- 당첨자분들께는 개별 연락 드렸으며, 기본 배송지를 4/5)까지 업데이트 해주셔야 4/15부터 순차발송 가능합니다.
- 경품에 대한 제세공과금은 본인 부담이며, 세금신고를 위한 개인정보 취합 후 발송됩니다. 
(제세공과금 연락을 받지 않으신 분들은 해당 사항이 아닙니다)
- 연락이 닿지 않거나 경품발송에 필요한 절차(고객정보 미제출)에 미응답 고객 분들은 증정이 어려운 점 양해 부탁 드립니다.

 

다시 한 번 이벤트 당첨을 진심으로 축하 드리며, 참여해 주신 모든 분들 감사 드립니다
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '프론트로우 예치금 지급 관련 안내','2020-03-08','<pre>안녕하세요.
델피늄 입니다.

 

금일 2/15 ~ 3/1 기간 내 드라마컬렉션 구매자 중, 교환배송하신 분께는 ID당 5천원 예치금을 지급해드립니다. (금일 교환배송완료 기준)
예치금 지급은 시스템상 금일 바로 지급이 어려워, 내일 일괄 예치금 지급해드리겠습니다. 

빠르게 지급해드리지 못해 죄송합니다.


감사합니다.
</pre>');



select * from board
-----------------------------------------------------------------------------------------------------------PROMOTION
truncate table board;


insert into board values(1,pro_seq.nextval,'비건 패션 오르바이스텔라, 무신사와 공격적인 프로모션','2020-05-12','<pre>동물친화적 가치소비 중심 비건 패션 브랜드 HEUREUX 오르바이스텔라가 무신사 스토어에서 구입한 전 구매고객에게<br> 선착순으로 HEUREUX 파우치 증정과 함께 할인 이벤트를 진행한다. </pre>','upload\글1번.jpg','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'럭셔리 비건 뷰티 디어달리아, 론칭 3주년 기념 블루밍 버스데이 프로모션 진행','2020-05-13','<pre>럭셔리 비건 뷰티 브랜드 디어달리아(DEAR DAHLIA)가 브랜드 론칭 3주년을 맞이하여 그 동안의 성원에 감사하는 마음을 담아 풍성한 이벤트로 Blooming Birthday 프로모션을 준비했다.</pre>','upload\글2번.png','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'비건 화장품 보나쥬르 롭스 입점 프로모션','2020-05-14','<pre>[코스인코리아닷컴 박상현 기자] 국내 최다 비건 인증 화장품 브랜드 보나쥬르가 <br> H&B스토어 롭스(LOHBs) 입점을 기념해 세일과 증정 프로모션을 진행한다.</pre>','upload\글3번.jpg','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'채식박람회 비건페스타에 비건 코스메틱 참가 줄이어','2020-05-15','<pre>채식전문 박람회인 비건페스타에 다수의 비건 코스메틱 제품들이 참가할 예정이다.</pre>','upload\글4번(1).png','upload\글4번(2).jpg','사진없음');
insert into board values(1,pro_seq.nextval,'비건 패션 비비와이비(BBYB) 20SS 시즌 콜렉션 프리오더 오픈, 할인 프로모션 진행','2020-05-16','<pre>윤리적 소비문화를 반영한 비건 패션을 추구하는 뉴 컨템포러리 브랜드 비비와이비(BBYB) (㈜주영, 대표 정용화)가 <br>봄시즌을 맞아 2020 SS 콜렉션 시즌 룩북을 공개하고 프리오더를 진행한다.</pre>','upload\글5번.png','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'닥터포포, 가정의달 특별 할인 프로모션','2020-05-17','<pre>영국 비건코스메틱 브랜드 닥터포포가 가정의 달을 맞아 신제품 3종에 대한 할인&기프트 증정 프로모션을 진행한다.</pre>','upload\글6번.jpg','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'비건 패션 비비와이비(BBYB) 19FW 시즌 컬렉션 룩북 공개, 출시 기념 할인 프로모션 진행','2020-05-18','<pre>비비와이비(BBYB)는 비건 소비에 동참하는 윤리적 소비자들을 위해 페이크 레더와 비건 소재를 사용하여 <br>매 시즌 새롭고 유니크한 컨셉을 선보이며 스타일과 실용성을 강조한 디자인이 특징이다.</pre>','upload\글7번.jpg','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'K-비건페어 2020 스마트스토어 오픈','2020-05-19','<pre>비건 산업 전시회 코리아비건페어 2020(이하 K-비건페어)은 <br>지난 1일 네이버에 코리아비건페어몰을 오픈하고 흥행몰이에 나섰다.</pre>','upload\글8번.png','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'인터컨티넨탈, 업계 최초 비건 와인 선보여…동물성 원료와 접촉 차단','2020-05-20','<pre>삼성동 그랜드 인터컨티넨탈 서울 파르나스는 최근 가장 주목받는 친환경 와인 중 하나인 비건 와인(Vegan Wine)을 업계 최초로 소개하였다.</pre>','upload\글9번.jpg','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'프랑스 비건 화장품 파티카, 롯데인터넷면세점 입점','2020-05-21','<pre>최근 전 세계적으로 친환경을 넘어 반드시 환경을 지켜야 한다는 필환경이 소비 트렌드로 떠오르면서 동물성 성분을 포함하지 않고 <br> 동물 실험을 거치지 않는 비건 화장품에 대한 관심과 수요가 높아지고 있다.</pre>','upload\글10번.jpg','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'비건 코스메틱 언리시아, 프리티 이지 글리터 스틱 출시','2020-05-22','<pre>이번에 출시하는 프리티 이지 글리터 스틱은 글리터 연출에 어려움을 느끼는 초보자 및 입문자도 쉽고 간편하게 메이크업할 수 있는<br> 스틱형 글리터 제품으로 많은 소비자들의 눈길을 끌고 있다.</pre>','upload\글11번(1).jpg','upload\글11번(2).jpg','사진없음');
insert into board values(1,pro_seq.nextval,'비건 패션 BBYB 미리 크리스마스 이벤트로 20% 할인','2020-05-23','<pre>주영(대표 정용화)의 비건 패션 브랜드 비비와이비(BBYB)가 연말 크리스마스를 맞아 미리크리스마스(MIRI CHRISTMAS) 프로모션을 진행한다.</pre>','upload\글12번(1).jpg','upload\글12번(2).jpg','upload\글12번(3).jpg');
insert into board values(1,pro_seq.nextval,'비건 화장품 아워글래스, 中시장 인기 업고 면세 매출 훨훨','2020-05-24','<pre>신세계인터내셔날이 수입ㆍ판매하는 럭셔리 메이크업 브랜드 아워글래스가 최근 중국 소비자들의 입소문을 타고 면세점 매출이 크게 증가했다.</pre>','upload\글13번.jpg','사진없음','사진없음');
insert into board values(1,pro_seq.nextval,'홈앤쇼핑, 비건 특집 진행…[채식으로 건강 챙기세요]','2020-05-25','<pre>비건은 동물의 가죽과 뼈, 고기 등 동물성 재료나 동물실험을 거친 성분의 제품을 소비하지 않는 가장 엄격한 채식 단계, 채식주의자를 뜻하는 신조어다.</pre>','upload\글14번.png','사진없음','사진없음');



-----------------------------------------------------------------------------------------------------------REVIEW

insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD27',rv_seq.nextval,'perl34',5,'2020-06-16','기대안하고 샀는데 정발 바삭하고 너무 맛있어요.! 식감이 정말 과자랑 똑같네요~~');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD30',rv_seq.nextval,'stripe56',5,'2020-08-20','식감이 치즈랑 정말 똑같아서 치즈 먹는 줄 헐~~ 재구매 각 입니다!!!');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD25',rv_seq.nextval,'speaker56',4,'2020-08-17','기를 못먹어서 이걸로 대리만족ㅎㅎ');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD23',rv_seq.nextval,'moni78',5,'2020-07-13','딸래미랑 같이 먹으려고 샀는데 너무 맛있어서 제가 다 먹어버렸네요ㅜㅜ');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD24',rv_seq.nextval,'white78',5,'2020-07-14','이번에는 녹차랑 흑임자만 샀는데 너무 맛있어서 다른 맛도 사보려고요 ㅎㅎ');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD28',rv_seq.nextval,'win34',3,'2020-08-26','우유먹고 싶을 때 먹으면 좋을 것 같아요!!');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD31',rv_seq.nextval,'glass90',4,'2020-08-01','용량이 적은 게 좀 아쉽지만 제 피부에 너무 잘맞아서 안쓸 수가 없어요 ㅋㅋ');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD32',rv_seq.nextval,'tile12',3,'2020-06-18','발색은 진짜 이쁜데 가루 날림이 있어서 좀 아쉬워요. 근데 발색은 진짜 너무 이쁩니다.');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD33',rv_seq.nextval,'white78',5,'2020-07-07','밥먹어도 안지워져서 진짜 편합니다. 이번엔 네이키드 샀는데 다음에는 델리키트 사보려구요 ㅎㅎ');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD34',rv_seq.nextval,'stripe56',5,'2020-08-11',' 피부가 예민한 편인데 저한테 너무 잘맞아요. 게다가 비건이라니..완전 일석이조!');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD35',rv_seq.nextval,'curtain12',4,'2020-07-02','미백이랑 주름개선을 한번에 잡을 수 있어서 좋은 것 같아요. 저같은 귀차니즘에게 딱인듯');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD36',rv_seq.nextval,'cd90',4,'2020-06-18','신기해서 사봤는데 기대한 것 보다 훨씬 좋아서 깜짝 놀랐어요..완전 추천');






----------------------------------------------------------------------------------------------------------- Q & A

insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD27',qa_seq.nextval,'curtain12','상품문의','2020-08-22','냉장보관인가요 실온보관인가요??', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD30',qa_seq.nextval,'perl34','상품문의','2020-07-26','냄새가 좀 나는데 상한건가요? 원래 그런건가요?', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD25',qa_seq.nextval,'speaker56','상품문의','2020-07-06','생후 40개월 아기도 먹어도 될까요?', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD23',qa_seq.nextval,'moni78','배송문의','2020-08-20','오늘 주문하면 언제쯤 올까요?', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD24',qa_seq.nextval,'cd90','상품문의','2020-08-20','유통기한이 언제까지인가요??', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD28',qa_seq.nextval,'cd90','상품문의','2020-06-15','유통기한이 좀 지났는데 먹어도 되겠죠?', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD31',qa_seq.nextval,'tile12','상품문의','2020-06-14','지성피부인 사람도 잘맞을까요??', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD32',qa_seq.nextval,'win34','상품문의','2020-08-26','원래 이렇게 가루가 날리나요?', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD33',qa_seq.nextval,'stripe56','상품문의','2020-07-30','쿨톤도 잘어울릴까요????', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD34',qa_seq.nextval,'white78','상품문의','2020-07-12','4세 아기도 써도 되는 제품인가요?', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD35',qa_seq.nextval,'glass90','상품문의','2020-06-01','상품 유통기한이 언제 까진가요?', '답변이 아직 등록되지 않았습니다.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD36',qa_seq.nextval,'win34','상품문의','2020-05-19','아토피가 좀 있는데 괜찮을까요?', '답변이 아직 등록되지 않았습니다.');