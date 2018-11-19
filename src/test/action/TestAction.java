package test.action;

import java.util.ArrayList;
import java.util.List;

import test.dao.TestDAO;
import vo.FlagVO;
import vo.TestSubTeaVO;
import vo.TestVO;

import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport{
	//과목별
	private String field = "IT";
	private List<String> list_subject;
	private List<String> list_testname;
	private List<String> list_class;
	private List<FlagVO> list_flag;
	private List<TestSubTeaVO> list_test;
	private List<Object> list_grade;
	private List<String> id;
	private List<Integer> score;
	private List<Integer> subjectid;
	private List<Integer> testid;
	private List<Integer> list_write;
	private List<Integer> list_interview;
	private List<Integer> list_speech;
	private TestSubTeaVO teasubteavo;
	private TestVO testvo;
	private String subjectname;
	private String testname;
	private String teachername;
	private String flag = "27";
	private String online;
	private String subject;
	private String class_num = "고급";
	private List<String> grade;
	private int already_testid;
	private int test_seq;
	private int num;
	private boolean check_open;
	private boolean check = true;
/*****************************************과목별 시험등록 **************************************/
	//초기화면
	public String testItUi() throws Exception {
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		list_subject = dao.getSubject(field, flag);
		list_class = dao.getClassOfFlag(flag);
		unitedSubject();
		return SUCCESS;
	}
	//검색기능
	public String searchSubject() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getTest(flag, online, subject, class_num, field);
		list_class = dao.getClassOfFlag(flag);
		list_grade = new ArrayList<>();
		//이미 성적입력한 시험인지 알기위해
		for (int i = 0; i < list_test.size(); i++) {
			List<TestSubTeaVO> list = dao.getAlreadyInsertGrade(list_test.get(i));
			list_grade.add(list);
		}
		return SUCCESS;
	}
	//전체시험출력
	public String unitedSubject() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getUnitedTest(flag, field);
		return SUCCESS;
	}
	//시험을 일괄 등록한다.
	public String insertTest() throws Exception {
		TestDAO dao = new TestDAO();
		//전에 subjectname을 가져와서 insert
		List<Integer> list = dao.getSeqOfSubject(teasubteavo.getSubjectname());
		for (int i = 0; i < list.size(); i++) {
			teasubteavo.setSubjectid(list.get(i));
			dao.insertTest(teasubteavo);
		}
		return SUCCESS;
	}
	//시험일괄등록 폼을 띄운다.
	public String insertSubjectForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		list_subject = dao.getSubjectOfFlag(field, flag);
		return SUCCESS;
	}
	//일괄삭제기능
	public String deleteTest() throws Exception {
		TestDAO dao = new TestDAO();
		List<Integer> list_testid = dao.getSeqOfTest(subjectname, testname, flag);
		for (int i = 0; i < list_testid.size(); i++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setTestid(list_testid.get(i));
			dao.deleteTest(teasubteavo.getTestid());
		}
		testItUi();
		return SUCCESS;
	}
	//일괄시험수정form을 띄운다.
	public String editSubjectForm() throws Exception {
		TestDAO dao = new TestDAO();
		if(subjectname != null && testname != null && flag != null) {
			teasubteavo = dao.getOneUnitedTest(subjectname, testname, flag);
		}
		insertSubjectForm();
		return SUCCESS;
	}
	//일괄시험수정한다.
	public String editTest() throws Exception {
		TestDAO dao = new TestDAO();
		List<Integer> list_testid = dao.getSeqOfTest(subjectname, testname, flag);
		List<Integer> list_subid = dao.getSeqOfSubject(teasubteavo.getSubjectname());
		for (int i = 0; i < list_testid.size(); i++) {
			teasubteavo.setTestid(list_testid.get(i));
			teasubteavo.setSubjectid(list_subid.get(i));
			dao.editTest(teasubteavo);
		}
		return SUCCESS;
	}
	//성적입력폼을 만든다.
	public String insertGradeForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getStudentOfTest(teasubteavo);
		//subjectname, testname의 이름을 알기위해서
		subjectname = list_test.get(0).getSubjectname();
		testname = list_test.get(0).getTestname();
		return SUCCESS;
	}
	//학생의 성적을 db에 넣는다.
	public String insertSubjectGrade() throws Exception {
		TestDAO dao = new TestDAO();
		for (int i = 0; i < id.size(); i++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setId(id.get(i));
			teasubteavo.setScore(score.get(i));
			teasubteavo.setTestid(testid.get(i));
			teasubteavo.setSubjectid(subjectid.get(i));
			dao.insertScore(teasubteavo);
		}
		return SUCCESS;
	}
	//성적수정입력폼을 만든다.
	public String editGradeForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getGradeOfStudent(teasubteavo);
		subjectname = list_test.get(0).getSubjectname();
		testname = list_test.get(0).getTestname();
		return SUCCESS;
	}
	//성적을 수정한다.
	public String eidtSubjectGrade() throws Exception {
		TestDAO dao = new TestDAO();
		for (int i = 0; i < id.size(); i++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setId(id.get(i));
			teasubteavo.setScore(score.get(i));
			teasubteavo.setTestid(testid.get(i));
			teasubteavo.setSubjectid(subjectid.get(i));
			dao.editScore(teasubteavo);
		}
		return SUCCESS;
	}
