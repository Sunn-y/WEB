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
b_pic1 varchar2(1000) default '��������' not null,
b_pic2 varchar2(1000) default '��������' not null,
b_pic3 varchar2(1000) default '��������' not null
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


insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(0,'admin','delp','���ǴϿ�','2020-01-01','1993-07-01','010-1234-4561','����� ���ı�');


insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'curtain12','1234','�̿���','2020-02-09','1993-07-01','010-1234-4561','����� ���ı�');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'perl34','1234','�տ���','2020-02-10','1993-01-09','010-7894-5612','����� ������ ');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'speaker56','1234','������','2020-02-11','1993-10-08','010-4512-5623','����� ���ϱ�');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'moni78','1234','������','2020-02-12','1993-09-01','010-7894-4568','����� ���빮��');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'cd90','1234','������','2020-02-13','1993-07-13','010-8956-7845','����� ���빮��');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'tile12','1234','������','2020-02-14','1993-05-19','010-5656-4545','����� ������');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'win34','1234','����','2020-02-15','1993-09-06','010-9632-8521','����� ������');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'stripe56','1234','��ä��','2020-02-16','1993-04-01','010-7896-4569','����� ���α�');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'white78','1234','���ٿ�','2020-02-17','1993-05-17','010-7532-9512','����� ������');
insert into member (userLevel, userid, userpw, name, regidate, birth, phone, address) values(1,'glass90','1234','������','2020-02-18','1993-06-04','010-1587-4593','����� ���α�');

insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-75221','1234','��Ʋ�ĸӽ�','2020-04-14','������','010-7854-8569','http://littlefarmers.co.kr','����� ��õ��');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-64-74562','1234','Avesu','2020-04-15','����','010-7852-9852','https://www.avesu.eu/','����� �߶���');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'335-45-75223','1234','�պ�����','2020-04-16','����','010-7896-3214','http://boombasic.co.kr','����� �߱�');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-75-74624','1234','Etsy','2020-04-17','������','010-8547-1452.','https://www.etsy.com/','����� ���ʱ�');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'679-45-75225','1234','�����̳�','2020-04-18','������','010-9652-7854','https://mangnut2.com/index.html','����� ���ϱ�');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-15-74556','1234','sweet meal','2020-04-19','����','010-4562-6542','http://www.sweetmeal.net/goods/goods_view.php?goodsNo=1000000591&inflow=naver&NaPm=ct%3Dke3z80sw%7Cci%3D0z80003-vxXtD-YVCLnT%7Ctr%3Dpla%7Chk%3D1304608adac3440b84ef5032640cdf9248605319','����� ������');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-75227','1234','Eat''s Better','2020-04-20','�嵿��','010-8547-7458','https://smartstore.naver.com/eatsbetter/products/3455023703?n_media=27758&n_query=%EB%B9%84%EA%B1%B4%EB%A7%88%EC%9A%94%EB%84%A4%EC%A6%88&n_rank=1&n_ad_group=grp-a001-02-000000012911940&n_ad=nad-a001-02-000000091302432&n_campaign_type=2&n_mall_pid=3455023703&n_ad_group_type=2&NaPm=ct%3Dke3zchao%7Cci%3D0zq0002ovNXt37lOWuXm%7Ctr%3Dpla%7Chk%3D972013dee94c23623f7243823480e440bfe23c6a','����� ���۱�');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'799-96-75228','1234','��γ���ó','2020-04-21','������','010-6655-4455','https://www.hellonature.co.kr/fsr000.do?goTo=searchYn&keyword=%25EB%259D%25BC%25EB%25B0%259C%25EB%259E%2580%25EC%258A%25A4&tapItem=Y&stamp=S1234','����� ������');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-75229','1234','SERUMKIND','2020-04-22','���켺','010-8546-6549','https://www.completone.com/serumkind.html','����� ��õ��');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-75230','1234','DEARDAHLIA','2020-04-23','���','010-8462-9431','https://deardahlia.com/index.html','����� ���Ǳ�');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-46-78521','1234','phykology','2020-04-24','�ӽÿ�','010-8852-9431','http://www.phykology.com/?NaPm=ct%3Dke54uud4%7Cci%3D0z40003NzO1tkkJWXuWt%7Ctr%3Dsa%7Chk%3D78602cd6df05fda7d707164839aecae68e00f314','����� ���Ǳ�');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'459-45-75232','1234','Gilla8','2020-04-25','�赵��','010-8462-1431','http://www.gilla8.com/index.html','����� ���Ǳ�');
insert into member (userLevel, userid, userpw, cname, regidate, name, phone, sns, address) values(2,'359-45-36933','1234','BEIGIC','2020-04-26','�����','010-9662-9431','https://www.beigic.com/index.html','����� ���Ǳ�');







-----------------------------------------------------------------------------------------------------------MERCHANDISE

insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�����-JUTE-HOBO-IL7FHB4034_GI','359-45-75221','��Ʋ�ĸӽ�','FASHION','2020-04-01',20000,'�������� �������� ����� ��Ư�� �β����� �����ϸ鼭�� ��ƽ���� �������� �����','upload\�����-JUTE-HOBO-IL7FHB4034_GI.jpg','���� ���� 51cm ���� 63cm','upload\�����-JUTE-HOBO-IL7FHB4034_GI_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','�׷���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�����-SOFT-JUTE-BAG 1L7FHB4009_G2','359-45-75221','��Ʋ�ĸӽ�','FASHION','2020-04-02',20000,'ũ���� ������� �ʴ� �����ͺ� �������� �Ĺ����� ������ ź������ �������� �����','upload\����� SOFT JUTE BAG.png','���� ���� 45cm ���� 55cm','upload\����� SOFT JUTE BAG_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','�׷���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM WALLET 1L7FWL0184_KR','359-45-75221','��Ʋ�ĸӽ�','FASHION','2020-04-03',10000,'������ ������ �״�� ���� ������ Ư�� �������� ����� ģȯ������ �Ĺ��� ���� ���� �����Դϴ�.','upload\SUUM WALLET 1L7FWL0184_KR.jpg','��������ư ���� 12cm ���� 9cm �β� 0.07cm','upload\SUUM WALLET 1L7FWL0184_KR_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','ȭ��Ʈ,��,ũ����Ʈ','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM BACKPACK 876 1L7FHB0876_D2','359-45-75221','��Ʋ�ĸӽ�','FASHION','2020-04-04',30000,'������ ��ư�� ���ս�Ų ����� Ư���� ��ľ��� �����ϰ� �����ε� �����Դϴ�.','upload\SUUM BACKPACK 876 1L7FHB0876_D2.jpg','�Ͽ���, ������Ŭ ���� ���� 40cm ���� 39cm ������ 86cm (��������)','upload\SUUM BACKPACK 876 1L7FHB0876_D2_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','��,����','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'DAYPACK BICHROME BLOOM','359-64-74562','Avesu','FASHION','2020-04-05',100000,'AEVOR�� �賶�� �ϻ����� ����� ���� ������� ������� ���� �����Դϴ�. ����� 50 %�� ��Ȱ�� PET�� ������ Ư�� ����ũ�� ������ ������� �ֽ��ϴ�.','upload\DAYPACK BICHROME BLOOM.jpg','����: �ؼ��� ũ��: ���� 48cm ���� 34cm �� 14cm','upload\DAYPACK BICHROME BLOOM_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','��ũ������Ʈ���,��,��ũ,�ٴҶ�','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'TRIPLET OMBRE','359-64-74562','Avesu','FASHION','2020-04-06',80000,'��ǰ�� �ռ� ���� �Ȱ��� ��Ȱ�� ���Ϸ����� ���۵� �������Դϴ�.','upload\TRIPLET OMBRE.jpg','����: �ռ� ����','upload\TRIPLET OMBRE_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','��,����','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'COTTON BEANIE BLACK','359-64-74562','Avesu','FASHION','2020-04-07',30000,'�����ϰ� ��Ÿ�ϸ����� ������ ���۵� ����Դϴ�.','upload\COTTON BEANIE BLACK.jpg','����: ��','upload\COTTON BEANIE BLACK_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','��','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM HAUNJI CROSS BAG 1L6AHB0829_N2','359-45-75221','��Ʋ�ĸӽ�','FASHION','2020-04-08',15000,'�Ͽ��� ���� �ٵ� ������Ŭ �Ұ����� �޺� �Ǿ� �ſ� ������ �������� �پ �Ŀ�ġ�Դϴ�.','upload\SUUM HAUNJI CROSS BAG 1L6AHB0829_N2.jpg','�Ͽ���, ������Ŭ ���� ���� 33cm ���� 20cm ������ 58cm','upload\SUUM HAUNJI CROSS BAG 1L6AHB0829_N2_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','��, ���̺�, ����','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM TOTE LONG SHOULDER BAG','359-45-75221','��Ʋ�ĸӽ�','FASHION','2020-04-09',30000,'�𺧷����� ����, ��ư�� ������Ŭ �Ұ����� �޺�Ǿ� �ſ� ������ �������� �پ�� �̴ϸ��ϸ鼭�� ���߷��� �������Դϴ�.','upload\SUUM TOTE LONG SHOULDER BAG.jpg','������Ŭ ���� ���� 47cm, 31cm ������ 96cm (�����Ұ���)','upload\SUUM TOTE LONG SHOULDER BAG_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','��, ���̺�, ����','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'SUUM SLOUCHY 873 1L7FHB0873_B2','359-45-75221','��Ʋ�ĸӽ�','FASHION','2020-04-10',18000,'������ ��ư�� ���ս�Ų ����� ��� ���� �����ε� �����ϸ鼭�� ����Ʈ�� �ٵ��� �ŷ����� ���Դϴ�.','upload\SUUM SLOUCHY 873 1L7FHB0873_B2.jpg','��������ư ���� 35cm ���� 27cm ������ 65cm (�����Ұ���)','upload\SUUM SLOUCHY 873 1L7FHB0873_B2_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','��, ����','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�ױ׸��� ���ǽ�','335-45-75223','�պ�����','FASHION','2020-04-11',140000,'���ٰ� �ټ��� ȥ��� �������� ������� �ݼҸ� ���ǽ��Դϴ�.','upload\�ױ׸��� ���ǽ�.jpg','���� �ټ� ��� 38cm ���� 51cm �ȱ��� 19.5cm �ش� 91cm �ѱ��� 107cm','upload\�ױ׸��� ���ǽ�_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','ȭ��Ʈ,������,���̺�','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�����Ƴ� ����','335-45-75223','�պ�����','FASHION','2020-04-12',98000,'�� 100% Ʈ������ ������� ������ ���� �ձ����� ���ǽ� ��Ÿ�� �����Դϴ�.','upload\�����Ƴ� ����.jpg','�� ��� 62cm ���� 59cm �ȱ��� 50cm �ѱ��� 106cm','upload\�����Ƴ� ����_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','������,ȭ��Ʈ,���̺�,��','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'��Ź��','335-45-75223','�պ�����','LIFE','2020-04-14',12000,'�ϻ��Ȱ�� ��Ʈ������ ���� ��ſ��� ������ �Ȱ��� ����� ��⸦ ���� ��Ź���Դϴ�.','upload\��Ź��.jpg','�뷮: �� 300g ���� 6cm ���� 9.5cm �β� 4cm ','upload\��Ź��_������ ����.jpg','�����','���̰���','�ɼǾ���','�ؽ��丮����,����׶�,�󺥴�','1ȣ(18+23cm/��9cm),2ȣ(22+28cm/��9cm),3ȣ(31+48cm/��12cm),4ȣ(50+38cm/��15cm)','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'���� ��ġ��','335-45-75223','�պ�����','LIFE','2020-04-15',39000,'����� ���� ����ϰ� �� ������ ������ ������ �츰 ���߷��� ������ ��ġ���Դϴ�.','upload\���� ��ġ��.jpg','���� 50% �� 50% ���� 101cm �ѱ��� 78cm ������� 72cm �㸮������ 86cm ','upload\���� ��ġ��_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','��ī�̺��,���̺���,��Ʈ��','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'���̽� ħ��Ŀ�� ��Ʈ','335-45-75223','�պ�����','LIFE','2020-04-16',135000,'�������� ������� �Ǻο� ��� ��ư�� ������ ���� ���߷��� ��Ʈ������ ������ ħ��Ŀ�� ��Ʈ�Դϴ�.','upload\���̽� ħ��Ŀ�� ��Ʈ.jpg','����: �� ũ��: �̱�/�� (�̺�Ŀ�� 1��+����Ŀ�� 1��)','upload\���̽� ħ��Ŀ�� ��Ʈ_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','���̺�,����,����','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�ڼ� ���Ŀ��','335-45-75223','�պ�����','LIFE','2020-04-17',25000,'�������� ������� �Ǻο� ��� ��ư�� ������ ���� �ڼ� ���Ŀ���Դϴ�.','upload\�ڼ� ���Ŀ��.jpg','����: �� ũ��: ���� 48cm ���� 48cm','upload\�ڼ� ���Ŀ��_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','���̽�ũ��,����,��','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'���߷����� ����','335-45-75223','�պ�����','LIFE','2020-04-18',15000,'���ٰ� ��ư ������ ���߷��� ������ �����Դϴ�.','upload\���߷����� ����.jpg','����: �� 50% ���� 50% ���� 62cm ���� 50cm','upload\���߷����� ����_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','����,��Ʈ��,��,������,��ī�̺��,���ο�,��ũ','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�̸�� �к긯 �̽�Ʈ','335-45-75223','�պ�����','LIFE','2020-04-19',14000,'�����ϸ鼭�� ȭ���� ������� ���ó�� �Ŀ������ �������� ���� �� �ִ� ���Դϴ�.','upload\�̸�� �к긯 �̽�Ʈ.jpg','�����: Orange, Raspberries, Lime, Mimosa petals, Jasmine, Ceder, Musk, Amber','upload\�̸�� �к긯 �̽�Ʈ_������ ����.jpg','�뷮','�ɼǾ���','�ɼǾ���','100ml,500ml','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�� �� �޸� ���̵� �����̾� ��Ź����','335-45-75223','�պ�����','LIFE','2020-04-20',38000,'�ÿ��� �ٴ����� ������ �ڶ� ���̵� ���ٿ� ����� ��Ʈ�� �����ΰ� �������� ���� ��갰�� �ż����� �������� �����ϸ鼭�� ������ ���Դϴ�.','upload\�� �� �޸� ���̵� �����̾� ��Ź����.jpg','�����: Jade leaves, Lemon, Pomelo, Mate Leaves, Jasmine','upload\�� �� �޸� ���̵� �����̾� ��Ź����_������ ����.jpg','�뷮','�ɼǾ���','�ɼǾ���','100ml,500ml','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'Vegan Art Gifts Botanical Pencil Case','359-75-74624','Etsy','LIFE','2020-04-21',12500,'���� �������� ���۵� ���� �ɹ��̰� �������� �����Դϴ�.','upload\Vegan Art Gifts Botanical Pencil Case.jpg','����: 29cm ���� 9cm ','upload\Vegan Art Gifts Botanical Pencil Case_������ ����.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'Go Vegan Face Mask Unisex Adult Kid Mouth Mask','359-75-74624','Etsy','LIFE','2020-04-22',10000,'������ ���۵� ģȯ�� ����ũ�Դϴ�.','upload\Go Vegan Face Mask Unisex Adult Kid Mouth Mask.jpg','����: ��','upload\Go Vegan Face Mask Unisex Adult Kid Mouth Mask_������ ����.jpg','�÷�','�ɼǾ���','�ɼǾ���','ȭ��Ʈ,���̺�,����Ʈ���','�ɼǾ���','�ɼǾ���');

insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'���ݶ�','679-45-75225','�����̳�','FOOD','2020-04-01',3510,'��� ���� ��� ���ݸ��� ǳ��, ���ݶ�!','upload\���ݶ�.jpg','���ڰ� ���ؿ�','upload\D���ݶ�.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'���ΰ�','679-45-75225','�����̳�','FOOD','2020-04-02',1710,'�����ϰ� ���ִ� ��� ���� ���ΰ�','upload\���ΰ�.jpg','��� ���԰Ÿ�','upload\D���ΰ�.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'���η��','679-45-75225','�����̳�','FOOD','2020-04-03',3400,'����Ʈ����, �˵��� ��� ���� �����','upload\���η��.jpg','�˵�����','upload\D���η��.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�����Ʈ �ҽ���','359-15-74556','sweet meal','FOOD','2020-04-04',17900,'��� ���� ���, �����Ʈ','upload\�����Ʈ�ҽ���.jpg','���� ���� �İ�','upload\D�����Ʈ�ҽ���.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'������������','359-45-75227','Eats Better','FOOD','2020-04-05',5500,'������ �ǰ��԰� ������� ��� ���Ĺ��� �������','upload\������������.jpg','�δ���� Į�θ�','upload\D������������.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'��߶���','799-96-75228','��γ���ó','FOOD','2020-04-06',3500,'�Ĺ��� �ܹ����� ���� ä�� ��ܹ� ����','upload\��߶���_����.jpg','�ٻ��� ����','upload\D��߶���_����.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'��Ʋ��','799-96-75228','��γ���ó','FOOD','2020-04-07',6800,'����ϰ� ��ǰ�� ǳ���ϰ� �Ͼ�� �͸� ����','upload\��Ʋ��.jpg','������ �͸� ����','upload\D��Ʋ��.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'��Ƽ����Ƽ�� ����Ĺ��','799-96-75228','��γ���ó','FOOD','2020-04-08',2300,'��ŭ������ ���� �Ϳ��� ����� ����� �ݶ�','upload\��Ƽ����Ƽ�� ���� Ĺ��.jpg','���޴����˵�','upload\D��Ƽ����Ƽ�� ����Ĺ��.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'���̿������� ���ġ�� ������ �����̽�','799-96-75228','��γ���ó','FOOD','2020-04-09',15300,'���� �������� ������ �Ϻ��� ġ���� �İ�!','upload\���ġ�� �����۽����̽�.jpg','ġ����~!','upload\D���ġ��.jpg','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');

insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'YELLOWMELLO DROP','359-45-75229','SERUMKIND','BEAUTY','2020-02-01',38000,'�̱׷��� ����� �����ϴ� ����뷱��','upload\1-1.����ī�ε�(���ο���).png','�������� �������(�и��) �� ���⹰�� ���� ������� ���÷��� 89%�� ����, ����� ����, ũ��, ����, ���� ���� 4�� ��Ƽ �ɾ ������ �������','upload\1-2.����ī�ε�(���ο���).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'����Ӷ���¡ ���Ʈ �÷��� �ȷ�Ʈ ������Ʈ �Ƿ翧','359-45-75230','DEARDAHLIA','BEAUTY','2020-02-02',48000,'���� �� �Ƹ��ٿ�� ������� �Ǿ�� ȲȦ�� ���� ����Ӷ���¡ ���Ʈ �÷���','upload\2-1.���޸���(������Ʈ �Ƿ翧).png','���޸��� ����Ӷ���¡ ���Ʈ �÷��� �ȷ�Ʈ�� ���� �� �Ƹ��ٿ�� ������� �Ǿ�� ȲȦ�� ������ ���� �÷����Դϴ�. ���� ��Ʈ, ��Ű ����, ���� ����Ŭ �۸����� �پ��� �ؽ��İ� �ѹ��� ��ġ������ ǳ���� �÷����� �����ϸ� �������̰� ���Ÿ��� 8���� ���̵尡 �ս��� �÷� �������� �����Ǿ� �ܵ� �Ǵ� ���̾�Ͽ� ���ϴ� �迡 ���� �پ��� ���� �ϼ����ݴϴ�.','upload\2-2.���޸���(������Ʈ �Ƿ翧).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'����� ��Ʈ �� ��Ʈ','359-45-75230','DEARDAHLIA','BEAUTY','2020-02-03',26000,'�� �Լ��� ��Ʈ�� ������','upload\3-1.���޸���(�������Ʈ�� ��Ʈ).png','��߻��� �÷��� �Լ��� �ٸ��� ���� ������ �����Ǵ� ��� ���� ���ķ��� �������̳� �ָ� �ΰ� ���� ��ũ �� ��Ʈ �ǴϽ��� �����ϴ� ������ ����ƽ�Դϴ�. ������ ���� ������ �ؽ�ó�� ������ Ǯ������ �ڿ������� �׶��̼Ǳ��� �پ��� ������ �����ָ� ����� ���� ���� ���� �ð� ���� �����ݴϴ�.','upload\3-2.���޸���(�������Ʈ����Ʈ).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�����ݷ��� ��Ƽ �½�ŷ ���','359-46-78521','phykology','BEAUTY','2020-02-04',29000,'��ģ �ٴ�� ���Ӿ��� ����ϴ� �ٴٻ����� �ٿ� �̿����� ������ ź���� �̶�Ŭ ����','upload\4-1.�����ݷ���(��Ƽ�½�ŷ ���).png','�� ���� ��ʿ� �����ϼ̴ٸ� �ѹ�� �ѹ�� ������ ���� ������ ��ʸ� ����������. ���簨 ��ġ�� �Ѹ����� �Ǻο� ��� ������ ����°� ���е� ���� Ȧ�� �ý������� ������ �Ǻο� �ﰢ�� ���� �����ص帳�ϴ�.','upload\4-2.�����ݷ���(��Ƽ�½�ŷ ���).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'��� ���� �Ŀ� ����� ũ��','459-45-75232','Gilla8','BEAUTY','2020-02-05',38000,'ĢĢ�ϰ� ��ο� �Ǻ�, �Ǻο� ������ �ʿ��� ��','upload\5-1.�����(��� �����Ŀ� ����� ũ��).png','������ ���� �ε巴�� ������ ���������� ���, ���� ��� �� ���緮�� ���� �Ǻο� ���� �� �ٸ��� �ε巴�� ��������ݴϴ�.','upload\5-2.�����(��� �����Ŀ� ����� ũ��).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'��� ��� ���� �Ŀ� ����� ������ �ν���','459-45-75232','Gilla8','BEAUTY','2020-02-06',28000,'ĢĢ�ϰ� ��ο� �Ǻ�, �Ǻο� ������ �ʿ��� ��','upload\6-1.�����(��� ��� �����Ŀ� ����� ������ �ν���).png','���� �������� ���Ͽ����� �ϳ��� ������ ���� �������� ��ũ�� �Ǻοϼ�','upload\6-2.�����(��� ��� �����Ŀ� ����� ������ �ν���).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'Ʈ��Ʈ��Ʈ �μ�','359-45-36933','BEIGIC','BEAUTY','2020-02-07',42000,'������ �µ��� ��ȭ�� ���� ���������� �ΰ����� �� �ִ� �Ǻθ� �������� �����ϰ� ä�� ����ü���� �÷��ִ� ���� ������','upload\7-1.������ũ(Ʈ��Ʈ��Ʈ �μ�).png','�׸� Ŀ�Ǻ� ���ϰ� 6���� ���� ��Ÿ�̵尡 �����Ǿ� �ڿ����� �Ǻ� ����� ���� �Ǻθ� ź���ְ� �Ų����� ���ְ�, ���۹�Ʈ �ٰ� �������� �� ���⹰�� �������� �Ǻθ� �������� �Ȼ��� �����ְ� ȭ���ϰ� �����ϴ� ���� ������ �ִ� ������ �ִ� ���� ������','upload\7-2.������ũ(Ʈ��Ʈ��Ʈ �μ�).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'��Į��_��� ���� �ɾ� ���','359-45-36933','BEIGIC','BEAUTY','2020-02-08',77000,'���&���� �ɾ �ѹ���','upload\8-1.������ũ(��Į��_��� ���� �ɾ� ���).png','�׻�ȭ ���а� ��Ÿ�� E, ������ ǳ���� �׸� Ŀ��� ���Ϸ� ������ ������ �뷱����  ���� �ǰ��� ���ǿ� ź���ִ� ��߷� ���پ� �ִ� 100% ��� ���ķ� ���ɾ� ��� ','upload\8-2.������ũ(��Į��_��� ���� �ɾ� ���).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');
insert into merchandise(md_num, md_name, userID, cname, md_cate, md_date, md_price, md_sim_info, md_sim_pic, md_det_info, md_det_pic, md_op1_name, md_op2_name, md_op3_name, md_op1_val, md_op2_val, md_op3_val)  values('MD' || md_seq.nextval,'�ڷ��� ���̼� ��ũ��','359-45-36933','BEIGIC','BEAUTY','2020-02-09',38000,'Ŀ��� �Ŀ���� ȿ������ ��������, �׸� Ŀ�Ǻ� ���ϰ� ���ڳ� ������ ���а� �ִ� �������� �����ϰ� �����ִ� �Ǻη� �����ִ� ���̼� ��ũ��','upload\9-1.������ũ(�ڷ��� ���̼� ��ũ��).png','�ż��ϰ� �ν��õ� Ŀ���Ŀ��, �׻�ȭ ���� �� ��Ÿ�� E�� �����Ǿ� �ڱ� ���� ������ �������ְ� ������ ������ ���� ��� �������� �Ǻ� ������ ��� �ɷ��� ��ȭ�Ͽ� �޸��� �ܿ�ö���� �Ų��ϰ� ���� �Ǻη� ���پ��ִ� ���̼� ��ũ��','upload\9-2.������ũ(�ڷ��� ���̼� ��ũ��).png','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���','�ɼǾ���');





