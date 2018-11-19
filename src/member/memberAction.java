package member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import test.dao.TestDAO;
import vo.Admin;
import vo.FlagVO;
import vo.JapAvgVO;
import vo.OneofTestScore;
import vo.Student;
import vo.StudentListForTeacherVO;
import vo.Subject;
import vo.Teacher;

import com.opensymphony.xwork2.ActionSupport;

public class memberAction extends ActionSupport implements SessionAware{
	Student student;
	String class_num;
	String flagnum;
	String japanese;
	
	String email;//개인정보수정시
	String phone;
	String jlpt;
	int    eip;
	//id중복체크용
	boolean idCheck;
	String searchText;
	
	Teacher teacher;
	Subject subject;
	Admin admin;
	List<FlagVO> flagList;
	List<Subject> subjectList;
	List<Subject> subjectListJ;
	List<Student> studentList;
	List<Teacher> teacherList;
	List<Student> studentListnotConfirmed;
	List<Teacher> teacherListnotConfirmed;
	List<StudentListForTeacherVO> studentListForTeacher;
	JapAvgVO japAvgVO;
	Map<String, Object> session;
	HashMap<String,Object> hashmap;
	
	String id;
	String password;
	int type;
	
	private File upload;					//profile사진upload용
	private String uploadFileName;			
	private String uploadContentType;
	//String path="D:/workspace/LMS/WebContent/upload/";//프로젝트폴더내에 업로드 하는 것 알아보기
	//String path="C:/WorkSpace/LMS/WebContent/upload/";//우리집경로
	String path="C:/eclipse/workspace/LMS_SCmaster/WebContent/upload/";//영보
	String[] japLev = {"상","중","하"};
	