/*****************************************역량평가 시험등록 **************************************/
	//역량평가 초기화면
	public String itCapacity() throws Exception {
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		list_class = dao.getClassOfFlag(flag);
		initCapacity();
		return SUCCESS;
	}
	//리스트출력
	public String initCapacity() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getInitCapacity(flag);
		return SUCCESS;
	}
	//역량평가 등록폼
	public String capacityInsertForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		list_subject = dao.getSubjectOfFlag(field, flag);
		list_testname = dao.getNumOfCapacity(flag);
		num = dao.getNumOfFlag(flag);
		int count = 1;
		int temp = 0;
		if(list_testname.size() != 0) {
			for (int i = 0; i < list_testname.size(); i++) {
				temp = Integer.parseInt(list_testname.get(i).substring(0, 1));
				if(count == temp) {
					if(list_testname.size() == count) {
						count++;
						testname = count + "차역량평가";
					}
					count++;
				} else {
					testname = count + "차역량평가";
					break;
				}
			}
		} else {
			testname = 1 + "차역량평가";
		}
		return SUCCESS;
	}
	//시험을 등록한다.
	public String insertCapacityTest() throws Exception {
		TestDAO dao = new TestDAO();
		subjectid = dao.getSeqOfSubject("역량평가");
		list_class = dao.getClassOfFlag(flag);
		for (int i = 0; i < list_class.size(); i++) {
			teasubteavo.setSubjectid(subjectid.get(i));
			dao.insertCapacityTest(teasubteavo);
		}
		return SUCCESS;
	}
	//역량평가수정폼을 만든다.
	public String editCapacityForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		teasubteavo = dao.getCapacityForEdit(flag, testname);
		num = dao.getNumOfFlag(flag);
		return SUCCESS;
	}
	//역량평가정보를 수정한다.
	public String editCapacityTest() throws Exception {
		TestDAO dao = new TestDAO();
		list_class = dao.getClassOfFlag(flag);
		list_test = dao.getTestOfCapacity(teasubteavo.getFlag(), teasubteavo.getTestname());
		for (int i = 0; i < list_class.size(); i++) {
			teasubteavo.setTestid(list_test.get(i).getTestid());
			dao.updateValueOfCapacity(teasubteavo);
		}
		return SUCCESS;
	}
	//선택한 역량평가를 삭제한다.
	public String deleteCapacityTest() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getTestOfCapacity(flag, testname);
		//삭제한다.
		for (int i = 0; i < list_test.size(); i++) {
			dao.deleteTestOfCapacity(list_test.get(i));
		}
		itCapacity();
		return SUCCESS;
	}
	//성적입력폼을 만든다.
	public String insertCapacityGradeForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getStudentOfCapacity(flag, testname);
		return SUCCESS;
	}
	//성적을 입력한다.
	public String insertCapacityGrade() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getStudentOfCapacity(flag, testname);
		for (int j = 0; j < list_test.size(); j++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setTestid(list_test.get(j).getTestid());
			teasubteavo.setId(list_test.get(j).getId());
			teasubteavo.setScore(score.get(j));
			dao.insertScoreOfCapacity(teasubteavo);
			}
		initCapacity();
		return SUCCESS;
	}
	//성적수정폼
	public String editCapacityGradeForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getScoreOfCapacity(flag, testname);
		return SUCCESS;
	}
	//성적을 수정한다.
	public String editCapacityGrade() throws Exception {
		TestDAO dao = new TestDAO();
		for (int i = 0; i < id.size(); i++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setId(id.get(i));
			teasubteavo.setScore(score.get(i));
			teasubteavo.setTestid(testid.get(i));
			dao.updateScoreOfCapacity(teasubteavo);
		}
		return SUCCESS;
	}
	//성적보기를 보여준다.ㅣ
	public String showStudentCapacityGrade() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getScoreOfCapacity(flag, testname);
		return SUCCESS;
	}
