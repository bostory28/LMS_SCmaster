
/* Drop Tables */

DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE attendance CASCADE CONSTRAINTS;
DROP TABLE pfreply CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE response CASCADE CONSTRAINTS;
DROP TABLE counsel_board CASCADE CONSTRAINTS;
DROP TABLE flag CASCADE CONSTRAINTS;
DROP TABLE prob_list CASCADE CONSTRAINTS;
DROP TABLE prob CASCADE CONSTRAINTS;
DROP TABLE quiz_score CASCADE CONSTRAINTS;
DROP TABLE register CASCADE CONSTRAINTS;
DROP TABLE schedule CASCADE CONSTRAINTS;
DROP TABLE score CASCADE CONSTRAINTS;
DROP TABLE student CASCADE CONSTRAINTS;
DROP TABLE test CASCADE CONSTRAINTS;
DROP TABLE subject CASCADE CONSTRAINTS;
DROP TABLE teacher CASCADE CONSTRAINTS;
DROP TABLE wronglist CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE admin
(
	admin_seq number NOT NULL,
	adminid varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	phone varchar2(30) NOT NULL,
	email varchar2(30) NOT NULL,
	PRIMARY KEY (admin_seq)
);


CREATE TABLE attendance
(
	date varchar2(30) NOT NULL,
	-- �⼮ üũ ����
	-- ex ) �⼮ 1 ���� 2 �Ἦ 3
	check number DEFAULT 1,
	studentid varchar2(20) NOT NULL
);


CREATE TABLE board
(
	boardnum number NOT NULL,
	user_id varchar2(30) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	inputdate long NOT NULL,
	viewcount number,
	savedfile varchar2(100),
	originalfile varchar2(100),
	PRIMARY KEY (boardnum)
);


CREATE TABLE counsel_board
(
	-- �۹�ȣ 
	counsel_seq number NOT NULL,
	studentid varchar2(20) NOT NULL,
	title varchar2(500) NOT NULL,
	contents varchar2(5000) NOT NULL,
	date varchar2(30),
	PRIMARY KEY (counsel_seq)
);


CREATE TABLE flag
(
	flag_seq number NOT NULL,
	flag_num  NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	PRIMARY KEY (flag_seq)
);


CREATE TABLE pfreply
(
	pfreplyid  NOT NULL,
	boardnum number NOT NULL,
	userid  NOT NULL,
	pfcontent varchar2(500) NOT NULL,
	inputdate date NOT NULL,
	comment varchar2(400) NOT NULL,
	PRIMARY KEY (pfreplyid)
);


CREATE TABLE prob
(
	-- ������ �������̵�
	-- 
	prob_id number NOT NULL,
	-- ����Ÿ��
	prob_type varchar2(5) NOT NULL,
	-- ����� ���� 1
	obj1 varchar2(100) NOT NULL,
	obj2 varchar2(100) NOT NULL,
	obj3 varchar2(100) NOT NULL,
	obj4 varchar2(100) NOT NULL,
	-- �ְ�� ��
	sbj varchar2(50) NOT NULL,
	answer varchar2(50) NOT NULL,
	-- ���� �ؼ�
	-- 
	explanation varchar2(1000) NOT NULL,
	-- ���� ����� id(������ȭ)
	teacher_id varchar2(30) NOT NULL,
	-- ���̵�. 1~3����
	difficulty number NOT NULL,
	PRIMARY KEY (prob_id)
);


CREATE TABLE prob_list
(
	test_seq number NOT NULL,
	-- ������ �������̵�
	-- 
	prob_id number NOT NULL
);


CREATE TABLE quiz_score
(
	score_id number NOT NULL,
	-- �����ڵ�
	-- 
	test_id number NOT NULL,
	-- ����ģ �л��� id
	student_id varchar2(30) NOT NULL,
	-- �ѹ�����
	-- 
	probcount number NOT NULL,
	-- ���Ṯ����
	correct number NOT NULL,
	-- Ʋ��������
	-- 
	wrong number NOT NULL,
	-- ������
	totalscore number NOT NULL,
	PRIMARY KEY (score_id)
);


CREATE TABLE register
(
	subject_seq number NOT NULL,
	studentid varchar2(20) NOT NULL
);


CREATE TABLE reply
(
	replynum number NOT NULL,
	boardnum number NOT NULL,
	replycontent varchar2(200) NOT NULL,
	user_id varchar2(30) NOT NULL,
	inputdate date NOT NULL,
	saysto varchar2(30),
	PRIMARY KEY (replynum)
);


