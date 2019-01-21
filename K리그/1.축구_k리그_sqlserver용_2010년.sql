--  DROP TABLES
drop table PLAYER;
drop table SCHEDULE;
drop table TEAM;
drop table STADIUM;

--  create TABLES
CREATE TABLE STADIUM (
STADIUM_ID    CHAR(3) NOT NULL,
STADIUM_NAME  VARCHAR(40) NOT NULL,
HOMETEAM_ID   CHAR(3),
SEAT_COUNT    int,
ADDRESS       VARCHAR(60),
DDD           VARCHAR(3),
TEL           VARCHAR(10),
CONSTRAINT STADIUM_PK PRI03Y KEY (STADIUM_ID)
);
CREATE TABLE TEAM (
TEAM_ID     CHAR(3) NOT NULL,
REGION_NAME VARCHAR(8) NOT NULL,
TEAM_NAME   VARCHAR(40) NOT NULL,
E_TEAM_NAME VARCHAR(50),
ORIG_YYYY   CHAR(4),
STADIUM_ID  CHAR(3) NOT NULL,
ZIP_CODE1   CHAR(3),
ZIP_CODE2   CHAR(3),
ADDRESS     VARCHAR(80),
DDD         VARCHAR(3),
TEL         VARCHAR(10),
FAX         VARCHAR(10),
HOMEPAGE    VARCHAR(50),
OWNER       VARCHAR(10),
CONSTRAINT TEAM_PK PRI03Y KEY (TEAM_ID),
CONSTRAINT TEAM_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM(STADIUM_ID)
);
CREATE TABLE SCHEDULE (
STADIUM_ID   CHAR(3) NOT NULL,
SCHE_DATE    CHAR(8) NOT NULL,
GUBUN        CHAR(1) NOT NULL,
HOMETEAM_ID  CHAR(3) NOT NULL,
AWAYTEAM_ID  CHAR(3) NOT NULL,
HOME_SCORE   tinyint,
AWAY_SCORE   tinyint,
CONSTRAINT SCHEDULE_PK PRI03Y KEY (STADIUM_ID, SCHE_DATE),
CONSTRAINT SCHEDULE_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM(STADIUM_ID)
);
CREATE TABLE  PLAYER (
PLAYER_ID     CHAR(7) NOT NULL,
PLAYER_NAME   VARCHAR(20) NOT NULL,
TEAM_ID       CHAR(3) NOT NULL,
E_PLAYER_NAME VARCHAR(40),
NICKNAME      VARCHAR(30),
JOIN_YYYY     CHAR(4),
POSITION      VARCHAR(10),
BACK_NO       tinyint,
NATION        VARCHAR(20),
BIRTH_DATE    DATE,
SOLAR         CHAR(1),
HEIGHT        smallint,
WEIGHT        smallint,
CONSTRAINT PLAYER_PK PRI03Y KEY (PLAYER_ID),
CONSTRAINT PLAYER_FK FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID)
);

--  insert STADIUM 20 data
INSERT INTO stadium VALUES ('D03','���ֿ����Ű����','K05',28000,'���� ���ֽ� ������ �ݿ��� 763-1','063','273-1763');
INSERT INTO stadium VALUES ('B02','�������տ��','K08',27000,'��⵵ ������ �д籸 ��ž�� 486','031','753-3956');
INSERT INTO stadium VALUES ('C06','���׽�ƿ�ߵ�','K03',25000,'��� ���׽� ���� ���� 1','054','282-2002');
INSERT INTO stadium VALUES ('D01','������������','K07',20009,'���� ����� ��ȣ�� 700','061','792-5600');
INSERT INTO stadium VALUES ('B05','��������Ű����','K09',66806,'����Ư���� ������ �������� 66','02','2128-2973');
INSERT INTO stadium VALUES ('B01','��õ�����Ű����','K04',35000,'��õ������ ���� ���е� 482','031','666-0496');
INSERT INTO stadium VALUES ('C05','â�����տ��','K11','27085','�泲 â���� �δ뵿 145','055','6644-8468');
INSERT INTO stadium VALUES ('C04','��깮�������','K01',46102,'��걤���� ���� ���� ��5','052','220-2468');
INSERT INTO stadium VALUES ('D02','���������Ű����','K10',41000,'���������� ������ ������ 270','042','252-2002');
INSERT INTO stadium VALUES ('B04','���������Ű����','K02',50000,'������ �ȴޱ� �츸1�� 228����','031','259-2150');
INSERT INTO stadium VALUES ('A02','���ֿ����Ű����','K12','40245','���ֱ����� ���� ǳ�ϵ� 423-2','062','2468-8642');
INSERT INTO stadium VALUES ('C02','�λ�ƽþƵ�����','K06',30000,'�λ걤���� ���� ����ŵ� 3�� 210����','051','247-5771');
INSERT INTO stadium VALUES ('A03','�������հ����','K13',33000,'���� ������ ���� ��58','033','459-3631');
INSERT INTO stadium VALUES ('A04','���ֿ����Ű����','K14',42256,'���� �������� ��ȯ��','064','3631-2460');
INSERT INTO stadium VALUES ('A05','�뱸�����Ű����','K15',66422,'�뱸������ ������ ���ﵿ 504','053','602-2011');
INSERT INTO stadium VALUES ('F01','�뱸�ùΰ����','',30000,'�뱸������','054','');
INSERT INTO stadium VALUES ('F02','�λ�ùΰ����','',30000,'�λ걤����','051','');
INSERT INTO stadium VALUES ('F03','�ϻ�����','',20000,'��⵵ �ϻ��','031','');
INSERT INTO stadium VALUES ('F04','��������','',20000,'�泲 �����','055','');
INSERT INTO stadium VALUES ('F05','�Ⱦ�����','',20000,'��⵵ �Ⱦ��','031','');

--select count(*) from stadium

--  insert TEAM 15 data
INSERT INTO team VALUES ('K05','����','������ͽ�','CHUNBUK HYUNDAI MOTORS FC','1995','D03','560','190',
'���� ���ֽ� ������ �ݿ��� 763-1 ���ֿ����Ű���� ��','063','273-1763','273-1762','http://www.hyundai-motorsfc.com','');
INSERT INTO team VALUES ('K08','����','��ȭõ��','SEONGNAM ILHWA CHUNMA FC','1988','B02','462',
'130','��⵵ ������ �д籸 ��ž�� 486���� ���� ��2���տ�� ��','031','753-3956','753-4443','http://www.esifc.com','');
INSERT INTO team VALUES ('K03','����','��ƿ����','FC POHANG STEELERS','1973','C06','790','050',
'��� ���׽� �׵��� 614-8 ������� 7��','054','282-2002','282-5955','http://www.steelers.co.kr','');
INSERT INTO team VALUES ('K07','����','�巡����','CHUNNAM DRAGONS FC','1994','D01','544','010',
'���� ����� �ߵ� 1318-5 ����������� 2��','061','792-5600','792-5605','http://www.dragons.co.kr','');
INSERT INTO team VALUES ('K09','����','FC����','FOOTBALL CLUB SEOUL','1983','B05','138','221',
'���� ������ ���굿 515 ������ ����� ��','02','2005-5746','2005-5802','http://www.fcseoul.com','');
INSERT INTO team VALUES ('K04','��õ','������Ƽ��','INCHEON UNITED FC','2004','B01','110','728',
'��õ������ ���� ���е� 482 ��õ�����Ű���� ��','032','2121-5271','2121-5276','http://www.incheonutd.com','');
INSERT INTO team VALUES ('K11','�泲','�泲FC','GYEONGNAM FC','2006','C05','111','222',
'�泲 â���� �δ뵿 145 â�����տ��','055','6644-8468','6644-8488','http://www.gsndfc.co.kr','');
INSERT INTO team VALUES ('K01','���','�������','ULSAN HYUNDAI FC','1986','C04','682','060',
'��걤���� ���� ���ε� ��137-1 ���뽺����Ŭ���Ͽ콺','052','230-6141','230-6145','http://www.uhfc.tv','');
INSERT INTO team VALUES ('K10','����','��Ƽ��','DAEJEON CITIZEN FC','1996','D02','301','030',
'���������� ������ ������ 270 ���������Ű���� ���� 3��','042','252-2002','221-0669','http://www.dcfc.co.kr','');
INSERT INTO team VALUES ('K02','����','�Ｚ�������','SUWON SAMSUNG BLUEWINGS FC','1995','B04','440','220',
'������ �ȴޱ� �츸1�� 228 ���������Ű���� 4��','031','247-2002','257-0766','http://www.bluewings.kr','');
INSERT INTO team VALUES ('K12','����','���ֻ�','GWANGJU SANGMU FC','1984','A02','450','419',
'���ֱ����� ���� ǳ�ϵ� 423-2 ���ֿ����Ű���� ��','062','777-5180','777-5181','http://www.gwangjusmfc.co.kr','');
INSERT INTO team VALUES ('K06','�λ�','������ũ','BUSAN IPARK FC','1983','C02','570','050',
'�λ걤���� ������ ����1�� 2155���� ����ü������ ��','051','555-7101','555-7103','http://www.busanipark.co.kr','');
INSERT INTO team VALUES ('K13','����','����FC','GANGWON FC','2008','A03','333','444',
'���� ��õ�� �߾ӷ� 7 ������ ���߰��� ���� ��','033','459-3631','459-3630','http://www.gangwon-fc.com','');
INSERT INTO team VALUES ('K14','����','����������Ƽ��FC','JEJU UNITED FC','1982','A04','555','666',
'���� �������� ������ 3355-5','064','3631-2460','3631-2468','http://www.jeju-utd.com','');
INSERT INTO team VALUES ('K15','�뱸','�뱸FC','DAEGU FC','2002','A05','777','888',
'�뱸������ ������ ���ﵿ 504 �뱸��Ÿ��� ��','053','5566-3967','5566-3970','http://www.daegufc.co.kr','');

--select count(*) from team