/*********************************************일본어 매일시험	******************************************/
	//초기화면
	public String japDaily() throws Exception {
		field = "일본어";
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		list_class = dao.getClassOfJap(field, flag);
		list_test = dao.getDailyOfTest(field, flag, class_num);
		return SUCCESS;
	}
	//등록화면
	public String dailyInsertForm() throws Exception {
		TestDAO dao = new TestDAO();
		field = "일본어";
		list_flag = dao.getFlag();
		list_class = dao.getClassOfJap(field, flag);
		list_test = dao.getSubjectOfDaily(class_num, flag);
		num = dao.getStudentNumOfDaily(class_num, flag);
		return SUCCESS;
	}
	//시험등록
	public String insertDailyTest() throws Exception {
		TestDAO dao = new TestDAO();
		dao.insertDailyTest(teasubteavo);
		return SUCCESS;
	}
	//시험점수 등록폼
	public String insertGradeOfDailyForm() throws Exception {
		TestDAO dao = new TestDAO();
		test_seq = testid.get(0);
		list_test = dao.getStudentOfDaily(test_seq, testname, flag, subjectname, class_num);
		return SUCCESS;
	}
	//시험점수를 입력한다.
	public String insertGradeOfDaily() throws Exception {
		TestDAO dao = new TestDAO();
		for (int j = 0; j < id.size(); j++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setTestid(testid.get(j));
			teasubteavo.setId(id.get(j));
			teasubteavo.setScore(score.get(j));
			dao.insertScoreOfDaily(teasubteavo);
			}
		japDaily();
		return SUCCESS;
	}
	//성적 수정폼
	public String editGradeOfDailyForm() throws Exception {
		TestDAO dao = new TestDAO();
		test_seq = testid.get(0);
		list_test = dao.getScoreOfDaily(test_seq, testname, flag, subjectname);
		return SUCCESS;
	}
	//성적 수정
	public String editDailyGrade() throws Exception {
		TestDAO dao = new TestDAO();
		for (int i = 0; i < id.size(); i++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setId(id.get(i));
			teasubteavo.setScore(score.get(i));
			teasubteavo.setTestid(testid.get(i));
			dao.updateScoreOfDaily(teasubteavo);
		}
		return SUCCESS;
	}
	//삭제 기능
	public String deleteDaily() throws Exception {
		TestDAO dao = new TestDAO();
		dao.deleteTestOfDaily(testid.get(0));
		japDaily();
		return SUCCESS;
	}
	//성적을 가져온다.
	public String showStudentDailyGrade() throws Exception {
		TestDAO dao = new TestDAO();
		test_seq = testid.get(0);
		list_test = dao.getScoreOfDaily(test_seq, testname, flag, subjectname);
		return SUCCESS;
	}