-----------------------------------------------------------------------------------------------------------NOTICE

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[�ȳ�] ������ ���� � �ȳ�','2020-08-15','<pre>�ȳ��ϼ���, ���Ǵ��Դϴ�.

 

\�ڷγ�19\ 2�ܰ� �ݻ����� ���� ��ȸ �������� �� Ȯ�� ������ ���� �Ʒ��� ���� �Ͻ������� ������ ��� �ð��� ���� ��˴ϴ�. 

 

- �����Ⱓ : 8�� 20��(��)-8�� 28��(��)

- ��ð� : 10:00-17:00

- ������ : ��ǥ��ȣ ��ȭ���, īī���� ä�� ��� 

 

�� ����Ʈ�� ����Ǵ� ��� �ð��� ���� � �ð����� ����Ǵ� �� ���� ��Ź �帳�ϴ�.

�� ��� � �ð��� ����ǰų� �߰� ����� �� �ֽ��ϴ�.

 

����ٹ� �ð� �� ��� ������ ���������� �̷���� �����̸�,

��ǰ������ �� QA �Ǵ� 1:1 �Խ����� ���� �����ֽø� ����ڰ� ���������� �亯�帮�ڽ��ϴ�.

 

������ ���� ����� ���� ���� �̿뿡 ������ ��� ����� �����帮��, 

���� ���ϰ� �����Ͻ� �� �ִ� ���񽺸� �����ϰ��� ����ϰڽ��ϴ�. 

 

�����մϴ�.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[�ȳ�] 8/14(�ù� ���� ��) , 8/17(�ӽð�����) ��� ���� �� ������ �޹� �ȳ�','2020-08-11','<pre>�ȳ��ϼ���. ���Ǵ��Դϴ�.

�׻� ���Ǵ��� �̿����ֽô� ���Բ� ���� ����帳�ϴ�.

8/14�� (�ù� ���� ��), 8/17�� (�ӽð�����)�� �����Ǿ� ��������� 

��� ������ �޹��� ���� �ȳ��帮���� ����Ʈ �̿뿡 ���� ��Ź�帳�ϴ�.

 

�� ��� ����

- 8/12 (��) ���� 4�� ���� ���� �� : ���� ���

- 8/12 (��) ���� 4�� ���� ���� �� : 8/18 (ȭ) ��� ����

�� �����갣������ ��� ����� �������� 1-2�� ���� ���� ������ �� �ֽ��ϴ�.

�� ��� ������ �����Ǵ� 8�� 18�Ϻ��� �ù���� ������ ���� 4-5�� ��� ������ �� �ֽ��ϴ�.

 - �� �귣��/��ǰ ���� �Ǵ� �ù�纰�� �ȳ��帰 ���� ������ ������ �� ������ ��Ȯ�� ��� ���� ���Ǵ� ��ǰ �������� ���� ���� �ȳ��� �켱�Ͽ� ���� ��Ź�帳�ϴ�.

 - �ù�� ���� ���� �� ��ǰ ��� �Ǿ�����, ����/�ù�纰 ������ ���� ����� ������ �� �ֽ��ϴ�.

  

�� ������ �޹� ����

- 8�� 17�� (��)

- �ָ��� ������ ���� �Ⱓ ���� ��ȭ���/1:1����/īī���� ���� �� ��ǰ���Ǹ� ������ ��� ���񽺰� �ߴܵǸ�, 8�� 18��(ȭ)���� ���������� ��˴ϴ�.

 

�������� ���� ���� ���� ������ ������ �߰ſ� �����Դϴ�. ������ �ܺ��� �ް��� ������ ��ġ���ʰ� �ÿ��� �Ϸ� �ǽñ� �ٶ��ϴ�.

�����մϴ�
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '���Ǵ� ����Ʈ ���� ��� ��� �ȳ�','2020-07-26','<pre>�ȳ��ϼ��� ���Ǵ��Դϴ�.

 

���� ����,  ���Ǵ� ����Ʈ ���� ��ְ� �߻��Ͽ� ���� �̿��� �Ͻ� �ߴܵǾ����ϴ�.

����� ��ġ�Ǿ�  ���� �̿��� �����մϴ�. 

 

����Ʈ �̿뿡 ������ �帰 �� �������� ����� ���� �帳�ϴ�.

 

 

�� ���� : PC/Mobile ���� ��ü

�� �Ͻ� : 2020�� 05�� 27��(��) ���� 9�� 53�� ~ 11�� 30�б���

 

���� ���� �̿뿡 ������ �帮�� �ʵ��� �ּ��� ���ϰڽ��ϴ�.

�����մϴ�.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[�ȳ�] īī���� ��ð� ���� �ȳ�','2020-07-02','<pre>�ȳ��ϼ���, ����

���Ǵ��� �̿����ֽô� ���Բ� ���� ����帳�ϴ�.

 

īī���� ��� ���� �ð��� 5�� 18�Ϻ���(��) ���Ӱ� ����Ǿ� �Ʒ��� ���� ��˴ϴ�.

 

- ���� ��ð� :  ���� ���� 09:00~18:00 (��/��, ������ �޹�)

- ���� ��ð� :  ���� ���� 09:00~17:00 (��/��, ������ �޹�)

 

īī���� �� ��� ������ ���� � �ð���� �̷���� �����̸� ��ǰ������ �� QA �Ǵ� 1:1 �Խ����� ���� �����ֽø� ����ڰ� ���������� �亯�帮�ڽ��ϴ�.

 

���Բ� ���� ���ϰ� �����Ͻ� �� �ִ� ���񽺸� �����ϰ��� ����ϰڽ��ϴ�.

�����մϴ�
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '�������� ó����ħ ���� �ȳ�','2020-06-29','<pre>�ȳ��ϼ���, ����

 

2020�� 6�� 29���ڷ� ���Ǵ��� \\�������� ó����ħ\\�� ����� ������ �ȳ��帳�ϴ�.

 

1. ���� ����

  - 15�� (�������� ��ȣ å����) 

 

2. ���� ���� 

  - �������� ��ȣå���� �� û�ҳ⺸ȣ å���� �� ������ ����

 

3. ���� ��

  - ���� å��/������ : ������ �̻�

  - ���� å��/������ : �ӽÿ� ��

 

�ڼ��� ������ ���� ��ũ���� Ȯ�� �����մϴ�

https://www.delphinium.com

  

�����մϴ�.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[���Ǵ�] K�мǿ���� ��� ��÷��10�� ��ǥ','2020-06-15','<pre>�ȳ��ϼ���.

���Ǵ��Դϴ�.

 

