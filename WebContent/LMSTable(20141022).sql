
/* Drop Triggers */

DROP TRIGGER TRI_board_boardnum;
DROP TRIGGER TRI_counsel_board_counsel_seq;
DROP TRIGGER TRI_monthscore_monthscore_seq;
DROP TRIGGER TRI_new_table_asdf;
DROP TRIGGER TRI_problem_prob_id;
DROP TRIGGER TRI_reply_replynum;
DROP TRIGGER TRI_schedule_schedule_seq;
DROP TRIGGER TRI_score_score_seq;
DROP TRIGGER TRI_subject_subject_seq;
DROP TRIGGER TRI_test_test_seq;



/* Drop Tables */

DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE attendance CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE pfreply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE response CASCADE CONSTRAINTS;
DROP TABLE counsel_board CASCADE CONSTRAINTS;
DROP TABLE detail CASCADE CONSTRAINTS;
DROP TABLE flag CASCADE CONSTRAINTS;
DROP TABLE monthscore CASCADE CONSTRAINTS;
DROP TABLE prob_list CASCADE CONSTRAINTS;
DROP TABLE problem CASCADE CONSTRAINTS;
DROP TABLE quiz_score CASCADE CONSTRAINTS;
DROP TABLE register CASCADE CONSTRAINTS;
DROP TABLE schedule CASCADE CONSTRAINTS;
DROP TABLE score CASCADE CONSTRAINTS;
DROP TABLE student CASCADE CONSTRAINTS;
DROP TABLE test CASCADE CONSTRAINTS;
DROP TABLE subject CASCADE CONSTRAINTS;
DROP TABLE teacher CASCADE CONSTRAINTS;
DROP TABLE wronglist CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_board_boardnum;
DROP SEQUENCE SEQ_counsel_board_counsel_seq;
DROP SEQUENCE SEQ_monthscore_monthscore_seq;
DROP SEQUENCE SEQ_new_table_asdf;
DROP SEQUENCE SEQ_problem_prob_id;
DROP SEQUENCE SEQ_reply_replynum;
DROP SEQUENCE SEQ_schedule_schedule_seq;
DROP SEQUENCE SEQ_score_score_seq;
DROP SEQUENCE SEQ_subject_subject_seq;
DROP SEQUENCE SEQ_test_test_seq;




/* Create Sequences */

CREATE SEQUENCE SEQ_board_boardnum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_counsel_board_counsel_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_monthscore_monthscore_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_new_table_asdf INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_problem_prob_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reply_replynum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_schedule_schedule_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_score_score_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_subject_subject_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_test_test_seq INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admin
(
	id varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	phone varchar2(30) NOT NULL,
	email varchar2(30) NOT NULL,
	type number NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE statement
(
	-- 출석부에 있는 표의 위치 저장값
	-- 이름과 날짜를 혼합하여 만듦.
	-- 
	name_key varchar2(30) NOT NULL,
	-- 소속
	-- 
	affiliation varchar2(30) NOT NULL,
	name varchar2(20) NOT NULL,
	-- 사고내용
	content varchar2(100) NOT NULL,
	-- 사고사유
	-- 
	reason varchar2(4000) NOT NULL,
	afterplan varchar2(4000) NOT NULL,
	PRIMARY KEY (name_key)
);

CREATE TABLE attendance
(
	id varchar2(20) NOT NULL,
	-- 학생이름
	name varchar2(20) NOT NULL,
	attendance_date varchar2(30) NOT NULL,
	-- 출석 체크 유무
	-- ex ) 출석 1 지각 2 결석 3
	attendance_check number DEFAULT 1 NOT NULL
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
	-- 글번호 
	counsel_seq number NOT NULL,
	studentid varchar2(20) NOT NULL,
	title varchar2(500) NOT NULL,
	contents varchar2(2000) NOT NULL,
	inputdate varchar2(30),
	PRIMARY KEY (counsel_seq)
);


CREATE TABLE detail
(
	detail_seq number NOT NULL,
	detailtitle varchar2(100) NOT NULL,
	subject_seq number NOT NULL,
	PRIMARY KEY (detail_seq)
);