	public String execute() throws Exception {
		/*System.out.println(student);*/
		SimpleDateFormat sdf_filename = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
		String inputdate_file = sdf_filename.format(new Date());
		student.setPropic("");
		if(upload !=null){
			if(upload.exists()){
				/*System.out.println(uploadFileName+" "+uploadContentType);*/
				String savedfile = inputdate_file+uploadFileName;
				//String originalfile = uploadFileName;				
				File destFile = new File(path+savedfile);
				FileUtils.copyFile(upload, destFile);
				student.setPropic(savedfile);
			}}
		/*System.out.println("append profile: "+student);*/
		new memberDAO().memberJoin(student);
		session.put("userSign", student);
		return SUCCESS;
	}
	//id중복체크
	public String idCheck() throws Exception {
		student= new memberDAO().idCheck(searchText);
		if(student!=null){
			idCheck=true;
			/*System.out.println("가입된 아이디");*/
		}
		return SUCCESS;
	}
	public String loginForm2() throws Exception{
		if(type==1){
			/*System.out.println("선생님 로그인");*/
		}else if(type==2){
			/*System.out.println("학생 로그인");*/
		}else if(type==0){
			/*System.out.println("관리자로그인");*/
		}
		return SUCCESS;
	}
	public String login() throws Exception {
		/*System.out.println(id+" "+password+" "+type);*/
		if(type==0){
			/*System.out.println("관리자용");*/
			hashmap= new HashMap<>();
			hashmap.put("id", id); hashmap.put("password", password);//스트링으로 검색조건을 만족함
			admin = new memberDAO().adminLogin(hashmap); //객체 받아오는 부분
			if(admin!=null){
				session.put("userSign", admin);
			}else if(admin==null){
				return LOGIN;
			}
		}else if(type==1){
			/*System.out.println("선생님안녕하세요");*/
			hashmap= new HashMap<>();
			hashmap.put("id", id); hashmap.put("password", password);
			teacher = new memberDAO().teacherLogin(hashmap);
			if(teacher!=null){
				session.put("userSign", teacher);
			}else if(teacher==null){
				return LOGIN;
			}
		}else if(type==2){
			/*System.out.println("학생이네");*/
			hashmap= new HashMap<>();
			hashmap.put("id", id); hashmap.put("password", password);
			student = new memberDAO().studentLogin(hashmap);
			if(student!=null){
				session.put("userSign", student);
			}else if(student==null){
				return LOGIN;
			}
		}
		
		return SUCCESS;
	}
	public String logout() throws Exception {
		session.remove("userSign");
		return SUCCESS;
	}
	public String mypageForm() throws Exception {
		/*System.out.println("Welcome to MyPage");*/
		String birth;
		if(session.get("userSign") instanceof Student){
			student = (Student)session.get("userSign");
			birth = student.getBirth().substring(0,10);
			student.setBirth(birth);
			id = student.getId();
			subjectList= new memberDAO().myStudyList(id);
			subjectListJ= new memberDAO().myStudyListJ(id);
			/*System.out.println("학생의수강목록: "+subjectList);*/
		}else if(session.get("userSign") instanceof Teacher){
			teacher = (Teacher)session.get("userSign");
			birth = teacher.getBirth().substring(0,10);
			teacher.setBirth(birth);
			id = teacher.getId();
			studentListForTeacher = new memberDAO().getSListForTeacher(id);
			//studentList = new memberDAO().getStudentsForTooltip(id);
			//System.out.println("툴팁용학생정보index[0] :"+studentList);
		}else if(session.get("userSign") instanceof Admin){
			admin = (Admin)session.get("userSign");
			id = admin.getId();
		}
		/*System.out.println("Welcome to MyPage2");
		System.out.println(id);
		
		System.out.println("Welcome to MyPage3");*/
		return SUCCESS;
	}
	public String profileUpdate() throws Exception {
		/*System.out.println("Hello0");*/
		/*String email;//개인정보수정시
		String phone;
		String jlpt;
		int    eip;*/
		student = new Student();
		student.setEmail(email);student.setPhone(phone);
		student.setJlpt(jlpt);student.setEip(eip);student.setId(id);
		
		/*System.out.println(student);*/
		new memberDAO().profileUpdate(student);
		student = new memberDAO().getStudent(id);
	/*	System.out.println("Hello1");*/
		//getOneofStudents();
		/*session.put("userSign", student);*/
		return SUCCESS;
	}
	public String profileUpdateT() throws Exception {
		/*System.out.println("선생님의프로필업뎃");*/
		teacher = new Teacher();
		teacher.setId(id);teacher.setPhone(phone);teacher.setEmail(email);
		/*System.out.println(teacher);*/
		new memberDAO().profileUpdateT(teacher);
		teacher = new memberDAO().getTeacher(id);
		/*System.out.println("Hello1");*/
		//getOneofStudents();
		session.put("userSign", teacher);
		return SUCCESS;
	}
	
