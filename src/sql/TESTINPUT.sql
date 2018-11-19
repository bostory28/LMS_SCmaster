-- 게시판 테이블  --
create table strutsboard (
	boardnum		number(10) primary key,		--게시판 글번호
	id				varchar2(20) not null,		--작성자 ID
	inputdate		number(20),					--작성일
	viewcount		number(10) default 0,		--조회수
	title			varchar2(500) not null,		--글제목
	content			varchar2(4000) not null,	--글내용
	savedfile		varchar2(100),				--첨부파일명 (실제 저장된 이름)			
	originalfile	varchar2(200)				--첨부파일명 (원래 이름)
);

-- 게시판 글 번호 시퀀스 --
create sequence strutsboard_seq start with 1 increment by 1;

--테스트자료 입력--
insert into strutsboard(boardnum,id,inputdate,viewcount,title,content,savedfile,originalfile)
 values(strutsboard_seq.nextval,'kumi',111111111111,5,'test1','test1 has been done!','filesaved','originalone1');

 insert into strutsboard(boardnum,id,inputdate,viewcount,title,content,savedfile,originalfile)
 values(strutsboard_seq.nextval,'kumi','2010/11/11',5,'test1','test1 has been done!','filesaved','originalone1')


-- 한줄답변 테이블 --
create table strutsreply (
	replynum	number(10) primary key, --리플 테이블의 일련번호
	boardnum	number(10) not null,	--본문 글번호
	id			varchar2(20) not null, 	--리플 쓴 ID
	retext		varchar2(200),			--리플 내용
	inputdate	date default sysdate,	--작성일
	constraint strutsreply_fk 
	foreign key(boardnum) references strutsboard(boardnum)
	on delete cascade
);

-- 한줄답변 테이블의 일련번호
create sequence strutsreply_seq;

CREATE TABLE student
(
	id varchar2(30) NOT NULL,
	password varchar2(30) NOT NULL,
	name varchar2(30) NOT NULL,
	phone varchar2(30),
	email varchar2(30),
	type number NOT NULL,--관리자와 학생과 선생을 구분짓는 코드
	birth date,
	eip number DEFAULT 0,
	jlpt varchar2(10) DEFAULT '0',
	japanese varchar2(10) DEFAULT '중',
	class_num varchar2(10),
	propic varchar2(100),
	avapic varchar2(100),
	confirm number DEFAULT 0,
	flagnum varchar2(10),
	PRIMARY KEY (id)
);

CREATE TABLE teacher
(
	id varchar2(30) NOT NULL,
	-- 관리자의 비밀번호
	password varchar2(30) NOT NULL,
	-- 관리자의 이름
	name varchar2(30) NOT NULL,
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

CREATE TABLE subject
(
	subject_seq number NOT NULL,
	id varchar2(20) NOT NULL,
	subjectname varchar2(20) NOT NULL, 
	flag varchar2(10) NOT NULL,
	class_num varchar2(10) NOT NULL,
	start_date varchar2(30) NOT NULL,
	end_date varchar2(30) NOT NULL,
	PRIMARY KEY (subject_seq)
);

CREATE TABLE register
(
	subject_seq number NOT NULL,
	id varchar2(20) NOT NULL
);

-- ====================테스트 멤버 데이터 ===========================--

-- type 이 0이면 관리자, 1이면 선생님, 2이면 학생입니다. ----
--관리자
insert into admin values('admin','admin','admin_name','admin_phone', 'admin_email',0); -- 관리자 데이터 삽입
--선생
insert into teacher values('teacher1','teacher1','teacher1_name','teacher1_phone', 'teacher1_email',1,null,'resume','IT','currentcourse','propic',1); --선생1 데이터 삽입
insert into teacher values('teacher2','teacher2','teacher2_name','teacher2_phone', 'teacher2_email',1,null,'resume','JPN','currentcourse','propic',1); --선생2 데이터 삽입
--학생
insert into student values('student1','student1','student1_name','student1_phone','student1_email',2,null,0,'0','중','A','PROPIC1','AVAPIC2',1,'27');
insert into student values('student2','student2','student2_name','student2_phone','student2_email',2,null,0,'0','중','A','PROPIC1','AVAPIC2',1,'28');