--  insert schedule 180 data
INSERT INTO schedule VALUES ('C02','20120501','Y','K06','K10','2','0');
INSERT INTO schedule VALUES ('B04','20120505','Y','K02','K01','1','2');
INSERT INTO schedule VALUES ('B05','20120505','Y','K09','K08','1','3');
INSERT INTO schedule VALUES ('B02','20120512','Y','K08','K01','1','1');
INSERT INTO schedule VALUES ('C02','20120707','Y','K06','K01','1','2');
INSERT INTO schedule VALUES ('B02','20120707','Y','K08','K03','3','2');
INSERT INTO schedule VALUES ('D03','20120707','Y','K05','K09','2','1');
INSERT INTO schedule VALUES ('D01','20120707','Y','K07','K10','1','0');
INSERT INTO schedule VALUES ('B04','20120710','Y','K02','K01','2','1');
INSERT INTO schedule VALUES ('D03','20120710','Y','K05','K03','1','1');
INSERT INTO schedule VALUES ('D02','20120710','Y','K10','K04','0','2');
INSERT INTO schedule VALUES ('C02','20120710','Y','K06','K08','3','1');
INSERT INTO schedule VALUES ('D01','20120710','Y','K07','K09','0','0');
INSERT INTO schedule VALUES ('C06','20120713','Y','K03','K06','2','1');
INSERT INTO schedule VALUES ('B05','20120714','Y','K09','K02','3','0');
INSERT INTO schedule VALUES ('B01','20120714','Y','K04','K07','1','0');
INSERT INTO schedule VALUES ('D02','20120714','Y','K10','K08','1','1');
INSERT INTO schedule VALUES ('D01','20120717','Y','K07','K01','0','0');
INSERT INTO schedule VALUES ('C06','20120717','Y','K03','K02','2','0');
INSERT INTO schedule VALUES ('B02','20120717','Y','K08','K04','2','1');
INSERT INTO schedule VALUES ('C02','20120717','Y','K06','K05','1','2');
INSERT INTO schedule VALUES ('B05','20120717','Y','K09','K10','1','1');
INSERT INTO schedule VALUES ('D01','20120720','Y','K07','K03','1','1');
INSERT INTO schedule VALUES ('B04','20120721','Y','K02','K06','2','2');
INSERT INTO schedule VALUES ('D03','20120721','Y','K05','K08','2','2');
INSERT INTO schedule VALUES ('B01','20120721','Y','K04','K09','1','3');
INSERT INTO schedule VALUES ('D03','20120724','Y','K05','K02','1','1');
INSERT INTO schedule VALUES ('D02','20120724','Y','K10','K03','1','1');
INSERT INTO schedule VALUES ('C02','20120724','Y','K06','K07','0','1');
INSERT INTO schedule VALUES ('B02','20120724','Y','K08','K09','1','1');
INSERT INTO schedule VALUES ('C06','20120727','Y','K03','K04','2','1');
INSERT INTO schedule VALUES ('D01','20120727','Y','K07','K05','2','1');
INSERT INTO schedule VALUES ('C02','20120727','Y','K06','K10','3','0');
INSERT INTO schedule VALUES ('B05','20120728','Y','K09','K01','1','1');
INSERT INTO schedule VALUES ('B04','20120728','Y','K02','K08','2','2');
INSERT INTO schedule VALUES ('B02','20120731','Y','K08','K01','2','0');
INSERT INTO schedule VALUES ('B05','20120731','Y','K09','K03','3','1');
INSERT INTO schedule VALUES ('D02','20120731','Y','K10','K05','1','0');
INSERT INTO schedule VALUES ('B01','20120731','Y','K04','K06','3','2');
INSERT INTO schedule VALUES ('B04','20120731','Y','K02','K07','1','2');
INSERT INTO schedule VALUES ('B02','20120803','Y','K08','K07','1','0');
INSERT INTO schedule VALUES ('C02','20120803','Y','K06','K09','2','1');
INSERT INTO schedule VALUES ('D02','20120804','Y','K10','K02','0','3');
INSERT INTO schedule VALUES ('D03','20120804','Y','K05','K04','2','1');
INSERT INTO schedule VALUES ('B01','20120811','Y','K04','K02','0','2');
INSERT INTO schedule VALUES ('B05','20120811','Y','K09','K05','0','1');
INSERT INTO schedule VALUES ('C06','20120811','Y','K03','K08','2','0');
INSERT INTO schedule VALUES ('D01','20120811','Y','K07','K10','1','1');
INSERT INTO schedule VALUES ('D03','20120818','Y','K05','K01','0','2');
INSERT INTO schedule VALUES ('C02','20120818','Y','K06','K03','3','1');
INSERT INTO schedule VALUES ('B01','20120818','Y','K04','K07','1','0');
INSERT INTO schedule VALUES ('B04','20120818','Y','K02','K09','1','2');
INSERT INTO schedule VALUES ('B02','20120818','Y','K08','K10','3','1');
INSERT INTO schedule VALUES ('B04','20120824','Y','K02','K01','1','1');
INSERT INTO schedule VALUES ('D03','20120824','Y','K05','K03','3','3');
INSERT INTO schedule VALUES ('B02','20120824','Y','K08','K06','4','3');
INSERT INTO schedule VALUES ('D02','20120825','Y','K10','K04','1','1');
INSERT INTO schedule VALUES ('B05','20120825','Y','K09','K07','1','1');
INSERT INTO schedule VALUES ('C06','20120828','Y','K03','K02','0','0');
INSERT INTO schedule VALUES ('C02','20120828','Y','K06','K05','1','1');
INSERT INTO schedule VALUES ('B01','20120828','Y','K04','K08','2','3');
INSERT INTO schedule VALUES ('B05','20120828','Y','K09','K10','2','0');
INSERT INTO schedule VALUES ('D02','20120901','Y','K10','K01','2','3');
INSERT INTO schedule VALUES ('D01','20120901','Y','K07','K03','0','1');
INSERT INTO schedule VALUES ('B04','20120901','Y','K02','K06','1','1');
INSERT INTO schedule VALUES ('D03','20120901','Y','K05','K08','3','3');
INSERT INTO schedule VALUES ('B01','20120901','Y','K04','K09','2','1');
INSERT INTO schedule VALUES ('D01','20120911','N','K07','K05','','');
INSERT INTO schedule VALUES ('B05','20120911','N','K09','K01','','');
INSERT INTO schedule VALUES ('B04','20120911','N','K02','K08','','');
INSERT INTO schedule VALUES ('B01','20120911','N','K04','K03','','');
INSERT INTO schedule VALUES ('D02','20120911','N','K10','K06','','');
INSERT INTO schedule VALUES ('C02','20120914','N','K06','K04','','');
INSERT INTO schedule VALUES ('C06','20120914','N','K03','K09','','');
INSERT INTO schedule VALUES ('B02','20120914','N','K08','K01','','');
INSERT INTO schedule VALUES ('D01','20120914','N','K07','K02','','');
INSERT INTO schedule VALUES ('D03','20120915','N','K05','K10','','');
INSERT INTO schedule VALUES ('D02','20120918','N','K10','K02','','');
INSERT INTO schedule VALUES ('B02','20120918','N','K08','K07','','');
INSERT INTO schedule VALUES ('B05','20120918','N','K09','K06','','');
INSERT INTO schedule VALUES ('D03','20120918','N','K05','K04','','');
INSERT INTO schedule VALUES ('B04','20120925','N','K02','K10','','');
INSERT INTO schedule VALUES ('C06','20120925','N','K03','K01','','');
INSERT INTO schedule VALUES ('B01','20120925','N','K04','K05','','');
INSERT INTO schedule VALUES ('D01','20120925','N','K07','K08','','');
INSERT INTO schedule VALUES ('B05','20120925','N','K09','K06','','');
INSERT INTO schedule VALUES ('D01','20121019','N','K07','K02','','');
INSERT INTO schedule VALUES ('C06','20121019','N','K03','K09','','');
INSERT INTO schedule VALUES ('D02','20121020','N','K10','K05','','');
INSERT INTO schedule VALUES ('C02','20121020','N','K06','K04','','');
INSERT INTO schedule VALUES ('C06','20121023','N','K03','K04','','');
INSERT INTO schedule VALUES ('D03','20121023','N','K05','K07','','');
INSERT INTO schedule VALUES ('C02','20121023','N','K06','K10','','');
INSERT INTO schedule VALUES ('B02','20121023','N','K08','K02','','');
INSERT INTO schedule VALUES ('D01','20121026','N','K07','K06','','');
INSERT INTO schedule VALUES ('D02','20121027','N','K10','K03','','');
INSERT INTO schedule VALUES ('B01','20121027','N','K04','K01','','');
INSERT INTO schedule VALUES ('B05','20121027','N','K09','K08','','');
INSERT INTO schedule VALUES ('B04','20121027','N','K02','K05','','');
INSERT INTO schedule VALUES ('B04','20121030','N','K02','K04','','');
INSERT INTO schedule VALUES ('D02','20121030','N','K10','K08','','');
INSERT INTO schedule VALUES ('C06','20121102','N','K03','K07','','');
INSERT INTO schedule VALUES ('B05','20121103','N','K09','K04','','');
INSERT INTO schedule VALUES ('C02','20121103','N','K06','K02','','');
INSERT INTO schedule VALUES ('B02','20121103','N','K08','K05','','');
INSERT INTO schedule VALUES ('D03','20121106','N','K05','K06','','');
INSERT INTO schedule VALUES ('D01','20121106','N','K07','K01','','');
INSERT INTO schedule VALUES ('D02','20121106','N','K10','K09','','');
INSERT INTO schedule VALUES ('B01','20121106','N','K04','K08','','');
INSERT INTO schedule VALUES ('B04','20121106','N','K02','K03','','');
INSERT INTO schedule VALUES ('C06','20121109','N','K03','K05','','');
INSERT INTO schedule VALUES ('B05','20121110','N','K09','K07','','');
INSERT INTO schedule VALUES ('B01','20121110','N','K04','K10','','');
INSERT INTO schedule VALUES ('B02','20121110','N','K08','K06','','');
INSERT INTO schedule VALUES ('D01','20121113','N','K07','K04','','');
INSERT INTO schedule VALUES ('C02','20121113','N','K06','K03','','');
INSERT INTO schedule VALUES ('B04','20121113','N','K02','K09','','');
INSERT INTO schedule VALUES ('D03','20121113','N','K05','K01','','');
INSERT INTO schedule VALUES ('B05','20121117','N','K09','K05','','');
INSERT INTO schedule VALUES ('D02','20121117','N','K10','K07','','');
INSERT INTO schedule VALUES ('C06','20121117','N','K03','K08','','');
INSERT INTO schedule VALUES ('B01','20121117','N','K04','K02','','');
INSERT INTO schedule VALUES ('C04','20120508','Y','K01','K08','1','3');
INSERT INTO schedule VALUES ('C04','20120713','Y','K01','K05','0','0');
INSERT INTO schedule VALUES ('C04','20120720','Y','K01','K10','0','0');
INSERT INTO schedule VALUES ('C04','20120724','Y','K01','K04','1','1');
INSERT INTO schedule VALUES ('C04','20120803','Y','K01','K03','3','0');
INSERT INTO schedule VALUES ('C04','20120811','Y','K01','K06','0','0');
INSERT INTO schedule VALUES ('C04','20120828','Y','K01','K07','0','1');
INSERT INTO schedule VALUES ('C04','20120918','N','K01','K03','','');
INSERT INTO schedule VALUES ('C04','20121019','N','K01','K08','','');
INSERT INTO schedule VALUES ('C04','20121023','N','K01','K09','','');
INSERT INTO schedule VALUES ('C04','20121102','N','K01','K10','','');
INSERT INTO schedule VALUES ('C04','20121110','N','K01','K02','','');
INSERT INTO schedule VALUES ('C04','20121117','N','K01','K06','','');
INSERT INTO schedule VALUES ('C04','20121124','N','K01','K08','','');
INSERT INTO schedule VALUES ('C06','20120317','Y','K03','K02','1','2');
INSERT INTO schedule VALUES ('B02','20120317','Y','K08','K04','6','0');
INSERT INTO schedule VALUES ('D02','20120317','Y','K10','K06','2','1');
INSERT INTO schedule VALUES ('C05','20120317','Y','K11','K09','2','2');
INSERT INTO schedule VALUES ('D01','20120320','Y','K07','K01','1','2');
INSERT INTO schedule VALUES ('D03','20120320','Y','K05','K03','1','0');
INSERT INTO schedule VALUES ('B04','20120320','Y','K02','K08','2','3');
INSERT INTO schedule VALUES ('B05','20120320','Y','K09','K10','2','0');
INSERT INTO schedule VALUES ('B04','20120323','Y','K02','K05','2','0');
INSERT INTO schedule VALUES ('C02','20120324','Y','K06','K01','1','2');
INSERT INTO schedule VALUES ('B01','20120324','Y','K04','K03','1','1');
INSERT INTO schedule VALUES ('B05','20120324','Y','K09','K07','1','0');
INSERT INTO schedule VALUES ('D01','20120327','Y','K07','K06','2','1');
INSERT INTO schedule VALUES ('C06','20120327','Y','K03','K08','1','0');
INSERT INTO schedule VALUES ('C05','20120327','Y','K11','K10','0','1');
INSERT INTO schedule VALUES ('D03','20120406','Y','K05','K04','3','2');
INSERT INTO schedule VALUES ('B01','20120410','Y','K04','K02','2','0');
INSERT INTO schedule VALUES ('B02','20120410','Y','K08','K05','2','1');
INSERT INTO schedule VALUES ('D02','20120410','Y','K10','K07','1','1');
INSERT INTO schedule VALUES ('C02','20120410','Y','K06','K09','1','4');
INSERT INTO schedule VALUES ('D02','20120414','Y','K10','K01','0','2');
INSERT INTO schedule VALUES ('B02','20120414','Y','K08','K03','1','1');
INSERT INTO schedule VALUES ('B01','20120414','Y','K04','K05','1','0');
INSERT INTO schedule VALUES ('C02','20120414','Y','K06','K07','2','0');
INSERT INTO schedule VALUES ('D03','20120420','Y','K05','K08','2','2');
INSERT INTO schedule VALUES ('D01','20120420','Y','K07','K10','0','1');
INSERT INTO schedule VALUES ('B04','20120421','Y','K02','K04','3','2');
INSERT INTO schedule VALUES ('B05','20120421','Y','K09','K06','1','0');
INSERT INTO schedule VALUES ('B02','20120424','Y','K08','K02','1','1');
INSERT INTO schedule VALUES ('C06','20120424','Y','K03','K05','1','2');
INSERT INTO schedule VALUES ('C05','20120424','Y','K11','K07','1','2');
INSERT INTO schedule VALUES ('D02','20120424','Y','K10','K09','1','3');
INSERT INTO schedule VALUES ('C06','20120427','Y','K03','K04','0','3');
INSERT INTO schedule VALUES ('C05','20120427','Y','K11','K06','5','2');
INSERT INTO schedule VALUES ('D01','20120427','Y','K07','K09','0','1');
INSERT INTO schedule VALUES ('D03','20120428','Y','K05','K02','1','2');
INSERT INTO schedule VALUES ('B05','20120501','Y','K09','K01','0','0');
INSERT INTO schedule VALUES ('B04','20120501','Y','K02','K03','1','2');
INSERT INTO schedule VALUES ('B01','20120501','Y','K04','K08','2','2');
INSERT INTO schedule VALUES ('D03','20120904','Y','K05','K02','1','2');
INSERT INTO schedule VALUES ('B02','20120904','Y','K08','K09','1','0');
INSERT INTO schedule VALUES ('C05','20120904','Y','K11','K04','2','2');
INSERT INTO schedule VALUES ('C06','20120904','Y','K03','K10','0','0');
INSERT INTO schedule VALUES ('C02','20120904','Y','K06','K07','2','2');