CREATE TABLE response
(
	answer_seq number NOT NULL,
	-- �۹�ȣ 
	counsel_seq number NOT NULL,
	teacherid varchar2(20) NOT NULL,
	contents varchar2(5000) NOT NULL,
	date varchar2(30) NOT NULL,
	-- ���� Ȯ�� ����
	check number NOT NULL,
	PRIMARY KEY (answer_seq)
);


CREATE TABLE schedule
(
	-- �������� �����̸Ӹ�Ű
	schedule_seq number NOT NULL UNIQUE,
	subject_seq number NOT NULL,
	-- �����ǳ���
	content varchar2(100) NOT NULL,
	PRIMARY KEY (schedule_seq)
);


CREATE TABLE score
(
	score_seq number NOT NULL,
	test_seq number NOT NULL,
	studentid varchar2(20) NOT NULL,
	score ,
	PRIMARY KEY (score_seq)
);


CREATE TABLE student
(
	studentid varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	phone varchar2(30),
	email varchar2(30),
	birth date,
	eip number DEFAULT 0,
	jlpt varchar2(10) DEFAULT '0',
	japanese varchar2(10) DEFAULT '중',
	class varchar2(10),
	propic varchar2(100),
	avapic varchar2(100),
	confirm number DEFAULT 0,
	flagnum varchar2(10),
	PRIMARY KEY (studentid)
);


CREATE TABLE subject
(
	subject_seq number NOT NULL,
	-- ������ id
	teacherid varchar2(20) NOT NULL,
	subjectname varchar2(20) NOT NULL,
	-- 
	-- 
	flag varchar2(10) NOT NULL,
	class varchar2(10) NOT NULL,
	start_date  NOT NULL,
	end_date  NOT NULL,
	PRIMARY KEY (subject_seq)
);


CREATE TABLE teacher
(
	-- ������Sequence��
	admin_seq number UNIQUE,
	-- ������ id
	teacherid varchar2(20) NOT NULL,
	-- ������ ��й�ȣ
	password varchar2(20) NOT NULL,
	-- ������ �̸�
	name varchar2(20) NOT NULL,
	-- ������ ��ȭ��ȣ
	phone varchar2(30),
	-- ������ �̸���
	email varchar2(30),
	-- ������� ������
	birth date,
	-- ������� �̷¼������� ���
	resum varchar2(200),
	-- ������� �о� IT/�Ϻ���
	field varchar2(20) DEFAULT 'IT' NOT NULL,
	-- ���� �ð��ִ� ����
	currentcourse varchar2(50),
	-- �л��������ʻ���
	propic varchar2(100),
	-- �л��� ȸ���� ���ο���
	confirm number DEFAULT 0,
	PRIMARY KEY (teacherid)
);


CREATE TABLE test
(
	test_seq number NOT NULL,
	subject_seq number NOT NULL,
	testname varchar2(20) NOT NULL,
	date date NOT NULL,
	limittime number,
	-- �¶������� ������������ �����Ѵ�.
	type varchar2(10) NOT NULL,
	PRIMARY KEY (test_seq)
);