05/25 - 06/05 ���� �����ߴ� "K�мǿ���� : �ý�Ÿ ! 10���� �����̳ʿ��� ��ǥ�ϼ���!"�� ��÷�ڸ� ��ǥ�մϴ�. 

�����ߴ� �̺�Ʈ : https://delphinium.com

 

  

[��÷��ǰ] 

*���Ǵ� ���ιٿ�ó 3��������(����Ʈ�� ���޿���)

 

 

 

[��÷�� 10��] 

 





��۹�ȣ ���̵� �ڵ�����ȣ 
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

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[���Ǵ�] ����Ʈ�ο� �̺�Ʈ ������ ���� ���� �ȳ�','2020-06-05','<pre>�ȳ��ϼ���.���Ǵ��Դϴ�. 

����Ʈ�ο� ���� �Ⱓ �� ���� ��

���ᱳȯ �� ���丮�� �� 2�� ���� �������� 

���� ���� �� �����Դϴ�. 

���� ������ : 6�� 05�� 

������ : 6�� 06��







���� �����帰 �������� ������ ���� ���� ������ �����帮��,

�� ���� ������� ���ư��ڽ��ϴ�.

�����մϴ�.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[���Ǵ�] �����������Ʈ ��ǥ �̺�Ʈ ��÷�� ��ǥ','2020-05-24','<pre>�ȳ��ϼ���.

���Ǵ��Դϴ�.

 
 \\�����������Ʈ\\ ��ǥ �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�.

�����ε� �� ���� �̺�Ʈ�� ã�ƿ��ڽ��ϴ�.

�����մϴ�.

 






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

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[���Ǵ�] ���ŵ��� �̺�Ʈ ��÷�� ��ǥ','2020-05-14','<pre>�ȳ��ϼ���. ���Ǵ��Դϴ�.

4�� ������ ���ŵ��� �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�!







ID ȸ���� ��ǰ 
leedasom7**@naver.com �̴�* Salondeju SJ17105WT+BW 
my1004sim**@hanmail.net �ڿ�* OSOI MINI BROT [BRICK] 
gptjs**@nate.com ����* Salondeju SJ17105WT+BW 
sucre20**@naver.com ����* ANCOTO X-STRAP SANDAL 
hyunk**@naver.com ����* Salondeju SJ17105WT+BW 
choiyl**@naver.com ����* ANCOTO X-STRAP SANDAL 
bijou88**@naver.com �ɿ�* ANCOTO DOUBLE-STRAP SANDAL 
a0011**@naver.com �̺�* ANCOTO DOUBLE-STRAP SANDAL 


��÷�� ȸ���Բ��� ���������� �����Ͽ� ���Ǵ� �����Ϳ��� ���������� ���� ������ ����� �����Դϴ�.

���� ����Ȯ���� ���� �ź�Ȯ�ο� ���� �ڷ� ��û�� ���� �� ������ Ȯ�� ���� �� ��ǰ �߼��� �帱 �����Դϴ�.

������ ���� �ʰų�, ��ǰ������ �ʿ��� ����(������ ������)�� �������� ������ �е��� ��ǰ������ ����� �� �ֽ��ϴ�.

���ŷο�ô��� �ݵ�� ������ ����� �ȳ��� �����ֽñ� �ٶ��ϴ�.


�ٽ��ѹ� ��÷�� ���ϵ帮��, �� ���� �̺�Ʈ�� ã�ƺ˰ڽ��ϴ�.


�����մϴ�.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[�ȳ�] 5/1(�ٷ����� ��) ������ �޹� �ȳ�','2020-04-25','<pre>�ȳ��ϼ���, ����.

 
���Ǵ��� �̿��� �ֽô� ���Բ� ���� ���� �����帮��,

2020�� 5�� 1��(�ٷ����� ��) ��� ������ �޹��� ���� �ȳ��帮���� ����Ʈ �̿뿡 ���� ��Ź�帳�ϴ�.

 

- �޹��� : 2020�� 5�� 1��(��)

 

�ñ��Ͻ� ������ ��ǰ ������ �� Q&A �Ǵ� 1:1�Խ����� ���� �����ֽø� �޹� �� ����ڰ� ���������� �亯�帮�ڽ��ϴ�. 




������ �̿뿡 ������ �帰 �� ��� �����帮��, 

���Բ� ���� ���ϰ� �����Ͻ� �� �ִ� ���񽺸� �����ϰ��� ����ϴ� ���Ǵ��� �ǰڽ��ϴ�. 




�����մϴ�.</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[���Ǵ�] Chillin Day �����ǰ ���̹� ���� ���� �ȳ�','2020-04-12','<pre>�ȳ��ϼ���. ���Ǵ��Դϴ�. 

4�� Chillin Day �� ������

�����ǰ ���̹� ������ ����Ǿ����ϴ�. 

 

���� ������ : 4�� 12�� ���� 6�� ����

������ : 4�� 13�� ���� 6�� ����

 







���� �����帰 �������� ������ ���� ���� ������ �����帮��,

�� ���� ������� ���ư��ڽ��ϴ�.

�����մϴ�.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '[���Ǵ�] 3�� `���� ������ �����` �̺�Ʈ �ȳ�','2020-04-10','<pre>�ȳ��ϼ���.

���Ǵ��Դϴ�.

 

3�� �� �����ߴ� \\���� ������ �����\\ �̺�Ʈ���� �� 5���� ���� ���Ե鲲 �̺�Ʈ ������ ����Ǿ����ϴ�.

���� �̺�Ʈ�� �Ʒ� ��ũ���� Ȯ�����ּ���.

https://delphinium.com

 

�߰� ���ǻ����� �����͸� ���� �������ּ���.

�����մϴ�.
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '�������� Live �������� ��÷�� ��ǥ','2020-04-03','<pre>[��÷�ڹ�ǥ]


�ȳ��ϼ���. ���Ǵ��Դϴ�.
3/3~21���� �������� Live �������� �̺�Ʈ ��÷�� ���ϵ帳�ϴ�.


- ��÷�ںе鲲�� ���� ���� �������, �⺻ ������� 4/5)���� ������Ʈ ���ּž� 4/15���� �����߼� �����մϴ�.
- ��ǰ�� ���� ������������ ���� �δ��̸�, ���ݽŰ� ���� �������� ���� �� �߼۵˴ϴ�. 
(���������� ������ ���� ������ �е��� �ش� ������ �ƴմϴ�)
- ������ ���� �ʰų� ��ǰ�߼ۿ� �ʿ��� ����(������ ������)�� ������ �� �е��� ������ ����� �� ���� ��Ź �帳�ϴ�.

 