CREATE TABLE flag
(
	flag_num varchar2(10) NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	-- 학생수
	student_num number NOT NULL,
	PRIMARY KEY (flag_num)
);


CREATE TABLE monthscore
(
	monthscore_seq number NOT NULL,
	test_seq number NOT NULL,
	id varchar2(20) NOT NULL,
	write number NOT NULL,
	interview number NOT NULL,
	speech number NOT NULL,
	PRIMARY KEY (monthscore_seq)
);


CREATE TABLE pfreply
(
	pfreplyid varchar2(20) NOT NULL,
	boardnum number NOT NULL,
	userid varchar2(20) NOT NULL,
	pfcontent varchar2(500) NOT NULL,
	inputdate date NOT NULL,
	comments varchar2(400) NOT NULL,
	PRIMARY KEY (pfreplyid)
);


CREATE TABLE problem
(
	-- 문제의 고유아이디
	-- 
	prob_id number NOT NULL,
	-- 문제타입
	prob_type varchar2(5) NOT NULL,
	probtext varchar2(500) NOT NULL,
	-- 객관식 보기 1
	obj1 varchar2(100),
	obj2 varchar2(100),
	obj3 varchar2(100),
	obj4 varchar2(100),
	-- 주관식 답
	sbj varchar2(50),
	answer varchar2(50) NOT NULL,
	-- 문제 해설
	-- 
	explanation varchar2(1000) NOT NULL,
	-- 문제 낸사람 id(역정규화)
	teacher_id varchar2(30) NOT NULL,
	-- 난이도. 1~3까지
	difficulty number NOT NULL,
	inputdate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (prob_id)
);


CREATE TABLE prob_list
(
	test_seq number NOT NULL,
	-- 문제의 고유아이디
	-- 
	prob_id number NOT NULL
);


CREATE TABLE quiz_score
(
	score_id number NOT NULL,
	-- 시험코드
	-- 
	test_id number NOT NULL,
	-- 시험친 학생의 id
	student_id varchar2(30) NOT NULL,
	-- 총문제수
	-- 
	probcount number NOT NULL,
	-- 맟춘문제수
	correct number NOT NULL,
	-- 틀린문제수
	-- 
	wrong number NOT NULL,
	-- 총점수
	totalscore number NOT NULL,
	PRIMARY KEY (score_id)
);


CREATE TABLE register
(
	subject_seq number NOT NULL,
	id varchar2(20) NOT NULL
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
	-- 글번호 
	counsel_seq number NOT NULL,
	teacherid varchar2(20) NOT NULL,
	contents varchar2(2000) NOT NULL,
	inputdate varchar2(30) NOT NULL,
	-- 쪽지 확인 여부
	response_check number NOT NULL
);


CREATE TABLE schedule
(
	-- 스케쥴의 프라이머리키
	schedule_seq number NOT NULL,
	title varchar2(100) NOT NULL,
	-- 일정의내용
	content varchar2(1000) NOT NULL,
	start_date varchar2(30) NOT NULL,
	end_date varchar2(30) NOT NULL,
	PRIMARY KEY (schedule_seq)
);


CREATE TABLE score
(
	score_seq number NOT NULL,
	test_seq number NOT NULL,
	id varchar2(20) NOT NULL,
	score number,
	PRIMARY KEY (score_seq)
);


CREATE TABLE student
(
	id varchar2(20) NOT NULL,
	-- 관리자의 비밀번호
	password varchar2(20) NOT NULL,
	-- 학생의 이름
	name varchar2(20) NOT NULL,
	-- 관리자의 전화번호
	phone varchar2(30),
	-- 관리자의 이메일
	email varchar2(30),
	type number NOT NULL,
	-- 학생의 생년월일
	birth date,
	-- 정보처리(산업)기사의 유무
	eip number DEFAULT 0,
	-- jlpt유무&급수
	jlpt varchar2(10) DEFAULT '0',
	-- 일본어레벨
	japanese varchar2(10) DEFAULT '중',
	-- 학생의반
	class_num varchar2(10),
	-- 학생의프로필사진
	propic varchar2(100),
	-- 학생의아바타사진
	avapic varchar2(100),
	-- 학생의 회원가입 승인여부
	confirm number DEFAULT 0,
	-- 학생의기수
	flagnum varchar2(10),
	PRIMARY KEY (id)
);