--select count(*) from schedule
--  insert player 480 data
INSERT INTO player VALUES ('2009175','�츣���','K06','','','2009','DF','4','����','1987-08-30','1','180','70');
INSERT INTO player VALUES ('2007188','������','K06','','','2005','DF','15','','1982-11-01','1','180','74');
INSERT INTO player VALUES ('2012073','���ȣ','K06','','','2011','DF','23','','1989-07-13','1','177','72');
INSERT INTO player VALUES ('2007178','��μ�','K06','','','','DF','20','','01-06-1983','1','182','73');
INSERT INTO player VALUES ('2007191','�����','K06','','���ߵ���,�������','2007','DF','18','','05-06-1984','2','170','61');
INSERT INTO player VALUES ('2008384','����ȿ','K06','','������,��Ű��','2008','DF','19','','10-07-1985','2','174','68');
INSERT INTO player VALUES ('2008395','�����','K06','','�ޱ�','2010','DF','7','','09-03-1985','2','184','79');
INSERT INTO player VALUES ('2011050','�ڻ��','K06','','����ȫ�浿','2011','DF','36','','12-06-1988','1','173','65');
INSERT INTO player VALUES ('2007189','���翵','K06','','����','2006','MF','6','','02-09-1983','2','187','75');
INSERT INTO player VALUES ('2011049','���¹�','K06','','ŷī','2011','MF','38','','05-25-1992','1','180','71');
INSERT INTO player VALUES ('2010107','������','K06','','','2010','MF','37','','04-06-1991','1','178','70');
INSERT INTO player VALUES ('2011043','������','K06','','�䷷����','2011','MF','24','','02-20-1989','1','177','73');
INSERT INTO player VALUES ('2011044','������','K06','','���漮','2011','MF','13','','08-09-1988','1','178','74');
INSERT INTO player VALUES ('2012137','�̰�','K06','�̰� �ǹ� �� �丮�̵���','�̰�','2012','MF','21','�����','02-10-1989','1','181','76');
INSERT INTO player VALUES ('2007200','�����','K06','','�����','2007','MF','26','','12-15-1983','2','173','66');
INSERT INTO player VALUES ('2012072','�����','K06','','','2012','MF','14','','03-22-1989','1','176','67');
INSERT INTO player VALUES ('2009038','�����','K06','','����������','2009','MF','11','','02-02-1987','2','175','68');
INSERT INTO player VALUES ('2008365','���¼�','K06','','','2011','MF','30','','06-16-1987','1','177','64');
INSERT INTO player VALUES ('2011047','Ȳö��','K06','','��ٸ���','2011','MF','35','','11-20-1988','1','175','68');
INSERT INTO player VALUES ('2008235','������','K06','','','','FW','39','','10-10-1986','1','178','71');
INSERT INTO player VALUES ('2011048','������','K06','','','2011','FW','25','','05-22-1985','1','182','78');
INSERT INTO player VALUES ('2012074','��â��','K06','','�Ӷ�','2012','FW','27','','01-10-1988','1','186','82');
INSERT INTO player VALUES ('2012127','���','K06','Sebastiao Pereira do Nascimento','','2012','FW','8','�����','02-24-1986','1','179','78');
INSERT INTO player VALUES ('2007182','����ġ','K06','','�ٶ��� �Ƶ�','2006','FW','9','','01-16-1982','2','184','80');
INSERT INTO player VALUES ('2007195','�켺��','K06','','����','2006','FW','22','','08-18-1983','2','191','76');
INSERT INTO player VALUES ('2010103','����','K06','','¦��','2010','FW','12','','07-08-1987','1','180','71');
INSERT INTO player VALUES ('2012075','�̱���','K06','','','2012','FW','29','','09-25-1989','1','177','73');
INSERT INTO player VALUES ('2010087','�ϸ�','K06','','','2010','FW','10','�ݷҺ��','05-14-1984','1','168','65');
INSERT INTO player VALUES ('2000017','�ڻ�','K06','','','2008','FW','32','','07-09-1985','2','188','80');
INSERT INTO player VALUES ('2000018','���丣','K06','','���丣','2011','FW','28','����������','05-01-1985','1','183','79');
INSERT INTO player VALUES ('2000021','������','K04','LEE, YOONGYUM','','2002','DF','','','','','178','80');
INSERT INTO player VALUES ('2000022','������','K04','HA, JAEHON','','2002','DF','','','','','174','67');
INSERT INTO player VALUES ('2000023','����ȣ','K04','KIM, CHUNGHO','','2009','DF','','','','','185','83');
INSERT INTO player VALUES ('2000024','�ӱ���','K04','LIM, GIHAN','','2004','DF','','','','','177','85');
INSERT INTO player VALUES ('2000025','�����','K04','KIM, KYOUNGTAE','','','DF','','','','','','');
INSERT INTO player VALUES ('2012054','������','K04','','','','GK','31','','04-20-1989','2','180','72');
INSERT INTO player VALUES ('2008499','����ȣ','K04','','','','GK','60','','04-07-1978','2','185','83');
INSERT INTO player VALUES ('2011021','����','K04','','','','GK','1','','07-11-1988','2','192','85');
INSERT INTO player VALUES ('2012052','�ѵ���','K04','','','','GK','21','','08-25-1989','2','183','78');
INSERT INTO player VALUES ('2012126','�ٿ�','K04','','','','DF','61','','09-25-1992','2','190','80');
INSERT INTO player VALUES ('2008182','��ö','K04','','','','DF','15','','08-20-1983','2','176','77');
INSERT INTO player VALUES ('2010112','��â��','K04','','','','DF','23','','12-31-1987','2','175','67');
INSERT INTO player VALUES ('2008424','����ȣ','K04','','','','DF','2','','05-13-1985','2','179','70');
INSERT INTO player VALUES ('2008450','������','K04','','','','DF','5','','08-12-1985','1','177','75');
INSERT INTO player VALUES ('2011022','�����','K04','','','','DF','25','','11-02-1989','1','182','75');
INSERT INTO player VALUES ('2012053','���ȫ','K04','','','','DF','30','','04-02-1989','1','178','68');
INSERT INTO player VALUES ('2000001','����ȣ','K10','','','','DF','','','01-29-1971','1','','');
INSERT INTO player VALUES ('2000002','�����','K10','JEONG, SAMSOO','','','DF','','','08-02-1973','1','','');
INSERT INTO player VALUES ('2000003','������','K10','YOU, DONGWOO','','','DF','40','','07-03-1978','1','177','70');
INSERT INTO player VALUES ('2000004','������','K10','JEON, GIHYUN','','','DF','','','06-06-1975','1','','');
INSERT INTO player VALUES ('2012047','������','K10','KANG, SUNGIL','','2012','GK','30','','04-06-1989','1','182','80');
INSERT INTO player VALUES ('2010057','�����','K10','KIM, SEUNG06','������','2010','GK','1','','01-09-1982','1','183','77');
INSERT INTO player VALUES ('2007298','������','K10','LEE, EUNSUNG','��ȣõȲ','2007','GK','21','','05-04-1981','1','184','82');
INSERT INTO player VALUES ('2007312','�����','K10','JEONG, DAESOO','','2007','DF','15','','03-20-1985','1','184','74');
INSERT INTO player VALUES ('2012051','���α�','K10','','','','DF','3','','04-25-1988','1','171','65');
INSERT INTO player VALUES ('2010110','������','K10','JEONG, SUNGKEUN','','2010','DF','33','','06-06-1987','1','180','73');
INSERT INTO player VALUES ('2011098','������','K10','JEONG, YOUNGKWEN','','2011','DF','5','','12-10-1988','1','180','70');
INSERT INTO player VALUES ('2007301','������','K10','JEONG, 06GSOO','','2002','DF','36','','01-17-1985','2','180','74');
INSERT INTO player VALUES ('2007309','��â��','K10','KIM, CHANGYUP','','2007','DF','6','','11-19-1984','2','174','64');
INSERT INTO player VALUES ('2007299','��ö��','K10','01G, CHULWOO','���ֱ����','2010','DF','7','','01-04-1981','2','172','65');
INSERT INTO player VALUES ('2011116','�ݸ�','K10','O03 PAPA COLY','������Ÿ(Black Camel)','2011','DF','29','���װ�','05-20-1985','1','182','75');
INSERT INTO player VALUES ('2007313','ȫ��ö','K10','HONG, KWANGCHUL','','2007','DF','4','','09-10-1984','2','172','65');
INSERT INTO player VALUES ('2008461','������','K10','KANG, 06GHOON','','2008','MF','38','','02-20-1986','1','175','65');
INSERT INTO player VALUES ('2007306','������','K10','KONG, OHKYUN','CROW','2007','MF','22','','10-08-1984','2','177','72');
INSERT INTO player VALUES ('2012049','������','K10','JEONG, KOOKJIN','','2012','MF','16','','09-02-1988','1','172','62');
INSERT INTO player VALUES ('2011099','������','K10','JEONG, DONGSUN','','2011','MF','9','','03-15-1988','1','170','65');
INSERT INTO player VALUES ('2010109','�ְ��','K10','CHOI, KUNGGUY','','2010','MF','10','','10-03-1987','1','177','72');
INSERT INTO player VALUES ('2010111','�ֳ�ö','K10','CHOI, RAECHEOL','','2010','MF','24','','08-20-1987','1','177','71');
INSERT INTO player VALUES ('2012048','�輺��','K10','BAE, SUNGJAE','','2012','MF','28','','01-07-1989','1','178','74');
INSERT INTO player VALUES ('2012121','��','K10','','','','MF','25','','04-30-1989','1','174','69');
INSERT INTO player VALUES ('2012136','����','K10','','','','MF','26','','03-06-1990','1','169','70');
INSERT INTO player VALUES ('2010056','�����','K10','KIM, KWANWOO','SIRIUS','2010','MF','8','','02-25-1988','1','175','69');
INSERT INTO player VALUES ('2012050','�豤��','K10','KIM, KWANGJIN','','2012','MF','13','','05-27-1982','1','175','75');
INSERT INTO player VALUES ('2010113','����','K10','KIM, SANGKYU','','2010','MF','27','','05-09-1987','1','175','65');
INSERT INTO player VALUES ('2009151','�ӿ���','K10','LIM, YOUNGJOO','','2009','MF','23','','08-03-1986','2','176','68');
INSERT INTO player VALUES ('2011101','�ڿ���','K10','PARK, YOUNGHOON','','2011','MF','12','','01-05-1985','1','174','73');
INSERT INTO player VALUES ('2008178','������','K10','HAN, 06GKOOK','','2011','MF','19','','07-19-1981','1','179','71');
INSERT INTO player VALUES ('2012046','������','K10','JEONG, KWANGSUN','','2012','FW','32','','06-17-1993','1','175','68');
INSERT INTO player VALUES ('2007315','������','K10','JEONG, EUN06G','����(SHARP)','2007','FW','18','','08-04-1989','2','184','72');
INSERT INTO player VALUES ('2009152','������','K10','JEONG. CHANJOONG','','2009','FW','17','','06-06-1986','2','182','72');
INSERT INTO player VALUES ('2011032','�輮','K10','KIM, SEOK','','2012','FW','20','','01-02-1989','1','194','85');
INSERT INTO player VALUES ('2011100','Ź�ؼ�','K10','TAK, 06SUK','','2011','FW','11','','08-03-1988','1','178','69');
INSERT INTO player VALUES ('2000011','��ȣ��','K06','','','2010','DF','','','11-03-1971','1','172','77');
INSERT INTO player VALUES ('2000012','�ְ���','K06','','','','DF','','','05-01-1971','1','','');
INSERT INTO player VALUES ('2000013','������','K06','','','2010','DF','','','11-06-1975','1','180','88');
INSERT INTO player VALUES ('2000014','����ǥ','K06','','','2005','DF','','','08-01-1974','2','180','77');
INSERT INTO player VALUES ('2000015','������','K06','','','2005','DF','','','05-05-1978','2','180','75');
INSERT INTO player VALUES ('2000016','������','K06','','','2006','DF','','','03-05-1980','1','173','82');
INSERT INTO player VALUES ('2011052','������','K06','','�Ӳ���','2011','GK','41','','07-02-1988','2','186','78');
INSERT INTO player VALUES ('2012076','�����','K06','','','2012','GK','40','','11-10-1989','1','189','83');
INSERT INTO player VALUES ('2010108','������','K06','','','2010','GK','31','','02-11-1991','1','187','77');
INSERT INTO player VALUES ('2010059','������','K06','','��������','2010','GK','1','','10-06-1987','2','186','78');
INSERT INTO player VALUES ('2011053','������','K06','','��������','2011','DF','33','','02-25-1993','1','180','76');
INSERT INTO player VALUES ('2007185','����ö','K06','','','2005','DF','3','','07-11-1982','2','176','73');
INSERT INTO player VALUES ('2007193','������','K06','','','2005','DF','17','','03-07-1986','2','184','68');
INSERT INTO player VALUES ('2011055','����ȫ','K06','','���Ӹ�','2011','DF','2','','11-04-1988','1','178','70');
INSERT INTO player VALUES ('2011046','������','K06','','��������','2011','DF','34','','02-07-1988','1','183','79');
INSERT INTO player VALUES ('2010058','�����','K06','','������ ��','2010','DF','5','','11-03-1987','1','184','77');
INSERT INTO player VALUES ('2007123','���ӻ�','K04','','','','DF','20','','09-11-1981','1','183','80');
INSERT INTO player VALUES ('2007022','������','K04','','','','DF','36','','07-07-1982','1','181','72');
INSERT INTO player VALUES ('2012058','������','K04','','','','DF','35','','10-08-1993','1','184','76');
INSERT INTO player VALUES ('2009125','�̰ŷ�','K04','','','','DF','4','','10-06-1986','1','183','77');
INSERT INTO player VALUES ('2010001','������','K04','','','','DF','3','','07-10-1987','1','183','78');
INSERT INTO player VALUES ('2012134','�丣����','K04','','','','DF','44','','01-02-1988','1','178','74');
INSERT INTO player VALUES ('2000094','�蹫��','K03','KIM, MUGYUN','','','DF','','','05-03-1971','1','','');
INSERT INTO player VALUES ('2007001','������','K03','JEONG, BYUNGJI','','2011','GK','1','','08-04-1980','1','184','77');
INSERT INTO player VALUES ('2011069','����ȣ','K03','CHOI, JUHO','','2011','GK','51','','07-07-1992','1','185','75');
INSERT INTO player VALUES ('2007130','�����','K03','KIM, DAEHEE','','2010','GK','31','','04-04-1984','1','192','88');
INSERT INTO player VALUES ('2009133','����ȣ','K03','KIM, 06HO','','2009','GK','21','','03-04-1983','1','185','77');
INSERT INTO player VALUES ('2011065','���ι�','K03','HEO, INMOO','','2011','GK','41','','02-04-1988','1','187','81');
INSERT INTO player VALUES ('2011056','����','K03','KANG, YONG','','2011','DF','2','','07-01-1989','1','179','72');
INSERT INTO player VALUES ('2007080','����','K03','GO, BYUNGWOON','','2006','DF','16','','09-09-1983','1','180','73');
INSERT INTO player VALUES ('2012069','������','K03','JEONG, KWANGSUK','','2012','DF','39','','10-02-1993','1','183','72');
INSERT INTO player VALUES ('2007002','������','K03','JEONG, SANGHUN','','2006','DF','13','','08-06-1983','1','183','76');
INSERT INTO player VALUES ('2012062','������','K03','JEONG, SEOKWOO','','2012','DF','32','','06-05-1993','1','181','72');
INSERT INTO player VALUES ('2009139','������','K03','JEONG, EUNSEOK','','2009','DF','5','','10-03-1982','1','185','80');
INSERT INTO player VALUES ('2009030','�ֹμ�','K03','CHOI, MINSEO','','2009','DF','3','','11-08-1986','2','180','78');
INSERT INTO player VALUES ('2012064','������','K03','SUNG, JONGHUN','','2012','DF','34','','02-04-1989','1','178','74');
INSERT INTO player VALUES ('2008468','�κ�','K03','Jasenko Sabitovic','','2007','DF','4','','03-03-1983','1','185','78');
INSERT INTO player VALUES ('2007277','�����','K03','OH, MYUNGKWAN','','2008','DF','15','','04-04-1984','1','185','76');
INSERT INTO player VALUES ('2012063','�赿��','K03','KIM, DONGSIK','','2012','MF','33','','05-03-1989','1','183','77');
INSERT INTO player VALUES ('2012067','�����','K03','KIM, SOOKIL','','2012','DF','37','','09-04-1989','1','179','69');
INSERT INTO player VALUES ('2008444','��¿�','K03','KIM, SEUNGYUB','','2008','DF','12','','12-10-1985','1','180','74');
INSERT INTO player VALUES ('2007101','����ȭ','K03','','','','DF','25','','04-04-1984','1','182','76');
INSERT INTO player VALUES ('2007190','�ϼ���','K03','HA, SEOKJU','','2011','DF','17','','06-02-1978','1','174','71');
INSERT INTO player VALUES ('2010065','������','K03','HEO, JAE06G','','2010','DF','29','','02-06-1987','1','175','70');
INSERT INTO player VALUES ('2007096','ȫ��','K03','HONG, MYUNGBO','','2012','DF','20','','12-02-1979','1','181','72');
INSERT INTO player VALUES ('2008472','���Ⳳ','K03','JEONG, KINAM','','2010','MF','6','','07-01-1981','1','174','72');
INSERT INTO player VALUES ('2011059','�����','K03','JEONG, SANGROK','','2011','MF','14','','08-02-1989','1','173','63');
INSERT INTO player VALUES ('2011068','�����','K03','NA, HEEKEUN','','2011','FW','22','','05-05-1989','1','178','72');
INSERT INTO player VALUES ('2012133','����','K03','','','','MF','45','','09-10-1984','1','179','74');
INSERT INTO player VALUES ('2012124','�޵�','K03','Medvid Ivan','','2012','MF','44','','11-10-1987','1','180','78');
INSERT INTO player VALUES ('2012068','�ֱ濵','K03','CHOI, KILYOUNG','','2012','MF','38','','04-02-1990','1','172','64');
INSERT INTO player VALUES ('2008203','�ֻ���','K03','CHOI, SANGIN','','2005','DF','27','','10-03-1986','1','174','63');
INSERT INTO player VALUES ('2011131','����','K03','Josko Jelicic','','2012','MF','8','','05-01-1981','1','184','79');
INSERT INTO player VALUES ('2011061','������','K03','YOU, HYUNGOO','','2011','MF','26','','01-01-1993','1','170','68');
INSERT INTO player VALUES ('2009033','����','K03','KIM, KIBU','','2009','MF','18','','02-03-1986','2','183','76');
INSERT INTO player VALUES ('2012070','�����','K03','KIM, SANGIN','','2012','DF','40','','11-07-1989','1','178','70');
INSERT INTO player VALUES ('2011062','������','K03','KIM, 06GWOON','','2011','MF','19','','03-04-1988','1','178','70');
INSERT INTO player VALUES ('2012071','���߱�','K03','KIM, 06GJYU','','2012','MF','42','','06-06-1989','1','170','64');
INSERT INTO player VALUES ('2012066','��âȣ','K03','KIM, CHANGHO','','2012','MF','36','','04-03-1991','1','175','75');
INSERT INTO player VALUES ('2011063','������','K03','LEE, JONGBUM','','2011','MF','24','','05-03-1988','1','178','68');
INSERT INTO player VALUES ('2012061','���Ͱ�','K03','NAM, IKKYUNG','','2012','MF','30','','06-01-1993','1','177','70');
INSERT INTO player VALUES ('2011064','������','K03','YOON, BOYOUNG','','2011','FW','23','','07-04-1988','1','177','63');
INSERT INTO player VALUES ('2008443','�赿��','K03','KIM, DONGGOOK','','2008','FW','10','','08-04-1989','1','185','80');
INSERT INTO player VALUES ('2012060','������','K03','PARK, JONGWAN','','2012','DF','28','','05-08-1993','1','188','82');
INSERT INTO player VALUES ('2012059','��¡��','K03','Jorge Claudio','','2011','FW','7','�����','01-10-1985','1','174','70');
INSERT INTO player VALUES ('2010044','��ö��','K03','LEE, CHULWOO','','2010','FW','9','','09-11-1987','1','185','78');
INSERT INTO player VALUES ('2011057','�ڳ�','K03','Goram Petreski','','2010','FW','11','','10-05-1982','1','180','76');
INSERT INTO player VALUES ('2000095','���α�','K03','JEONG, MINJYU','','2012','MF','35','','11-09-1989','1','178','71');
INSERT INTO player VALUES ('2000062','������','K01','JAE, HYUNGJIN','','2012','DF','38','','12-06-1989','1','179','75');
INSERT INTO player VALUES ('2000063','������','K01','KWAK, KIHOON','','2012','FW','33','','05-11-1989','1','177','72');
INSERT INTO player VALUES ('2000064','�ֹο�','K01','CHOI, MINYOUNG','','2010','FW','37','','07-03-1991','1','174','67');
INSERT INTO player VALUES ('2000071','��ȸ��','K07','','','','DF','','','11-10-1976','1','','');
INSERT INTO player VALUES ('2000072','������','K07','','','','DF','','','01-10-1979','1','','');
INSERT INTO player VALUES ('2000073','����ȣ','K07','','','','DF','','','05-10-1974','1','','');
INSERT INTO player VALUES ('2000074','��ö��','K07','','','','DF','','','02-09-1975','1','','');
INSERT INTO player VALUES ('2012081','������','K07','','','','GK','41','','03-06-1993','1','185','80');
INSERT INTO player VALUES ('2007227','������','K07','','','','GK','1','','02-10-1980','1','185','76');
INSERT INTO player VALUES ('2012088','������','K07','','','','GK','31','','06-09-1993','1','189','83');
INSERT INTO player VALUES ('2012089','������','K07','','','','GK','33','','12-11-1989','1','185','81');
INSERT INTO player VALUES ('2008212','��ö','K07','','','','DF','3','','02-11-1981','1','178','72');
INSERT INTO player VALUES ('2012077','������','K07','','','','DF','37','','03-05-1989','1','180','73');
INSERT INTO player VALUES ('2012083','����ȣ','K07','','','','DF','39','','09-06-1993','1','184','79');
INSERT INTO player VALUES ('2007213','���¿�','K07','','','','DF','7','','08-11-1980','1','180','74');
INSERT INTO player VALUES ('2007209','������','K07','','','','DF','21','','04-02-1983','1','176','74');
INSERT INTO player VALUES ('2012084','������','K07','','','','DF','42','','05-06-1989','1','','');
INSERT INTO player VALUES ('2012085','��ȫö','K07','','','','DF','36','','02-06-1989','1','181','69');
INSERT INTO player VALUES ('2008359','���ÿ�','K07','','','','DF','24','','05-03-1982','1','177','70');
INSERT INTO player VALUES ('2011034','��â��','K07','','','','DF','5','','10-07-1985','1','183','75');
INSERT INTO player VALUES ('2012090','�����','K07','','','','DF','34','','06-08-1993','1','184','82');
INSERT INTO player VALUES ('2008425','�ֿ�ȣ','K07','','','','DF','6','','07-10-1985','1','185','80');
INSERT INTO player VALUES ('2012092','ȫ����','K07','','','','DF','28','','08-05-1989','1','184','78');
INSERT INTO player VALUES ('2009115','������','K07','','','','MF','49','','09-08-1990','1','170','65');
INSERT INTO player VALUES ('2011035','�����','K07','','','','MF','12','','10-08-1988','1','178','72');
INSERT INTO player VALUES ('2010030','������','K07','','','','MF','4','','11-03-1987','1','182','76');
INSERT INTO player VALUES ('2010032','�����','K07','','','','MF','18','','02-04-1988','1','182','73');
INSERT INTO player VALUES ('2007210','������','K07','','','','MF','10','','02-03-1982','2','181','69');
INSERT INTO player VALUES ('2012078','������','K07','','','','MF','38','','06-05-1993','1','174','64');
INSERT INTO player VALUES ('2007102','�����','K07','','','','MF','2','','12-04-1984','1','177','73');
INSERT INTO player VALUES ('2012079','������','K07','','','','MF','44','','01-01-1989','1','178','68');
INSERT INTO player VALUES ('2012080','������','K07','','','','MF','26','','02-08-1989','1','181','71');
INSERT INTO player VALUES ('2012082','����ȯ','K07','','','','MF','25','','03-05-1987','1','170','62');
INSERT INTO player VALUES ('2009100','������','K07','','','','MF','13','','09-06-1986','2','172','65');
INSERT INTO player VALUES ('2008428','������','K07','','','','MF','11','','10-07-1983','1','173','68');
INSERT INTO player VALUES ('2012086','�뺴��','K07','','','','MF','22','','04-09-1989','1','177','67');
INSERT INTO player VALUES ('2012087','������','K07','','','','MF','43','','11-04-1989','1','176','69');
INSERT INTO player VALUES ('2007305','������','K07','','','','MF','9','','05-09-1984','1','176','75');
INSERT INTO player VALUES ('2012132','�ǹ�','K07','','','','MF','45','','06-06-1987','1','173','67');
INSERT INTO player VALUES ('2010031','���뱸','K07','','','','MF','15','','08-08-1987','1','168','60');
INSERT INTO player VALUES ('2011127','���','K07','','','','MF','14','','07-10-1984','1','174','69');
INSERT INTO player VALUES ('2011038','�迵��','K07','','','','MF','30','','08-07-1988','1','175','65');
INSERT INTO player VALUES ('2008423','�Ӱ���','K07','','','','MF','29','','09-07-1985','1','172','68');
INSERT INTO player VALUES ('2011036','����ȣ','K07','','','','MF','23','','06-04-1988','1','176','71');
INSERT INTO player VALUES ('2011039','�ϱ���','K07','','','','MF','32','','10-03-1992','1','180','65');
INSERT INTO player VALUES ('2010003','����ö','K07','','','','FW','20','','10-08-1987','1','183','78');
INSERT INTO player VALUES ('2010154','������','K07','','','','FW','16','','11-08-1984','1','172','70');
INSERT INTO player VALUES ('2007214','���','K07','','','','FW','8','','12-12-1980','1','175','74');
INSERT INTO player VALUES ('2009149','���Ѽ�','K07','','','','FW','40','','10-03-1986','2','177','69');
INSERT INTO player VALUES ('2009161','���ڸ�','K07','','','','FW','17','','09-12-1983','1','180','78');
INSERT INTO player VALUES ('2012032','����ȣ','K07','','','','FW','27','','01-04-1987','1','177','75');
INSERT INTO player VALUES ('2011120','����','K07','','','','FW','27','','02-01-1985','1','180','67');
INSERT INTO player VALUES ('2010037','�ϼ���','K07','','','','FW','35','','03-02-1992','1','179','68');
INSERT INTO player VALUES ('2012091','ȫ��ǥ','K07','','','','FW','19','','03-10-1989','1','182','73');
INSERT INTO player VALUES ('2000081','����ȯ','K05','','','','DF','','','04-05-1971','1','','');
INSERT INTO player VALUES ('2000082','����ö','K05','','','','DF','','','05-05-1978','1','','');
INSERT INTO player VALUES ('2000083','�����','K05','','','','DF','','','06-04-1979','1','','');
INSERT INTO player VALUES ('2000084','�ֵ���','K05','','','','DF','','','03-11-1980','1','','');
INSERT INTO player VALUES ('2000085','����','K05','','','','DF','','','07-03-1979','1','','');
INSERT INTO player VALUES ('2000086','�ڰ�ġ','K05','','','','DF','','','06-01-1979','1','','');
INSERT INTO player VALUES ('2007106','���̼�','K05','JEONG, ISUB','�賲','2012','GK','45','','06-04-1984','1','185','78');
INSERT INTO player VALUES ('2012007','�ְ���','K05','CHOI, KWANMIN','','2012','GK','31','','08-05-1989','1','188','85');
INSERT INTO player VALUES ('2008179','�ֵ���','K05','','','','GK','60','','03-11-1980','1','187','78');
INSERT INTO player VALUES ('2008138','����','K05','KIM, YONGBAL','','2004','GK','18','','09-03-1983','1','183','77');
INSERT INTO player VALUES ('2012006','��â��','K05','KIM, CHANGMIN','����','2012','GK','1','','10-01-1990','1','191','87');
INSERT INTO player VALUES ('2010010','�����','K05','JEONG, DAEKEON','','2010','DF','26','','11-04-1987','1','183','78');
INSERT INTO player VALUES ('2007159','������','K05','JEONG, BONGHYUN','','2005','MF','23','','07-07-1984','1','188','74');
INSERT INTO player VALUES ('2012009','��â��','K05','JEONG, CHANGMIN','�߻���','2012','DF','36','','12-09-1989','1','181','68');
INSERT INTO player VALUES ('2012005','�ֵ���','K05','CHOI, DONGHYUK','��ȣ','2012','DF','23','','01-04-1989','1','185','78');
INSERT INTO player VALUES ('2012012','���μ�','K05','BAEK, INSEOK','����','2012','MF','40','','08-08-1989','1','179','72');
INSERT INTO player VALUES ('2008391','������','K05','SEO, HYUKSU','�˵�','2008','DF','6','','01-10-1983','1','178','77');
INSERT INTO player VALUES ('2012004','�ȱ�ȣ','K05','AN, KWANGHO','�ձ�','2012','DF','15','','10-01-1989','1','190','78');
INSERT INTO player VALUES ('2009076','������','K05','LIM, HONGHUN','����','2009','DF','31','','02-06-1986','1','182','74');
INSERT INTO player VALUES ('2007148','����ö','K05','LEE, JINCHEUL','','2006','DF','4','','03-03-1981','1','187','75');
INSERT INTO player VALUES ('2009061','������','K05','HAN, JONGSUNG','','2009','DF','13','','04-01-1987','1','177','70');
INSERT INTO player VALUES ('2009160','ȣ������','K05','Rogerio Prateat','���»���','2009','DF','3','','09-03-1983','1','185','85');
INSERT INTO player VALUES ('2007031','Ȳ����','K05','','','','DF','98','','09-05-1982','1','176','68');
INSERT INTO player VALUES ('2010023','�����','K05','KO, KWANYOUNG','���','2010','MF','32','','07-12-1991','1','180','72');
INSERT INTO player VALUES ('2007155','���淮','K05','JEONG, KYUNGRYANG','','2006','MF','19','','05-12-1983','1','173','65');
INSERT INTO player VALUES ('2010025','������','K05','','','','MF','35','','09-03-1991','1','176','63');
INSERT INTO player VALUES ('2012001','��������','K05','Leo03 Leiria','����','2012','MF','5','','06-06-1981','1','183','77');
INSERT INTO player VALUES ('2008269','�����','K05','MYUNG, JAEYOENG','','2007','MF','7','','07-02-1983','2','173','63');
INSERT INTO player VALUES ('2007149','���缷','K05','BYUN, JAESUB','������ũ','2007','MF','11','','08-09-1985','2','170','63');
INSERT INTO player VALUES ('2012002','����','K05','Raphael JoseBotti Zacarias Sena','Botti','2012','MF','10','','09-02-1991','1','174','68');
INSERT INTO player VALUES ('2011123','�񿡶�','K05','Vieira','','2011','MF','21','','10-02-1984','1','176','73');
INSERT INTO player VALUES ('2008460','������','K05','SEO, DONGWON','','2008','MF','22','','11-08-1985','1','184','78');
INSERT INTO player VALUES ('2010019','�ȴ���','K05','AN, DAEHYUN','','2010','MF','25','','12-08-1987','1','179','72');
INSERT INTO player VALUES ('2010018','������','K05','YANG, HYUN06G','','2010','MF','14','','01-07-1987','1','176','72');
INSERT INTO player VALUES ('2010022','������','K05','YOU, WONSUOB','�Ӹ�','2010','MF','37','','02-05-1991','1','180','77');
INSERT INTO player VALUES ('2012008','���ö','K05','KIM, SUCHEUL','','2012','MF','34','','03-05-1989','1','171','68');
INSERT INTO player VALUES ('2012013','�Ӵ���','K05','LIM, DAHAN','�޸�','2012','DF','39','','04-07-1989','1','181','67');
INSERT INTO player VALUES ('2007087','������','K05','JEON, KYOUNGJOON','','2001','MF','16','','10-09-1983','1','178','68');
INSERT INTO player VALUES ('2010021','�̿���','K05','LEE, YOUNGHOON','����','2010','MF','27','','05-03-1991','1','178','71');
INSERT INTO player VALUES ('2011028','�߿��','K05','CHOO, WOONKI','�ھ˶�','2011','MF','17','','03-04-1988','1','173','69');
INSERT INTO player VALUES ('2008393','����ö','K05','HA, EUNCHEUL','','2008','MF','29','','06-06-1985','1','176','69');
INSERT INTO player VALUES ('2011030','��α�','K05','GO, MINGI','','2011','FW','24','','01-07-1988','1','178','70');
INSERT INTO player VALUES ('2008143','������','K05','JEONG, DOHOON','���ݱ�','2005','FW','9','','07-07-1980','1','182','77');
INSERT INTO player VALUES ('2012011','������','K05','JEONG, YEONGUN','','2012','FW','44','','12-03-1991','1','188','77');
INSERT INTO player VALUES ('2011002','������','K05','JEONG, HYUNKI','','2011','FW','28','','08-03-1992','1','190','82');
INSERT INTO player VALUES ('2011003','���õ�','K05','NAM, KUNGDO','','2011','FW','33','','04-06-1992','1','186','80');
INSERT INTO player VALUES ('2010101','������','K05','MOON, TAEHYUK','','2012','FW','41','','09-03-1993','1','178','74');
INSERT INTO player VALUES ('2008392','�ּ���','K05','CHOI, SUNGBAE','����','2008','FW','8','','10-11-1985','2','181','76');
INSERT INTO player VALUES ('2012125','����м�','K05','Edmilson','EDY','2012','FW','20','','11-05-1978','1','184','79');
INSERT INTO player VALUES ('2012003','��Ű','K05','','','','FW','99','','12-04-1981','1','170','76');
INSERT INTO player VALUES ('2000087','������','K05','JEONG, EUNIK','','2010','FW','35','','09-03-1991','1','176','65');
INSERT INTO player VALUES ('2000091','�̼�ȣ','K03','LEE, SOONHO','','','DF','','','10-01-1972','1','','');
INSERT INTO player VALUES ('2000092','������','K03','YOU, DONGKWAN','','','DF','','','12-05-1973','1','','');
INSERT INTO player VALUES ('2000093','�ڱ⵿','K03','PARK, GIDONG','','','DF','','','01-05-1971','1','','');
INSERT INTO player VALUES ('2011111','����ں�','K02','','','','MF','47','','08-02-1985','1','185','78');
INSERT INTO player VALUES ('2012020','�輱��','K02','KIM, SUNWOO','','','FW','33','','01-04-1988','1','174','68');
INSERT INTO player VALUES ('2011074','�迩��','K02','KIM, YEOSUNG','','','MF','36','','05-01-1993','1','179','63');
INSERT INTO player VALUES ('2007064','����','K02','KIM, YONGWOO','','','FW','27','','02-07-1987','1','175','70');
INSERT INTO player VALUES ('2012019','������','K02','KIM, JONGMIN','','','MF','30','','01-09-1993','1','174','65');
INSERT INTO player VALUES ('2008437','�ڿ���','K02','PARK, YONGHOON','','','MF','9','','11-03-1989','1','175','67');
INSERT INTO player VALUES ('2008436','�踸��','K02','KIM, MANKEUN','','','FW','34','','03-11-1987','1','177','67');
INSERT INTO player VALUES ('2007070','�����','K02','KIM, JAEMIN','','','MF','35','','04-05-1988','1','180','71');
INSERT INTO player VALUES ('2007043','������','K02','KIM, HYUNDOO','','','MF','12','','05-11-1983','1','176','68');
INSERT INTO player VALUES ('2012017','�̼���','K02','LEE, SUNGYONG','','','DF','20','','06-12-1985','1','173','70');
INSERT INTO player VALUES ('2012018','���±�','K02','HA, TAEKEUN','','','MF','29','','01-07-1993','1','182','75');
INSERT INTO player VALUES ('2012122','��Ʈ��','K02','Mitrovic Slavisa','','','FW','19','�����Ͼ�','05-07-1987','1','192','89');
INSERT INTO player VALUES ('2007048','�ְ���','K02','CHOI, KUNHA','','','FW','18','','07-07-1981','1','180','75');
INSERT INTO player VALUES ('2010168','����','K02','Sandro Cardoso Dos Santos','','','FW','13','�����','08-03-1990','1','182','78');
INSERT INTO player VALUES ('2012023','��ȭ��','K02','YOON, HWAPYUNG','','','FW','42','','09-03-1993','1','182','74');
INSERT INTO player VALUES ('2012022','�����','K02','KIM, KWANHEE','','','FW','39','','10-06-1993','1','180','70');
INSERT INTO player VALUES ('2000051','�豤��','K09','','','','DF','','','11-03-1974','1','','');
INSERT INTO player VALUES ('2000052','���Ἦ','K09','','','','DF','','','03-02-1979','1','','');
INSERT INTO player VALUES ('2000053','������','K09','','','','DF','','','12-03-1979','1','','');
INSERT INTO player VALUES ('2000054','�迵��','K09','','','','DF','','','01-10-1973','1','','');
INSERT INTO player VALUES ('2000055','����ȭ','K09','','','','DF','','','02-03-1980','1','','');
INSERT INTO player VALUES ('2012094','�ֵ���','K09','','','','GK','1','','03-05-1991','1','190','89');
INSERT INTO player VALUES ('2010125','���ö','K09','','','','GK','21','','03-07-1987','1','185','78');
INSERT INTO player VALUES ('2007236','���Ǽ�','K09','','','','GK','44','','12-01-1970','1','192','87');
INSERT INTO player VALUES ('2011018','���½�','K09','','','','GK','31','','08-01-1993','1','185','75');
INSERT INTO player VALUES ('2010117','������','K09','','','','DF','4','','04-01-1991','1','182','74');
INSERT INTO player VALUES ('2008414','������','K09','','','','DF','19','','05-04-1984','1','178','75');
INSERT INTO player VALUES ('2012093','��ġ��','K09','','','','DF','17','','06-07-1993','1','183','76');
INSERT INTO player VALUES ('2012095','�ֿ��','K09','','','','DF','5','','03-12-1990','1','183','75');
INSERT INTO player VALUES ('2010119','�ֿ�ȣ','K09','','','','DF','14','','06-03-1991','1','182','69');
INSERT INTO player VALUES ('2007068','������','K09','','','','DF','6','','07-04-1987','1','182','78');
INSERT INTO player VALUES ('2007266','������','K09','','','','DF','45','','08-03-1982','1','175','70');
INSERT INTO player VALUES ('2011012','�ȼ���','K09','','','','MF','2','','11-09-1992','1','176','63');
INSERT INTO player VALUES ('2008420','�����','K09','','','','DF','25','','11-10-1985','2','185','80');
INSERT INTO player VALUES ('2012102','�ڼ�ȣ','K09','','','','DF','34','','07-04-1996','1','184','71');
INSERT INTO player VALUES ('2007225','������','K09','','','','DF','3','','09-04-1984','1','185','79');
INSERT INTO player VALUES ('2009048','������','K09','','','','MF','40','','10-05-1986','1','168','68');
INSERT INTO player VALUES ('2011072','���μ�','K09','','','','MF','24','','11-05-1992','1','175','64');
INSERT INTO player VALUES ('2011008','������','K09','','','','MF','41','','12-05-1992','1','180','70');
INSERT INTO player VALUES ('2012096','������','K09','','','','MF','37','','01-03-1993','1','172','65');
INSERT INTO player VALUES ('2010049','�ȵ巹','K09','','','','MF','18','�����','02-11-1982','1','172','69');
INSERT INTO player VALUES ('2012097','�Ȼ���','K09','','','','MF','33','','05-03-1996','1','176','67');
INSERT INTO player VALUES ('2012098','������','K09','','','','MF','39','','03-08-1989','1','176','70');
INSERT INTO player VALUES ('2007133','�����','K09','','','','MF','43','','04-08-1983','2','175','67');
INSERT INTO player VALUES ('2010048','�迵ǥ','K09','','','','MF','12','','05-25-1987','1','176','66');
INSERT INTO player VALUES ('2012100','���ر�','K09','','','','MF','36','','06-04-1992','1','183','74');
INSERT INTO player VALUES ('2012101','������','K09','','','','MF','42','','07-11-1994','1','183','68');
INSERT INTO player VALUES ('2008413','�ڱ���','K09','','','','FW','23','','08-01-1986','1','180','70');
INSERT INTO player VALUES ('2009051','��â��','K09','','','','MF','27','','10-08-1993','2','170','63');
INSERT INTO player VALUES ('2010118','�̿���','K09','','','','MF','13','','08-11-1991','1','173','65');
INSERT INTO player VALUES ('2010120','����ä','K09','','','','FW','15','','09-04-1991','1','180','72');
INSERT INTO player VALUES ('2009046','������','K09','','','','MF','8','','10-09-1986','2','178','72');
INSERT INTO player VALUES ('2012119','�ѵ�','K09','','','','FW','99','�����','11-06-1984','1','187','84');
INSERT INTO player VALUES ('2012105','������','K09','','','','FW','11','�����','03-12-1986','1','175','77');
INSERT INTO player VALUES ('2011005','�ּ�ȣ','K09','','','','FW','30','','12-07-1992','1','187','73');
INSERT INTO player VALUES ('2011108','����ȭ','K09','','','','MF','16','','01-06-1988','1','175','67');
INSERT INTO player VALUES ('2009047','����ȯ','K09','','','','FW','20','','02-01-1987','1','178','70');
INSERT INTO player VALUES ('2009005','������','K09','','','','FW','28','','03-08-1986','2','181','73');
INSERT INTO player VALUES ('2012099','������','K09','','','','FW','7','','08-01-1990','1','184','74');
INSERT INTO player VALUES ('2012103','�����','K09','','','','FW','22','','04-08-1995','1','183','68');
INSERT INTO player VALUES ('2009044','������','K09','','','','MF','26','','01-03-1984','2','180','78');
INSERT INTO player VALUES ('2010053','���¿�','K09','','','','FW','9','','05-03-1991','1','173','66');
INSERT INTO player VALUES ('2012104','�ѵ���','K09','','','','FW','32','','06-04-1996','1','174','61');
INSERT INTO player VALUES ('2011004','����ȭ','K09','','','','FW','29','','06-10-1992','1','173','63');
INSERT INTO player VALUES ('2010164','��ī����','K09','','','','MF','10','�����','08-06-1986','1','189','71');
INSERT INTO player VALUES ('2011082','������','K01','KWON, 06GHYUK','','2011','GK','1','','02-08-1988','1','195','80');
INSERT INTO player VALUES ('2009070','��â��','K01','CHOI, CHANGZOO','','2009','GK','40','','07-09-1982','1','187','86');
INSERT INTO player VALUES ('2007020','������','K01','SEO, DONGMYUNG','','2012','GK','21','','04-05-1984','1','196','94');
INSERT INTO player VALUES ('2008410','������','K01','YANG, JIWON','','2008','GK','45','','08-04-1984','1','181','75');
INSERT INTO player VALUES ('2012039','�̹���','K01','LEE, MOOLIM','','2012','GK','31','','09-04-1989','1','185','79');
INSERT INTO player VALUES ('2012034','������','K01','JEONG, YOONGOO','','2012','DF','20','','01-09-1989','1','182','75');
INSERT INTO player VALUES ('2011106','��������','K01','Cleber Arild','','2011','DF','3','�����','10-01-1979','1','186','79');
INSERT INTO player VALUES ('2011080','�ְ��','K01','CHOI, GYUNGSAM','','2011','DF','25','','06-06-1988','1','188','74');
INSERT INTO player VALUES ('2007004','������','K01','CHOI, JONGWOOK','','2007','DF','29','','11-01-1985','1','185','74');
INSERT INTO player VALUES ('2012035','����ȯ','K01','BYUN, SUNGHWAN','','2012','DF','23','','11-12-1989','1','176','69');
INSERT INTO player VALUES ('2008366','�ջ�ȣ','K01','SON, SANGHO','','2007','DF','28','','04-05-1984','1','187','78');
INSERT INTO player VALUES ('2012044','������','K01','YOU, JAEHYUNG','','2012','DF','39','','12-08-1987','1','180','79');
INSERT INTO player VALUES ('2011077','�輼��','K01','KIM, SAEKWON','','2011','DF','4','','01-06-1988','1','184','80');
INSERT INTO player VALUES ('2009069','�ϼ���','K01','HA, SUNGYONG','','2009','DF','43','','05-10-1986','1','179','75');
INSERT INTO player VALUES ('2010082','������','K01','HAN, JEUNGIL','','2010','DF','41','','03-03-1987','1','172','65');
INSERT INTO player VALUES ('2010054','������','K01','JEONG, KUNHYUNG','','2010','MF','17','','11-09-1989','1','176','70');
INSERT INTO player VALUES ('2009058','������','K01','JEONG, DOKYUN','','2009','MF','6','','02-01-1987','1','184','78');
INSERT INTO player VALUES ('2011083','�ֱ��','K01','CHOI, KIWOOK','','2011','MF','18','','03-12-1988','1','175','68');
INSERT INTO player VALUES ('2012028','������','K01','CHOI, JINSUP','','2012','MF','2','','11-03-1987','1','179','68');
INSERT INTO player VALUES ('2011079','������','K01','SEO, DOUKGUY','','2011','DF','5','','04-10-1988','1','182','72');
INSERT INTO player VALUES ('2012130','����','K01','Edmilson Alves','','2012','MF','7','�����','05-02-1986','1','182','70');
INSERT INTO player VALUES ('2009055','����','K01','KIM, KILYONG','','2009','MF','22','','06-03-1986','2','183','78');
INSERT INTO player VALUES ('2012036','������','K01','KIM, YOONSUB','','2012','MF','26','','07-07-1989','1','184','77');
INSERT INTO player VALUES ('2012029','��õ��','K01','KIM, CHUNSU','','2012','MF','9','','09-07-1991','1','174','65');
INSERT INTO player VALUES ('2012033','�强��','K01','01G, SUNGWOOK','','2012','MF','19','','01-09-1989','1','174','71');
INSERT INTO player VALUES ('2007023','��ö��','K01','01G, CHULMIN','','2007','MF','24','','08-05-1982','1','179','76');
INSERT INTO player VALUES ('2011084','����ö','K01','JEON, KWANGCHEOL','','2011','MF','34','','09-07-1992','1','186','74');
INSERT INTO player VALUES ('2012045','�����','K01','JEON, JAEWOON','','2012','MF','42','','05-06-1991','1','177','67');
INSERT INTO player VALUES ('2007008','������','K01','PARK, JEONGSOO','','2003','MF','8','','10-11-1979','1','170','61');
INSERT INTO player VALUES ('2012042','���ֿ�','K01','PARK, HUYOUNG','','2012','MF','36','','03-05-1989','1','172','65');
INSERT INTO player VALUES ('2012040','�����','K01','KIM, WONHEE','','2012','MF','32','','11-04-1993','1','178','71');
INSERT INTO player VALUES ('2012041','������','K01','','','','FW','33','','05-11-1989','1','177','72');
INSERT INTO player VALUES ('2007010','������','K01','JEONG, HYUNSEOK','','2011','FW','16','','05-05-1977','1','178','70');
INSERT INTO player VALUES ('2011105','�����ڽ�','K01','03cos Antonio','','2011','FW','44','�����','07-04-1987','1','170','73');
INSERT INTO player VALUES ('2010045','�ֱԼ�','K01','CHOI, GYUSUN','','2010','FW','15','','12-09-1991','1','182','66');
INSERT INTO player VALUES ('2012129','�˸���','K01','Alison Barros Moraes','','','FW','14','�����','01-06-1992','1','171','60');
INSERT INTO player VALUES ('2012038','������','K01','KIM, TAEYOO','','2012','FW','30','','01-10-1989','1','175','64');
INSERT INTO player VALUES ('2012030','�ڼ���','K01','','','','FW','10','','04-07-1989','1','187','83');
INSERT INTO player VALUES ('2012037','���μ�','K01','LEE, INSUK','','2012','FW','27','','07-08-1989','1','181','74');
INSERT INTO player VALUES ('2011104','�Ŀ︵��','K01','03cos Paulo Paulrini','','2011','FW','11','�����','04-03-1987','1','174','75');
INSERT INTO player VALUES ('2012031','������','K01','HYUN, YOUNGMIN','','2012','FW','13','','02-12-1989','1','179','73');
INSERT INTO player VALUES ('2000061','ȫ�α�','K01','HONG, INKI','','2008','DF','35','','03-03-1989','1','182','75');
INSERT INTO player VALUES ('2007114','���⵿','K04','','','','MF','6','','12-01-1981','1','171','66');
INSERT INTO player VALUES ('2010005','������','K04','','','','MF','19','','10-07-1987','1','173','64');
INSERT INTO player VALUES ('2012055','������','K04','','','','MF','32','','01-04-1989','1','176','68');
INSERT INTO player VALUES ('2007122','������','K04','','','','MF','14','','11-07-1984','1','185','74');
INSERT INTO player VALUES ('2007137','������','K04','','','','MF','29','','04-08-1984','1','177','69');
INSERT INTO player VALUES ('2012131','����Ÿ��','K04','','','','MF','77','','08-01-1985','1','180','73');
INSERT INTO player VALUES ('2012056','������','K04','','','','MF','33','','05-06-1989','1','177','73');
INSERT INTO player VALUES ('2010004','����ȣ','K04','','','','MF','22','','07-07-1987','1','183','71');
INSERT INTO player VALUES ('2007125','������','K04','','','','MF','17','','06-02-1983','1','173','66');
INSERT INTO player VALUES ('2011103','���ȣ','K04','','','','MF','39','','07-02-1993','1','174','66');
INSERT INTO player VALUES ('2008209','�̹���','K04','','','','MF','10','','08-10-1981','1','173','66');
INSERT INTO player VALUES ('2008457','�����','K04','GWAK, JYUNGKEUN','����','2008','FW','9','','10-10-1982','1','184','81');
INSERT INTO player VALUES ('2012120','�ٺ�','K04','Chelck Ou03 Dabo','','2012','FW','63','','','1','183','76');
INSERT INTO player VALUES ('2007126','�ּ�ö','K04','CHOI, SUNGCHUL','�ڹ̵��','2007','FW','28','','09-03-1985','1','190','78');
INSERT INTO player VALUES ('2007153','��Ż��','K04','VITALIY','','2012','FW','24','','04-05-1979','1','183','74');
INSERT INTO player VALUES ('2009026','�Ƚ���','K04','AN, SEUNGIN','�Ȼ�','2009','FW','13','','10-03-1983','1','182','75');
INSERT INTO player VALUES ('2011019','����ö','K04','','','','FW','8','','06-01-1989','1','184','75');
INSERT INTO player VALUES ('2009027','�輺��','K04','KIM, SUNGJAE','��ġ,����','2009','FW','11','','11-05-1986','1','178','67');
INSERT INTO player VALUES ('2007135','�����','K04','KIM, WONSHIK','��, �����','2006','FW','27','','12-05-1983','1','172','64');
INSERT INTO player VALUES ('2012057','������','K04','KIM, JONGMIN','','2012','FW','34','','01-08-1993','1','184','77');
INSERT INTO player VALUES ('2011020','���ʼ�','K04','PARK, PILSUK','���','2011','FW','18','','01-07-1988','1','190','83');
INSERT INTO player VALUES ('2010084','������','K04','JEFF JI YOUNG','','2011','FW','16','�̱�','02-10-1988','1','184','76');
INSERT INTO player VALUES ('2000026','�Ѷ�','K04','','','2010','FW','','�����ƴϾ�','','','184','81');
INSERT INTO player VALUES ('2000027','������ƾ','K04','Selahattin','','2012','FW','11','��Ż����','','','180','75');
INSERT INTO player VALUES ('2000031','���溹','K08','','','2008','DF','','','10-01-1977','1','','');
INSERT INTO player VALUES ('2000032','���й�','K08','','','','','','','','','','');
INSERT INTO player VALUES ('2000033','���ͼ�','K08','','','','','','','','','','');
INSERT INTO player VALUES ('2000034','����','K08','','','','','','','','','','');
INSERT INTO player VALUES ('2009045','������','K08','KWON, CHANSOO','','','GK','21','','03-05-1984','2','183','77');
INSERT INTO player VALUES ('2012107','�����','K08','JEONG, KYOUNGDOO','','','GK','41','','','1','194','76');
INSERT INTO player VALUES ('2007255','���ؿ�','K08','JEONG, HAEWOON','','','GK','1','','04-12-1983','2','185','79');
INSERT INTO player VALUES ('2009101','�翵��','K08','YANG, YOUNGMIN','','','GK','31','','05-07-1984','1','190','80');
INSERT INTO player VALUES ('2011087','���̸���','K08','KAIMOTO KOJIRO','','','DF','3','','06-10-1987','1','182','77');
INSERT INTO player VALUES ('2012108','���ο�','K08','JEONG, DOYOUNG','','','DF','30','','07-10-1990','1','181','75');
INSERT INTO player VALUES ('2012118','������','K08','JEONG, MYONGHWI','','','DF','37','','08-05-1991','1','185','76');
INSERT INTO player VALUES ('2007329','����ö','K08','JEONG, YOUNGCHUL','','','DF','5','','07-06-1986','1','183','80');
INSERT INTO player VALUES ('2007259','������','K08','JEONG, 06GJAE','','','DF','13','','08-05-1984','2','184','80');
INSERT INTO player VALUES ('2007186','������','K08','JEONG, HYUNSOO','','','DF','15','','09-03-1983','2','186','80');
INSERT INTO player VALUES ('2007089','���°�','K08','NO, TAEKYOUNG','','','DF','25','','10-04-1982','1','175','68');
INSERT INTO player VALUES ('2009098','������','K08','MOON, SAMJIN','','','DF','2','','03-03-1983','1','173','68');
INSERT INTO player VALUES ('2012111','�ΰ���','K08','MIN, KYUNGIN','','','DF','12','','09-05-1989','1','177','71');
INSERT INTO player VALUES ('2011091','������','K08','CHOI, JONGNAM','','','DF','34','','11-11-1986','1','182','76');
INSERT INTO player VALUES ('2007055','�����','K08','CHOI, CHOONGKYUN','','','DF','20','','12-06-1983','1','184','70');
INSERT INTO player VALUES ('2010034','������','K08','BAE, JINSOO','','','DF','38','','01-01-1986','1','178','72');
INSERT INTO player VALUES ('2008471','�迵��','K08','KIM, YOUNGJIN','','','DF','23','','02-03-1982','2','180','75');
INSERT INTO player VALUES ('2008399','�ӱԽ�','K08','LIM, KYUSIK','','','DF','27','','09-05-1985','1','182','75');
INSERT INTO player VALUES ('2012106','��ġ��','K08','KWAK, CHIGOOG','','','MF','32','','03-04-1989','1','170','68');
INSERT INTO player VALUES ('2009095','�����','K08','JEONG, SANGSIK','','','MF','4','','04-12-1986','1','184','71');
INSERT INTO player VALUES ('2011086','������','K08','JEONG, YONGHEE','','','MF','18','','05-10-1988','1','178','70');
INSERT INTO player VALUES ('2012109','��Կ�','K08','','','','MF','33','','06-04-1988','1','180','83');
INSERT INTO player VALUES ('2010126','�ְ���','K08','CHOI, KANGJO','','','MF','6','','07-01-1990','1','165','57');
INSERT INTO player VALUES ('2008171','�ֳ���','K08','CHOI, NAMRYUL','','','MF','8','','07-05-1980','2','178','70');
INSERT INTO player VALUES ('2011088','�鿵ö','K08','BAEK, YOUNGCHUL','','','MF','22','','11-11-1988','1','177','71');
INSERT INTO player VALUES ('2007242','���¿�','K08','CHO, TAEYONG','','','MF','7','','11-10-1980','1','174','67');
INSERT INTO player VALUES ('2012117','�ø���','K08','Alcir de Oliveira fonseca','','','MF','29','�����','08-11-1987','1','175','73');
INSERT INTO player VALUES ('2011128','�踮��','K08','Ricardo Irineu','','','MF','26','�����','12-07-1987','1','172','69');
INSERT INTO player VALUES ('2012128','�𽺹�','K08','Jasmin Mujidza','','','MF','33','ũ�ξ�Ƽ��','02-03-1984','1','180','78');
INSERT INTO player VALUES ('2012114','����ȣ','K08','CHUN, JAEHO','','','MF','14','','08-08-1989','1','168','64');
INSERT INTO player VALUES ('2008131','����ȣ','K08','KIM, JINHO','','','MF','11','','02-08-1983','1','174','68');
INSERT INTO player VALUES ('2012115','�̳���','K08','LEE, NAKHOON','','','MF','35','','09-12-1989','1','172','62');
INSERT INTO player VALUES ('2007100','ȫ��ǥ','K08','HONG, DOPYO','','','MF','9','','10-07-1983','1','173','66');
INSERT INTO player VALUES ('2010127','������','K08','JEONG, DAEEUI','','','FW','19','','11-05-1987','1','174','70');
INSERT INTO player VALUES ('2009084','������','K08','JEONG, WOOJAE','','','FW','24','','12-09-1986','1','173','71');
INSERT INTO player VALUES ('2007192','����','K08','Drakulic sasa','','','FW','10','','01-08-1982','1','190','84');
INSERT INTO player VALUES ('2012112','������','K08','SEO, KWANSOO','','','FW','17','','02-02-1990','1','179','74');
INSERT INTO player VALUES ('2011095','�輺��','K08','KIM, SUNGWOON','','','FW','40','','03-12-1988','1','173','64');
INSERT INTO player VALUES ('2012113','������','K08','KIM, 06GWOON','','','FW','28','','04-03-1993','1','170','68');
INSERT INTO player VALUES ('2011094','�嵿��','K08','01G, DONGHYUN','','','FW','39','','05-03-1992','1','178','67');
INSERT INTO player VALUES ('2007250','Ȳ����','K08','HWANG, YOUNSUCK','','','FW','16','','06-10-1983','1','192','81');
INSERT INTO player VALUES ('2000041','��ȣ','K02','JEONG, HO','','','DF','','','07-11-1974','1','','');
INSERT INTO player VALUES ('2000042','�ռ���','K02','WANG, SUNJAE','','','DF','','','08-03-1979','1','','');
INSERT INTO player VALUES ('2000043','�ڻ�','K02','03co Antonio Alvarez Ferreira','','','DF','','�����','08-07-1970','1','','');
INSERT INTO player VALUES ('2000044','����ȿ','K02','YOON, SUNGHYO','','','DF','','','09-05-1972','1','','');
INSERT INTO player VALUES ('2007067','������','K02','JEONG, GWANGSOO','','','GK','41','','10-03-1987','1','182','79');
INSERT INTO player VALUES ('2009004','��ȣ��','K02','CHOI, HOJIN','','','GK','31','','10-10-1986','1','190','82');
INSERT INTO player VALUES ('2007203','����ö','K02','CHO, BUMCHUL','','','GK','21','','11-09-1980','2','185','85');
INSERT INTO player VALUES ('2007035','�����','K02','KIM, WOONJAE','','','GK','1','','12-04-1983','1','182','82');
INSERT INTO player VALUES ('2008429','������','K02','JEONG, YOUNGSUN','','','DF','16','','03-04-1985','1','184','81');
INSERT INTO player VALUES ('2012021','������','K02','JEONG, YOUJIN','','','DF','37','','01-06-1993','1','188','76');
INSERT INTO player VALUES ('2011073','�ս���','K02','SON, SEUNG06','','','DF','32','','02-05-1992','1','186','72');
INSERT INTO player VALUES ('2007007','��ȫ��','K02','CHO, HONGGI','','','DF','15','','04-05-1978','1','175','66');
INSERT INTO player VALUES ('2012027','�ȵ���','K02','AN, DONGWON','','','DF','49','','03-09-1992','1','184','78');
INSERT INTO player VALUES ('2012024','�谭��','K02','KIM, KANGJIN','','','DF','43','','04-04-1996','1','181','65');
INSERT INTO player VALUES ('2007036','�躴��','K02','KIM, BYOUNGKEUN','','','DF','3','','05-04-1983','1','175','63');
INSERT INTO player VALUES ('2012026','���±�','K02','KIM, TAE-KWON','','','DF','46','','06-07-1990','1','180','75');
INSERT INTO player VALUES ('2012014','�躴��','K02','KIM, BYUNGKOOK','','','DF','2','','01-07-1991','1','183','78');
INSERT INTO player VALUES ('2011075','�輺ȯ','K02','KIM, SUNGHWAN','','','DF','5','','09-04-1992','1','183','75');
INSERT INTO player VALUES ('2012123','����','K02','Gabriel Popescu','','','MF','10','�縶�Ͼ�','07-12-1983','1','177','74');
INSERT INTO player VALUES ('2010089','������','K02','','','','MF','26','','02-02-1987','1','174','65');
INSERT INTO player VALUES ('2007051','������','K02','KO, JONGSU','','','MF','22','','08-10-1988','1','176','70');
INSERT INTO player VALUES ('2012015','��â��','K02','KO, CHANGHYUN','','','MF','8','','09-09-1993','1','170','64');
INSERT INTO player VALUES ('2009089','�����','K02','JEONG, KIBUM','','','MF','28','','10-08-1986','1','173','65');
INSERT INTO player VALUES ('2009083','������','K02','JEONG, DONGHYUN','','','MF','25','','11-08-1990','1','175','72');
INSERT INTO player VALUES ('2011071','������','K02','JEONG, DOOHYUN','','','MF','4','','12-07-1992','1','175','67');
INSERT INTO player VALUES ('2012025','����','K02','JEONG, 06','','','MF','44','','09-12-1996','1','170','65');
INSERT INTO player VALUES ('2007040','������','K02','JEONG, JINWOO','','','DF','7','','09-10-1985','1','179','72');
INSERT INTO player VALUES ('2007069','���Ͻ�','K02','Laktio11 Denis','','','FW','11','���þ�','04-09-1987','1','176','71');
INSERT INTO player VALUES ('2007274','������','K02','SEO, 06GWON','','','FW','14','','01-12-1980','1','173','66');
INSERT INTO player VALUES ('2012016','�մ�ȣ','K02','SON, DAEHO','','','DF','17','','11-09-1991','1','186','79');
INSERT INTO player VALUES ('2011070','������','K02','OH, GUCHAN','','','MF','24','','02-08-1992','1','178','71');
INSERT INTO player VALUES ('2012135','������','K02','','','','MF','45','','03-03-1993','1','176','70');
INSERT INTO player VALUES ('2009131','�赿��','K02','KIM, DONGWOOK','','','MF','40','','10-04-1986','1','176','68');
INSERT INTO player VALUES ('2010901','�强ö','K11','','','','MF','27','','09-03-1991','1','176','75');
INSERT INTO player VALUES ('2010902','������','K11','','','','DF','17','','04-03-1993','1','173','63');
INSERT INTO player VALUES ('2010903','�弭��','K11','','','','FW','07','','05-01-1995','1','180','60');
INSERT INTO player VALUES ('2009901','��Ծ�','K12','','','','DF','29','','06-08-1994','1','175','70');
INSERT INTO player VALUES ('2009902','�����','K12','','','','FW','12','','07-02-1987','1','172','63');
INSERT INTO player VALUES ('2008901','������','K13','','','','DF','49','','08-07-1992','1','173','72');
INSERT INTO player VALUES ('2008902','������','K13','','','','GK','46','','09-04-1996','1','174','66');
INSERT INTO player VALUES ('2008903','�ȼ���','K13','','','','FW','38','','10-10-1997','1','174','63');
INSERT INTO player VALUES ('2007901','�ֽ���','K14','','','','DF','33','','11-11-1992','1','170','72');
INSERT INTO player VALUES ('2007902','ȫ����','K14','','','','MF','32','','11-12-1988','1','169','74');
INSERT INTO player VALUES ('2010801','�����','K15','','','','MF','22','','08-03-1988','1','168','75');
INSERT INTO player VALUES ('2010802','��â��','K15','','','','DF','13','','12-05-1989','1','177','68');
INSERT INTO player VALUES ('2010803','������','K15','','','','FW','11','','09-01-1989','1','181','62');