�ٽ� �� �� �̺�Ʈ ��÷�� �������� ���� �帮��, ������ �ֽ� ��� �е� ���� �帳�ϴ�
</pre>');

insert into board (b_cate, b_num, b_title, b_date, b_content) values (0, no_seq.nextval, '����Ʈ�ο� ��ġ�� ���� ���� �ȳ�','2020-03-08','<pre>�ȳ��ϼ���.
���Ǵ� �Դϴ�.

 

���� 2/15 ~ 3/1 �Ⱓ �� ����÷��� ������ ��, ��ȯ����Ͻ� �в��� ID�� 5õ�� ��ġ���� �����ص帳�ϴ�. (���� ��ȯ��ۿϷ� ����)
��ġ�� ������ �ý��ۻ� ���� �ٷ� ������ �����, ���� �ϰ� ��ġ�� �����ص帮�ڽ��ϴ�. 

������ �����ص帮�� ���� �˼��մϴ�.


�����մϴ�.
</pre>');



select * from board
-----------------------------------------------------------------------------------------------------------PROMOTION
truncate table board;


insert into board values(1,pro_seq.nextval,'��� �м� �������̽��ڶ�, ���Ż�� �������� ���θ��','2020-05-12','<pre>����ģȭ�� ��ġ�Һ� �߽� ��� �м� �귣�� HEUREUX �������̽��ڶ� ���Ż� ������ ������ �� ���Ű�����<br> ���������� HEUREUX �Ŀ�ġ ������ �Բ� ���� �̺�Ʈ�� �����Ѵ�. </pre>','upload\��1��.jpg','��������','��������');
insert into board values(1,pro_seq.nextval,'���Ÿ� ��� ��Ƽ ���޸���, ��Ī 3�ֳ� ��� ���� �������� ���θ�� ����','2020-05-13','<pre>���Ÿ� ��� ��Ƽ �귣�� ���޸���(DEAR DAHLIA)�� �귣�� ��Ī 3�ֳ��� �����Ͽ� �� ������ ������ �����ϴ� ������ ��� ǳ���� �̺�Ʈ�� Blooming Birthday ���θ���� �غ��ߴ�.</pre>','upload\��2��.png','��������','��������');
insert into board values(1,pro_seq.nextval,'��� ȭ��ǰ �����긣 �ӽ� ���� ���θ��','2020-05-14','<pre>[�ڽ����ڸ��ƴ��� �ڻ��� ����] ���� �ִ� ��� ���� ȭ��ǰ �귣�� �����긣�� <br> H&B����� �ӽ�(LOHBs) ������ ����� ���ϰ� ���� ���θ���� �����Ѵ�.</pre>','upload\��3��.jpg','��������','��������');
insert into board values(1,pro_seq.nextval,'ä�Ĺڶ�ȸ ����佺Ÿ�� ��� �ڽ���ƽ ���� ���̾�','2020-05-15','<pre>ä������ �ڶ�ȸ�� ����佺Ÿ�� �ټ��� ��� �ڽ���ƽ ��ǰ���� ������ �����̴�.</pre>','upload\��4��(1).png','upload\��4��(2).jpg','��������');
insert into board values(1,pro_seq.nextval,'��� �м� �����̺�(BBYB) 20SS ���� �ݷ��� �������� ����, ���� ���θ�� ����','2020-05-16','<pre>������ �Һ�ȭ�� �ݿ��� ��� �м��� �߱��ϴ� �� ���������� �귣�� �����̺�(BBYB) (���ֿ�, ��ǥ ����ȭ)�� <br>�������� �¾� 2020 SS �ݷ��� ���� ����� �����ϰ� ���������� �����Ѵ�.</pre>','upload\��5��.png','��������','��������');
insert into board values(1,pro_seq.nextval,'��������, �����Ǵ� Ư�� ���� ���θ��','2020-05-17','<pre>���� ����ڽ���ƽ �귣�� ���������� ������ ���� �¾� ����ǰ 3���� ���� ����&����Ʈ ���� ���θ���� �����Ѵ�.</pre>','upload\��6��.jpg','��������','��������');
insert into board values(1,pro_seq.nextval,'��� �м� �����̺�(BBYB) 19FW ���� �÷��� ��� ����, ��� ��� ���� ���θ�� ����','2020-05-18','<pre>�����̺�(BBYB)�� ��� �Һ� �����ϴ� ������ �Һ��ڵ��� ���� ����ũ ������ ��� ���縦 ����Ͽ� <br>�� ���� ���Ӱ� ����ũ�� ������ �����̸� ��Ÿ�ϰ� �ǿ뼺�� ������ �������� Ư¡�̴�.</pre>','upload\��7��.jpg','��������','��������');
insert into board values(1,pro_seq.nextval,'K-������ 2020 ����Ʈ����� ����','2020-05-19','<pre>��� ��� ����ȸ �ڸ��ƺ����� 2020(���� K-������)�� <br>���� 1�� ���̹��� �ڸ��ƺ�������� �����ϰ� ������̿� ������.</pre>','upload\��8��.png','��������','��������');
insert into board values(1,pro_seq.nextval,'������Ƽ��Ż, ���� ���� ��� ���� �������������� ����� ���� ����','2020-05-20','<pre>�Ｚ�� �׷��� ������Ƽ��Ż ���� �ĸ������� �ֱ� ���� �ָ�޴� ģȯ�� ���� �� �ϳ��� ��� ����(Vegan Wine)�� ���� ���ʷ� �Ұ��Ͽ���.</pre>','upload\��9��.jpg','��������','��������');
insert into board values(1,pro_seq.nextval,'������ ��� ȭ��ǰ ��Ƽī, �Ե����ͳݸ鼼�� ����','2020-05-21','<pre>�ֱ� �� ���������� ģȯ���� �Ѿ� �ݵ�� ȯ���� ���Ѿ� �Ѵٴ� ��ȯ���� �Һ� Ʈ����� �������鼭 ������ ������ �������� �ʰ� <br> ���� ������ ��ġ�� �ʴ� ��� ȭ��ǰ�� ���� ���ɰ� ���䰡 �������� �ִ�.</pre>','upload\��10��.jpg','��������','��������');
insert into board values(1,pro_seq.nextval,'��� �ڽ���ƽ �𸮽þ�, ����Ƽ ���� �۸��� ��ƽ ���','2020-05-22','<pre>�̹��� ����ϴ� ����Ƽ ���� �۸��� ��ƽ�� �۸��� ���⿡ ������� ������ �ʺ��� �� �Թ��ڵ� ���� �����ϰ� ����ũ���� �� �ִ�<br> ��ƽ�� �۸��� ��ǰ���� ���� �Һ��ڵ��� ������ ���� �ִ�.</pre>','upload\��11��(1).jpg','upload\��11��(2).jpg','��������');
insert into board values(1,pro_seq.nextval,'��� �м� BBYB �̸� ũ�������� �̺�Ʈ�� 20% ����','2020-05-23','<pre>�ֿ�(��ǥ ����ȭ)�� ��� �м� �귣�� �����̺�(BBYB)�� ���� ũ���������� �¾� �̸�ũ��������(MIRI CHRISTMAS) ���θ���� �����Ѵ�.</pre>','upload\��12��(1).jpg','upload\��12��(2).jpg','upload\��12��(3).jpg');
insert into board values(1,pro_seq.nextval,'��� ȭ��ǰ �ƿ��۷���, ����� �α� ���� �鼼 ���� ����','2020-05-24','<pre>�ż������ͳ��ų��� ���Ԥ��Ǹ��ϴ� ���Ÿ� ����ũ�� �귣�� �ƿ��۷����� �ֱ� �߱� �Һ��ڵ��� �Լҹ��� Ÿ�� �鼼�� ������ ũ�� �����ߴ�.</pre>','upload\��13��.jpg','��������','��������');
insert into board values(1,pro_seq.nextval,'Ȩ�ؼ���, ��� Ư�� ���ࡦ[ä������ �ǰ� ì�⼼��]','2020-05-25','<pre>����� ������ ���װ� ��, ��� �� ������ ��ᳪ ���������� ��ģ ������ ��ǰ�� �Һ����� �ʴ� ���� ������ ä�� �ܰ�, ä�������ڸ� ���ϴ� �������.</pre>','upload\��14��.png','��������','��������');



-----------------------------------------------------------------------------------------------------------REVIEW

insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD27',rv_seq.nextval,'perl34',5,'2020-06-16','�����ϰ� ��µ� ���� �ٻ��ϰ� �ʹ� ���־��.! �İ��� ���� ���ڶ� �Ȱ��׿�~~');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD30',rv_seq.nextval,'stripe56',5,'2020-08-20','�İ��� ġ��� ���� �Ȱ��Ƽ� ġ�� �Դ� �� ��~~ �籸�� �� �Դϴ�!!!');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD25',rv_seq.nextval,'speaker56',4,'2020-08-17','�⸦ ���Ծ �̰ɷ� �븮��������');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD23',rv_seq.nextval,'moni78',5,'2020-07-13','�����̶� ���� �������� ��µ� �ʹ� ���־ ���� �� �Ծ���ȳ׿�̤�');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD24',rv_seq.nextval,'white78',5,'2020-07-14','�̹����� ������ �����ڸ� ��µ� �ʹ� ���־ �ٸ� ���� �纸����� ����');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD28',rv_seq.nextval,'win34',3,'2020-08-26','�����԰� ���� �� ������ ���� �� ���ƿ�!!');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD31',rv_seq.nextval,'glass90',4,'2020-08-01','�뷮�� ���� �� �� �ƽ����� �� �Ǻο� �ʹ� �߸¾Ƽ� �Ⱦ� ���� ����� ����');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD32',rv_seq.nextval,'tile12',3,'2020-06-18','�߻��� ��¥ �̻۵� ���� ������ �־ �� �ƽ�����. �ٵ� �߻��� ��¥ �ʹ� �̻޴ϴ�.');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD33',rv_seq.nextval,'white78',5,'2020-07-07','��Ծ ���������� ��¥ ���մϴ�. �̹��� ����Ű�� ��µ� �������� ����ŰƮ �纸������ ����');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD34',rv_seq.nextval,'stripe56',5,'2020-08-11',' �Ǻΰ� ������ ���ε� ������ �ʹ� �߸¾ƿ�. �Դٰ� ����̶��..���� �ϼ�����!');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD35',rv_seq.nextval,'curtain12',4,'2020-07-02','�̹��̶� �ָ������� �ѹ��� ���� �� �־ ���� �� ���ƿ�. ������ �������򿡰� ���ε�');
insert into review (md_num, rv_num, userID, rv_md_star, rv_date, rv_content) values ('MD36',rv_seq.nextval,'cd90',4,'2020-06-18','�ű��ؼ� ��ôµ� ����� �� ���� �ξ� ���Ƽ� ��¦ ������..���� ��õ');