/**********************************************일본어 월말평가******************************************/
	//초기화면
	public String japMonth() throws Exception {
		field = "일본어";
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		list_class = dao.getClassOfJap(field, flag);
		list_test = dao.getMonthOfTest(flag);
		return SUCCESS;
	}
	//시험등록폼
	public String insertMonthForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		num = dao.getNumOfFlag(flag);
		return SUCCESS;
	}
	//시험을 등록한다.
	public String insertMonthTest() throws Exception {
		field = "일본어";
		TestDAO dao = new TestDAO();
		//이미 입력된 달인지 검사한다.
		check = dao.getAlreadyMonth(teasubteavo);
		if(check == false) {
			return SUCCESS;
		}
		list_test = dao.getJapTestOfMonth(field, flag);
		System.out.println(list_test);
		for (int i = 0; i < list_test.size(); i++) {
			teasubteavo.setClass_num(list_test.get(i).getClass_num());
			teasubteavo.setSubjectid(list_test.get(i).getSubjectid());
			dao.insertMonthOfTest(teasubteavo);
			System.out.println("sd");
		}
		return SUCCESS;
	}
	//시험을 수정폼
	public String editMonthForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_flag = dao.getFlag();
		teasubteavo = dao.getMonthOfOneTest(flag, testname);
		num = dao.getNumOfFlag(flag);
		return SUCCESS;
	}
	//시험정보를 수정한다.
	public String editMonthTest() throws Exception {
		TestDAO dao = new TestDAO();
		//이미 입력된 달인지 검사한다.
		if(!testname.equals(teasubteavo.getTestname())) {
			check = dao.getAlreadyMonth(teasubteavo);
			if(check == false) {
				return SUCCESS;
			}
		}
		List<TestSubTeaVO> list_temp = dao.getMonthPerTest(flag, testname);
		System.out.println(list_temp);
		for (int i = 0; i < list_temp.size(); i++) {
			list_temp.get(i).setFlag(teasubteavo.getFlag());
			list_temp.get(i).setLimittime(teasubteavo.getLimittime());
			list_temp.get(i).setStartdate(teasubteavo.getStartdate());
			list_temp.get(i).setEnddate(teasubteavo.getEnddate());
			dao.editMonthTest(list_temp.get(i));
		}
		return SUCCESS;
	}
	//시험을 삭제한다.
	public String deleteMonth() throws Exception {
		TestDAO dao = new TestDAO();
		dao.deleteMonthTest(testname, flag);
		japMonth();
		return SUCCESS;
	}
	//검색기능
	public String searchMonth() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getMonthSearched(flag, class_num);
		return SUCCESS;
	}
	//성적입력폼
	public String insertMonthGradeForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getStudentOfMonth(teasubteavo);
		return SUCCESS;
	}
	//성적을 입력한다.
	public String insertMonthGrade() throws Exception {
		TestDAO dao = new TestDAO();
		for (int i = 0; i < id.size(); i++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setTestid(testid.get(i));
			teasubteavo.setId(id.get(i));
			teasubteavo.setWrite(list_write.get(i));
			teasubteavo.setInterview(list_interview.get(i));
			teasubteavo.setSpeech(list_speech.get(i));
			dao.insertGradeMonth(teasubteavo);
		}
		return SUCCESS;
	}
	//성적수정폼
	public String editMonthGradeForm() throws Exception {
		TestDAO dao = new TestDAO();
		list_test = dao.getScoreOfMonth(teasubteavo);
		list_interview = new ArrayList<>();
		list_speech = new ArrayList<>();
		list_write = new ArrayList<>();
		for (int i = 0; i < list_test.size(); i++) {
			list_interview.add(list_test.get(i).getInterview());
			list_speech.add(list_test.get(i).getSpeech());
			list_write.add(list_test.get(i).getWrite());
		}
		return SUCCESS;
	}
	//성적을 수정한다.
	public String eidtMonthGrade() throws Exception {
		TestDAO dao = new TestDAO();
		for (int i = 0; i < id.size(); i++) {
			teasubteavo = new TestSubTeaVO();
			teasubteavo.setTestid(testid.get(i));
			teasubteavo.setId(id.get(i));
			teasubteavo.setWrite(list_write.get(i));
			teasubteavo.setInterview(list_interview.get(i));
			teasubteavo.setSpeech(list_speech.get(i));
			dao.updateGradeMonth(teasubteavo);
		}
		return SUCCESS;
	}
	public List<FlagVO> getList_flag() {
		return list_flag;
	}
	public void setList_flag(List<FlagVO> list_flag) {
		this.list_flag = list_flag;
	}
	public List<String> getList_subject() {
		return list_subject;
	}
	public void setList_subject(List<String> list_subject) {
		this.list_subject = list_subject;
	}
	public TestVO getTestvo() {
		return testvo;
	}
	public void setTestvo(TestVO testvo) {
		this.testvo = testvo;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public List<String> getList_class() {
		return list_class;
	}
	public void setList_class(List<String> list_class) {
		this.list_class = list_class;
	}
	public String getOnline() {
		return online;
	}
	public void setOnline(String online) {
		this.online = online;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public List<TestSubTeaVO> getList_test() {
		return list_test;
	}
	public void setList_test(List<TestSubTeaVO> list_test) {
		this.list_test = list_test;
	}
	public TestSubTeaVO getTeasubteavo() {
		return teasubteavo;
	}
	public void setTeasubteavo(TestSubTeaVO teasubteavo) {
		this.teasubteavo = teasubteavo;
	}
	public String getTestname() {
		return testname;
	}
	public void setTestname(String testname) {
		this.testname = testname;
	}
	
	public List<String> getId() {
		return id;
	}
	public void setId(List<String> id) {
		this.id = id;
	}
	public List<Integer> getScore() {
		return score;
	}
	public void setScore(List<Integer> score) {
		this.score = score;
	}
	public List<String> getGrade() {
		return grade;
	}
	public void setGrade(List<String> grade) {
		this.grade = grade;
	}
	public List<Integer> getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(List<Integer> subjectid) {
		this.subjectid = subjectid;
	}
	public List<Integer> getTestid() {
		return testid;
	}
	public void setTestid(List<Integer> testid) {
		this.testid = testid;
	}
	public int getAlready_testid() {
		return already_testid;
	}
	public void setAlready_testid(int already_testid) {
		this.already_testid = already_testid;
	}
	public List<Object> getList_grade() {
		return list_grade;
	}
	public void setList_grade(List<Object> list_grade) {
		this.list_grade = list_grade;
	}
	public List<String> getList_testname() {
		return list_testname;
	}
	public void setList_testname(List<String> list_testname) {
		this.list_testname = list_testname;
	}
	public boolean isCheck_open() {
		return check_open;
	}
	public void setCheck_open(boolean check_open) {
		this.check_open = check_open;
	}
	public List<Integer> getList_write() {
		return list_write;
	}
	public void setList_write(List<Integer> list_write) {
		this.list_write = list_write;
	}
	public List<Integer> getList_interview() {
		return list_interview;
	}
	public void setList_interview(List<Integer> list_interview) {
		this.list_interview = list_interview;
	}
	public List<Integer> getList_speech() {
		return list_speech;
	}
	public void setList_speech(List<Integer> list_speech) {
		this.list_speech = list_speech;
	}
	public int getTest_seq() {
		return test_seq;
	}
	public void setTest_seq(int test_seq) {
		this.test_seq = test_seq;
	}
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public boolean isCheck() {
		return check;
	}
	public void setCheck(boolean check) {
		this.check = check;
	}
	
}