	public String propicUpdate() throws Exception{
		/*System.out.println("사진을 업뎃하기 위한 곳");*/
		SimpleDateFormat sdf_filename = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
		String inputdate_file = sdf_filename.format(new Date());
		String savedfile="";
		if(upload !=null){
			if(upload.exists()){
			/*	System.out.println(id+uploadFileName);*/
				savedfile = inputdate_file+uploadFileName;
				//String originalfile = uploadFileName;				
				File destFile = new File(path+savedfile);
				FileUtils.copyFile(upload, destFile);
			}}
		if(type==2){//학생이라면
			/*System.out.println("학생의프로필사진업뎃");*/
			new memberDAO().propicUpdate(id,savedfile);
			student = new memberDAO().getStudent(id);
			session.put("userSign", student);
		}else if(type==1){
			/*System.out.println("선생님의프로필사진업뎃");*/
			new memberDAO().propicUpdateT(id, savedfile);
			teacher = new memberDAO().getTeacher(id);
			session.put("userSign", teacher);
			/*System.out.println("선생님의프로필사진업뎃완료");*/
		}
		
		return SUCCESS;
	}
	public String avapicUpdate() throws Exception{
		/*System.out.println("아바타사진을 업뎃하기 위한 곳");*/
		SimpleDateFormat sdf_filename = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
		String inputdate_file = sdf_filename.format(new Date());
		String savedfile="";
		if(upload !=null){
			if(upload.exists()){
				/*System.out.println(id+uploadFileName);*/
				savedfile = inputdate_file+uploadFileName;
				//String originalfile = uploadFileName;				
				File destFile = new File(path+savedfile);
				FileUtils.copyFile(upload, destFile);
			}}
		if(type==2){//학생이라면
			/*System.out.println("학생의아바타사진업뎃");*/
			System.out.println(id+" "+savedfile);
			new memberDAO().avapicUpdate(id, savedfile);
			student = new memberDAO().getStudent(id);
			session.put("userSign", student);
		}else if(type==1){
			System.out.println("선생님의아바타사진업뎃");
			new memberDAO().avapicUpdateT(id, savedfile);
			teacher = new memberDAO().getTeacher(id);
			session.put("userSign", teacher);
			System.out.println("선생님의아바타사진업뎃완료");
		}else if(type==0){
		/*	System.out.println("관리자의아바타사진업뎃");*/
			new memberDAO().avapicUpdateA(id, savedfile);
			admin = new memberDAO().getAdmin(id);
		/*	System.out.println("관리자의아바타사진업뎃완료0");*/
			session.put("userSign", admin);
			/*System.out.println("관리자의아바타사진업뎃완료");*/
		}
		
		return SUCCESS;
	}
	//한명의학생정보가져오기(툴팁용) //사용하지않았다
	public String getOneofStudent() throws Exception{
		/*System.out.println("학생의정보를가져오겠습니다*********************");*/
		student = new memberDAO().getStudent(idForView);
		return SUCCESS;
	} 
	public String memberManagementForm() throws Exception {
		/*System.out.println("managementForm");*/
		studentListnotConfirmed=new memberDAO().studentListforConfirm();
		teacherListnotConfirmed=new memberDAO().teacherListforConfirm();
		//승인되지 않은 선생님의 명단
		/*System.out.println("승인되지 않은 선생님의 명단");
		System.out.println(teacherListnotConfirmed);*/
		//승인되지 않은 학생의 명단
	/*	System.out.println("승인되지 않은 학생의 명단");
		System.out.println(studentListnotConfirmed);*/
		studentList = new memberDAO().studentList();
		teacherList = new memberDAO().teacherList();
		//기수 정보
		/*System.out.println("기수정보");*/
		flagList = new memberDAO().getFlags();
		/*System.out.println(flagList);
		System.out.println(studentList);
		System.out.println(teacherList);*/
		return SUCCESS;
	}
	public String studentConfirmAndUpdate() throws Exception {
		/*System.out.println("변경과승인이루어짐");*/
		student = new Student();
		student.setClass_num(class_num);student.setFlagnum(flagnum);
		student.setJapanese(japanese);student.setId(id);
	/*	System.out.println("학생회원의변경과승인1 :"+student);*/
		new memberDAO().studentConfirmAndUpdate(student);
/*		System.out.println("학생회원의변경과승인2 :");*/
		studentListnotConfirmed = new memberDAO().studentListforConfirm();
		teacherListnotConfirmed = new memberDAO().teacherListforConfirm();
		return SUCCESS;
	}
	public String teacherConfirm() throws Exception {
		//승인페이지에서 선생님의 승인버튼을 눌렀을 때
	/*	System.out.println("선생님 회원의 승인을 회원정보페이지에서 눌렀을 경우");
		System.out.println(id);*/
		new memberDAO().teacherConfirm(id);
		return SUCCESS;
	}
	public String studentConfirm() throws Exception {
	/*	System.out.println("학생 회원의 승인을 회원정보페이지에서 눌렀을 경우");
		System.out.println(id);*/
		new memberDAO().studentConfirm(id);
		/*System.out.println("Confirmed");*/
		return SUCCESS;
	}
	public String teacherconfirmCancel() throws Exception {
		/*System.out.println("선생님 회원의 승인취소를 회원정보페이지에서 눌렀을 경우");
		System.out.println("승인취소 아이디: "+id);*/
		new memberDAO().teacherConfirmCancel(id);
		/*System.out.println("선생님회원승인취소완료");*/
		return SUCCESS;
	}
	public String studentconfirmCancel() throws Exception {
	/*	System.out.println("학생 회원의 승인취소를 회원정보페이지에서 눌렀을 경우");
		System.out.println("승인취소 아이디: "+id);*/
		new memberDAO().studentConfirmCancel(id);
		/*System.out.println("학생회원승인취소완료");*/
		return SUCCESS;
	}
	//학생의리스트가져오기//성적조회페이지myScoreViewForm
	public String myScoreViewForm() throws Exception {
		if(session.get("userSign") == null){
			System.out.println("로그인안했을때");
			return LOGIN;
		}else if(session.get("userSign") instanceof Student){
			System.out.println("학생의 성적조회 페이지");
			student = (Student)session.get("userSign");
			System.out.println(student);
			studentList = new ArrayList<Student>();
			studentList.add(student);
		}else if(session.get("userSign") instanceof Admin){
/*			System.out.println("관리자의 성적조회 페이지");*/
			studentList = new memberDAO().studentList();
		}else if(session.get("userSign") instanceof Teacher){
		/*	System.out.println("선생님의 성적조회 페이지");*/
			teacher =(Teacher)session.get("userSign");
			studentList = new memberDAO().getStudentsForTooltip(teacher.getId());
			//선생님의강의를듣는학생들만목록이뜬다.
		}
		return SUCCESS;
	}
	public String subjectList() throws Exception {
	/*	System.out.println("여기는 강의목록페이지야 친구");*/
		return SUCCESS;
	}
	/*****************************성적조회페이지******************************/
	OneofTestScore oneofTestScore;
	OneofTestScore scoreITRank;
	OneofTestScore scoreJapRank;
	List<OneofTestScore> scoreList;
	List<OneofTestScore> scoreList2;
	List<OneofTestScore> scoreListJ;
	List<OneofTestScore> scoreListJ2;
	String idForView;
	String flag;
	String name;
	//성적조회를 위한 메소드
	public String myScoreView() throws Exception {
	/*	System.out.println("한명의 학생에 관한 성적정보를 가져옵니다");
		System.out.println(idForView);*/
		scoreList= new memberDAO().getOneofTestScore(idForView);
		scoreList2= new memberDAO().getOneofTestScore2(idForView);
		scoreITRank = new memberDAO().getOneofITRank(idForView);
		student = new memberDAO().getStudent(idForView);
		/*System.out.println("한명의 학생이 가지는 성적정보");
		System.out.println(scoreList);
		System.out.println("한명의 학생이 가지는 성적정보:역량평가");
		System.out.println(scoreList2);*/
		return SUCCESS;
	}//일본어성적조회를 위한 메소드
	public String myScoreViewJ() throws Exception {
		/*System.out.println("한명의 학생에 관한 일본어 성적정보");*/
		scoreListJ = new memberDAO().getOneofTestScoreJ(idForView);
		scoreListJ2 = new memberDAO().getOneofTestScoreJ2(idForView);
		japAvgVO = new memberDAO().getOneofTestScoreJ3(idForView);//카타카나,한자,작문,읽기 등 매일시험의 평균계산
		scoreJapRank = new memberDAO().getOneofJapRank(idForView);//월말평가의석차
		student = new memberDAO().getStudent(idForView);
	/*	System.out.println("한명의 학생이 가지는 일본어성적정보");
		System.out.println(scoreListJ);
		System.out.println("한명의 학생이 가지는 일본어성적정보:월말평가");
		System.out.println(scoreListJ2);
		System.out.println(japAvgVO);*/
		return SUCCESS;
	}
	