CREATE TABLE subject
(
	subject_seq number NOT NULL,
	-- 관리자의 id
	id varchar2(20) NOT NULL,
	subjectname varchar2(20) NOT NULL,
	-- 
	-- 
	flag varchar2(10) NOT NULL,
	class_num varchar2(10) NOT NULL,
	start_date varchar2(30) NOT NULL,
	end_date varchar2(30) NOT NULL,
	field varchar2(10) NOT NULL,
	content varchar2(400) NOT NULL,
	PRIMARY KEY (subject_seq)
);


CREATE TABLE teacher
(
	-- 관리자의 id
	id varchar2(20) NOT NULL,
	-- 관리자의 비밀번호
	password varchar2(20) NOT NULL,
	-- 관리자의 이름
	name varchar2(20) NOT NULL,
	-- 관리자의 전화번호
	phone varchar2(30),
	-- 관리자의 이메일
	email varchar2(30),
	type number NOT NULL,
	-- 선생님의 생년월일
	birth date,
	-- 선생님의 이력서파일의 경로
	resum varchar2(200),
	-- 선생님의 분야 IT/일본어
	field varchar2(20) DEFAULT 'IT' NOT NULL,
	-- 현재 맡고있는 강의
	currentcourse varchar2(50),
	-- 학생의프로필사진
	propic varchar2(100),
	-- 학생의 회원가입 승인여부
	confirm number DEFAULT 0,
	PRIMARY KEY (id)
);


CREATE TABLE test
(
	test_seq number NOT NULL,
	subject_seq number,
	testname varchar2(20) NOT NULL,
	limittime number NOT NULL,
	-- 온라인인지 오프라인인지 구분한다.
	type varchar2(10) NOT NULL,
	startdate date NOT NULL,
	enddate date NOT NULL,
	flag varchar2(10) NOT NULL,
	PRIMARY KEY (test_seq)
);


CREATE TABLE wronglist
(
	-- 문제를 틀린학생
	student_id varchar2(30) NOT NULL,
	-- 친시험의 정보
	tes_id varchar2(20) NOT NULL,
	prob_id varchar2(20) NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (boardnum)
	on delete cascade
;


ALTER TABLE pfreply
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (boardnum)
	on delete cascade
;


ALTER TABLE response
	ADD FOREIGN KEY (counsel_seq)
	REFERENCES counsel_board (counsel_seq)
	on delete cascade
;


ALTER TABLE prob_list
	ADD FOREIGN KEY (prob_id)
	REFERENCES problem (prob_id)
	on delete cascade
;


ALTER TABLE attendance
	ADD FOREIGN KEY (id)
	REFERENCES student (id)
	on delete cascade
;


ALTER TABLE score
	ADD FOREIGN KEY (id)
	REFERENCES student (id)
	on delete cascade
;


ALTER TABLE register
	ADD FOREIGN KEY (id)
	REFERENCES student (id)
	on delete cascade
;


ALTER TABLE monthscore
	ADD FOREIGN KEY (id)
	REFERENCES student (id)
	on delete cascade
;


ALTER TABLE register
	ADD FOREIGN KEY (subject_seq)
	REFERENCES subject (subject_seq)
	on delete cascade
;


ALTER TABLE detail
	ADD FOREIGN KEY (subject_seq)
	REFERENCES subject (subject_seq)
	on delete cascade
;


ALTER TABLE test
	ADD FOREIGN KEY (subject_seq)
	REFERENCES subject (subject_seq)
	on delete cascade
;


ALTER TABLE subject
	ADD FOREIGN KEY (id)
	REFERENCES teacher (id)
;


ALTER TABLE prob_list
	ADD FOREIGN KEY (test_seq)
	REFERENCES test (test_seq)
	on delete cascade
;


ALTER TABLE score
	ADD FOREIGN KEY (test_seq)
	REFERENCES test (test_seq)
	on delete cascade
;


ALTER TABLE monthscore
	ADD FOREIGN KEY (test_seq)
	REFERENCES test (test_seq)
	on delete cascade
;