----------------------------------------------------------------------------------------------------------- Q & A

insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD27',qa_seq.nextval,'curtain12','��ǰ����','2020-08-22','���庸���ΰ��� �ǿº����ΰ���??', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD30',qa_seq.nextval,'perl34','��ǰ����','2020-07-26','������ �� ���µ� ���Ѱǰ���? ���� �׷��ǰ���?', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD25',qa_seq.nextval,'speaker56','��ǰ����','2020-07-06','���� 40���� �Ʊ⵵ �Ծ �ɱ��?', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD23',qa_seq.nextval,'moni78','��۹���','2020-08-20','���� �ֹ��ϸ� ������ �ñ��?', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD24',qa_seq.nextval,'cd90','��ǰ����','2020-08-20','��������� ���������ΰ���??', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD28',qa_seq.nextval,'cd90','��ǰ����','2020-06-15','��������� �� �����µ� �Ծ �ǰ���?', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD31',qa_seq.nextval,'tile12','��ǰ����','2020-06-14','�����Ǻ��� ����� �߸������??', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD32',qa_seq.nextval,'win34','��ǰ����','2020-08-26','���� �̷��� ���簡 ��������?', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD33',qa_seq.nextval,'stripe56','��ǰ����','2020-07-30','���浵 �߾�︱���????', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD34',qa_seq.nextval,'white78','��ǰ����','2020-07-12','4�� �Ʊ⵵ �ᵵ �Ǵ� ��ǰ�ΰ���?', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD35',qa_seq.nextval,'glass90','��ǰ����','2020-06-01','��ǰ ��������� ���� ��������?', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');
insert into qa (md_num, qa_num, userID, qa_title, qa_date, qa_content, qa_ans) values ('MD36',qa_seq.nextval,'win34','��ǰ����','2020-05-19','�����ǰ� �� �ִµ� ���������?', '�亯�� ���� ��ϵ��� �ʾҽ��ϴ�.');