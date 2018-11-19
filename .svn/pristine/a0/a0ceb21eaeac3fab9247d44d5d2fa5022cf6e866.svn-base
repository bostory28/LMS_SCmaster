package schedule;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import vo.Admin;
import vo.Schedule;
import vo.Student;
import vo.Subject;
import vo.TestVO;

import com.opensymphony.xwork2.ActionSupport;

public class ScheduleAction extends ActionSupport implements SessionAware{

	private String flag;
	private Schedule schedule;

	private List<Subject> subjectList;
	private List<TestVO> testList;
	private List<Schedule> scheduleList;
	
	// 스케쥴 insert 할때 필요함...  이놈들을 객체로 선언 하여 insert!!
	//private String flag;  // 위에이미 선언되어있음
	private String startdate;
	private String enddate;
	private String title;
	private String content;
	// 업데이트를 위해 스케쥴 시퀀스 번호를 알아야 하므로..
	private int schedule_seq;
	
	private Map<String, Object> session;
	
	
	public String goScheduleForm(){
		
		Object userSign = session.get("userSign");
		
		if (userSign instanceof Student) {
			Student student = (Student)userSign;
			System.out.println(student);
			System.out.println(student.getFlagnum()+"123");
			if(student.getFlagnum()=="27"){
				return "27";
			}else if(student.getFlagnum().equals("28")){
				return "28";
			}
		}
		return SUCCESS;
	}
	
	
	
	public String getList(){
		System.out.println("getList() flag : "+flag);
		
		ScheduleDao scheduleDao = new ScheduleDao();
		
		subjectList = scheduleDao.getSubjectList(flag);
		testList  = scheduleDao.getTestList(flag);
		scheduleList = scheduleDao.getScheduleList(flag);
		
		System.out.println(subjectList);
		System.out.println(testList);
		System.out.println(scheduleList);
		
		return SUCCESS;
	}
	
	public String insertSchedule(){	
		
		ScheduleDao scheduleDao = new ScheduleDao();
		
		schedule = new Schedule();
		schedule.setStart_date(startdate);
		schedule.setEnd_date(enddate);
		schedule.setTitle(title);
		schedule.setContent(content);
		schedule.setFlag(flag);
		
		
		scheduleDao.insertSchedule(schedule);
		
		subjectList = scheduleDao.getSubjectList(flag);
		testList  = scheduleDao.getTestList(flag);
		return SUCCESS;
	}
	public String updateSchedule(){
		
		ScheduleDao scheduleDao = new ScheduleDao();
		
		schedule = new Schedule();
		schedule.setSchedule_seq(schedule_seq);
		schedule.setStart_date(startdate);
		schedule.setEnd_date(enddate);
		schedule.setTitle(title);
		schedule.setContent(content);
		
		scheduleDao.updateSchedule(schedule);
		
		subjectList = scheduleDao.getSubjectList(flag);
		testList  = scheduleDao.getTestList(flag);	
		
		return SUCCESS;
	}
	public String deleteSchedule(){
		
		ScheduleDao scheduleDao = new ScheduleDao();
		
		scheduleDao.deleteSchedule(schedule_seq);
		
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	public List<Subject> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(List<Subject> subjectList) {
		this.subjectList = subjectList;
	}

	public List<TestVO> getTestList() {
		return testList;
	}

	public void setTestList(List<TestVO> testList) {
		this.testList = testList;
	}

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public List<Schedule> getScheduleList() {
		return scheduleList;
	}

	public void setScheduleList(List<Schedule> scheduleList) {
		this.scheduleList = scheduleList;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getSchedule_seq() {
		return schedule_seq;
	}

	public void setSchedule_seq(int schedule_seq) {
		this.schedule_seq = schedule_seq;
	}



	
	
}