CREATE TABLE wronglist
(
	-- ������ Ʋ���л�
	student_id varchar2(30) NOT NULL,
	-- ģ������ ����
	tes_id  NOT NULL,
	prob_id  NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE pfreply
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (boardnum)
;


ALTER TABLE reply
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (boardnum)
;


ALTER TABLE response
	ADD FOREIGN KEY (counsel_seq)
	REFERENCES counsel_board (counsel_seq)
;


ALTER TABLE prob_list
	ADD FOREIGN KEY (prob_id)
	REFERENCES prob (prob_id)
;


ALTER TABLE score
	ADD FOREIGN KEY (studentid)
	REFERENCES student (studentid)
;


ALTER TABLE register
	ADD FOREIGN KEY (studentid)
	REFERENCES student (studentid)
;


ALTER TABLE attendance
	ADD FOREIGN KEY (studentid)
	REFERENCES student (studentid)
;


ALTER TABLE schedule
	ADD FOREIGN KEY (subject_seq)
	REFERENCES subject (subject_seq)
;


ALTER TABLE test
	ADD FOREIGN KEY (subject_seq)
	REFERENCES subject (subject_seq)
;


ALTER TABLE register
	ADD FOREIGN KEY (subject_seq)
	REFERENCES subject (subject_seq)
;


ALTER TABLE subject
	ADD FOREIGN KEY (teacherid)
	REFERENCES teacher (teacherid)
;


ALTER TABLE prob_list
	ADD FOREIGN KEY (test_seq)
	REFERENCES test (test_seq)
;


ALTER TABLE score
	ADD FOREIGN KEY (test_seq)
	REFERENCES test (test_seq)
;



/* Comments */

COMMENT ON COLUMN attendance.check IS '�⼮ üũ ����
ex ) �⼮ 1 ���� 2 �Ἦ 3';
COMMENT ON COLUMN counsel_board.counsel_seq IS '�۹�ȣ ';
COMMENT ON COLUMN prob.prob_id IS '������ �������̵�
';
COMMENT ON COLUMN prob.prob_type IS '����Ÿ��';
COMMENT ON COLUMN prob.obj1 IS '����� ���� 1';
COMMENT ON COLUMN prob.sbj IS '�ְ�� ��';
COMMENT ON COLUMN prob.explanation IS '���� �ؼ�
';
COMMENT ON COLUMN prob.teacher_id IS '���� ����� id(������ȭ)';
COMMENT ON COLUMN prob.difficulty IS '���̵�. 1~3����';
COMMENT ON COLUMN prob_list.prob_id IS '������ �������̵�
';
COMMENT ON COLUMN quiz_score.test_id IS '�����ڵ�
';
COMMENT ON COLUMN quiz_score.student_id IS '����ģ �л��� id';
COMMENT ON COLUMN quiz_score.probcount IS '�ѹ�����
';
COMMENT ON COLUMN quiz_score.correct IS '���Ṯ����';
COMMENT ON COLUMN quiz_score.wrong IS 'Ʋ��������
';
COMMENT ON COLUMN quiz_score.totalscore IS '������';
COMMENT ON COLUMN response.counsel_seq IS '�۹�ȣ ';
COMMENT ON COLUMN response.check IS '���� Ȯ�� ����';
COMMENT ON COLUMN schedule.schedule_seq IS '�������� �����̸Ӹ�Ű';
COMMENT ON COLUMN schedule.content IS '�����ǳ���';
COMMENT ON COLUMN student.password IS '������ ��й�ȣ';
COMMENT ON COLUMN student.name IS '�л��� �̸�';
COMMENT ON COLUMN student.phone IS '������ ��ȭ��ȣ';
COMMENT ON COLUMN student.email IS '������ �̸���';
COMMENT ON COLUMN student.birth IS '�л��� ������';
COMMENT ON COLUMN student.eip IS '����ó��(���)����� ����';
COMMENT ON COLUMN student.jlpt IS 'jlpt����&�޼�';
COMMENT ON COLUMN student.japanese IS '�Ϻ����';
COMMENT ON COLUMN student.class IS '�л��ǹ�';
COMMENT ON COLUMN student.propic IS '�л��������ʻ���';
COMMENT ON COLUMN student.avapic IS '�л��Ǿƹ�Ÿ����';
COMMENT ON COLUMN student.confirm IS '�л��� ȸ���� ���ο���';
COMMENT ON COLUMN student.flagnum IS '�л��Ǳ��';
COMMENT ON COLUMN subject.teacherid IS '������ id';
COMMENT ON COLUMN subject.flag IS '
';
COMMENT ON COLUMN teacher.admin_seq IS '������Sequence��';
COMMENT ON COLUMN teacher.teacherid IS '������ id';
COMMENT ON COLUMN teacher.password IS '������ ��й�ȣ';
COMMENT ON COLUMN teacher.name IS '������ �̸�';
COMMENT ON COLUMN teacher.phone IS '������ ��ȭ��ȣ';
COMMENT ON COLUMN teacher.email IS '������ �̸���';
COMMENT ON COLUMN teacher.birth IS '������� ������';
COMMENT ON COLUMN teacher.resum IS '������� �̷¼������� ���';
COMMENT ON COLUMN teacher.field IS '������� �о� IT/�Ϻ���';
COMMENT ON COLUMN teacher.currentcourse IS '���� �ð��ִ� ����';
COMMENT ON COLUMN teacher.propic IS '�л��������ʻ���';
COMMENT ON COLUMN teacher.confirm IS '�л��� ȸ���� ���ο���';
COMMENT ON COLUMN test.type IS '�¶������� ������������ �����Ѵ�.';
COMMENT ON COLUMN wronglist.student_id IS '������ Ʋ���л�';
COMMENT ON COLUMN wronglist.tes_id IS 'ģ������ ����';