	/*//필터링 된 학생리스트 //성적조회용
	public String getStudentListForViewScore() throws Exception{
		System.out.println("조건에 일치하는 학생의 리스트 :성적조회용");
		System.out.println(flag+" "+name);
		studentList = new memberDAO().getStudentListForViewScore(flag, name);
		System.out.println("조건에 일치하는 학생의 리스트 :성적조회용2");
		System.out.println(studentList);
		return SUCCESS;
	}*/
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public OneofTestScore getScoreITRank() {
		return scoreITRank;
	}
	public void setScoreITRank(OneofTestScore scoreITRank) {
		this.scoreITRank = scoreITRank;
	}
	public String getEmail() {
		return email;
	}
	public OneofTestScore getScoreJapRank() {
		return scoreJapRank;
	}
	public void setScoreJapRank(OneofTestScore scoreJapRank) {
		this.scoreJapRank = scoreJapRank;
	}
	public List<Subject> getSubjectListJ() {
		return subjectListJ;
	}
	public void setSubjectListJ(List<Subject> subjectListJ) {
		this.subjectListJ = subjectListJ;
	}
	public List<OneofTestScore> getScoreListJ() {
		return scoreListJ;
	}
	public void setScoreListJ(List<OneofTestScore> scoreListJ) {
		this.scoreListJ = scoreListJ;
	}
	public List<OneofTestScore> getScoreListJ2() {
		return scoreListJ2;
	}
	public void setScoreListJ2(List<OneofTestScore> scoreListJ2) {
		this.scoreListJ2 = scoreListJ2;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJlpt() {
		return jlpt;
	}
	public List<FlagVO> getFlagList() {
		return flagList;
	}
	public void setFlagList(List<FlagVO> flagList) {
		this.flagList = flagList;
	}
	public void setJlpt(String jlpt) {
		this.jlpt = jlpt;
	}
	public int getEip() {
		return eip;
	}
	public void setEip(int eip) {
		this.eip = eip;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public JapAvgVO getJapAvgVO() {
		return japAvgVO;
	}
	public void setJapAvgVO(JapAvgVO japAvgVO) {
		this.japAvgVO = japAvgVO;
	}
	public List<OneofTestScore> getScoreList2() {
		return scoreList2;
	}
	public void setScoreList2(List<OneofTestScore> scoreList2) {
		this.scoreList2 = scoreList2;
	}
	public OneofTestScore getOneofTestScore() {
		return oneofTestScore;
	}
	public void setOneofTestScore(OneofTestScore oneofTestScore) {
		this.oneofTestScore = oneofTestScore;
	}
	public List<OneofTestScore> getScoreList() {
		return scoreList;
	}
	public void setScoreList(List<OneofTestScore> scoreList) {
		this.scoreList = scoreList;
	}
	public String getIdForView() {
		return idForView;
	}
	public void setIdForView(String idForView) {
		this.idForView = idForView;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Subject> getSubjectList() {
		return subjectList;
	}
	public void setSubjectList(List<Subject> subjectList) {
		this.subjectList = subjectList;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public List<StudentListForTeacherVO> getStudentListForTeacher() {
		return studentListForTeacher;
	}
	public void setStudentListForTeacher(
			List<StudentListForTeacherVO> studentListForTeacher) {
		this.studentListForTeacher = studentListForTeacher;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public List<Student> getStudentList() {
		return studentList;
	}
	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}
	public List<Teacher> getTeacherList() {
		return teacherList;
	}
	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}
	public String[] getJapLev() {
		return japLev;
	}
	public void setJapLev(String[] japLev) {
		this.japLev = japLev;
	}
	public List<Student> getStudentListnotConfirmed() {
		return studentListnotConfirmed;
	}
	public void setStudentListnotConfirmed(List<Student> studentListnotConfirmed) {
		this.studentListnotConfirmed = studentListnotConfirmed;
	}
	public boolean isIdCheck() {
		return idCheck;
	}
	public void setIdCheck(boolean idCheck) {
		this.idCheck = idCheck;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public List<Teacher> getTeacherListnotConfirmed() {
		return teacherListnotConfirmed;
	}
	public void setTeacherListnotConfirmed(List<Teacher> teacherListnotConfirmed) {
		this.teacherListnotConfirmed = teacherListnotConfirmed;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public String getFlagnum() {
		return flagnum;
	}
	public void setFlagnum(String flagnum) {
		this.flagnum = flagnum;
	}
	public String getJapanese() {
		return japanese;
	}
	public void setJapanese(String japanese) {
		this.japanese = japanese;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
}
