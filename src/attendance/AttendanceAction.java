package attendance;

import java.beans.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import vo.Admin;
import vo.Attendance;
import vo.StatementVo;
import vo.Student;
import vo.Teacher;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AttendanceAction extends ActionSupport implements SessionAware {

	private int flag;
	private String class_num;
	private String year;
	private String month;
	private String day;
	
	private String attendanceinfo;
	
	private List<Student> studentList;
	private List<Attendance> attendanceList;
	
	private List<String> flagList;
	private List<String> class_numList;
	
	// 사유서를 가져오기 위한 키
	private String statement_key;
	// 가져온 사유서를 담을 폼
	private StatementVo statementVo;
	
	private Map<String, Object> session;
	
	
	public String goAttendanceList(){
		System.out.println("goAttendanceList 입니다");
		System.out.println(flag);
		System.out.println(class_num);
		System.out.println(year);
		System.out.println(month);
		
		AttendanceDao attendaceDao = new AttendanceDao();
		flagList = attendaceDao.getFlagList();
		class_numList = attendaceDao.getClass_numList();
		
		Object userSign = session.get("userSign");
		
		if (userSign instanceof Admin) {
			System.out.println("Admin 입니다.");
			return "admin";
		}else if(userSign instanceof Teacher){
			System.out.println("teacher 입니다.");
			return "teacher";
			
		}else if(userSign instanceof Student){
			System.out.println("student 입니다.");
			Student student = (Student)userSign;
			System.out.println(student.getFlagnum()+"aa");
			flag = Integer.parseInt(student.getFlagnum());
			class_num = student.getClass_num();
			return "student";
		}else{
			return SUCCESS;
		}
	}

	// 출석 체크 폼에서 이름만 불러와서 뿌려줄때 사용
	public String getNameList(){
		System.out.println("getNmaeList()");
		System.out.println("getNmaeList()---------------------");
		System.out.println(System.currentTimeMillis());
		
	/*  정확한 시간을 가져온다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM dd");
		System.out.println("-----------------현재시간---------------------");
        Date resultdate = new Date(System.currentTimeMillis());
        System.out.println(sdf.format(resultdate));
		
		*/
		
		System.out.println(flag);
		System.out.println(class_num);
		
		if(month==null) return SUCCESS;
		
		studentList = new AttendanceDao().getListname(flag,class_num);
		
		AttendanceDao attendaceDao = new AttendanceDao();
		month = month.length()==1?"0"+month : month;
		day	  = day.length() == 1?"0"+day   : day;
		
		attendanceList = attendaceDao.getAttendanceList2(flag,class_num,year,month,day);
		
		System.out.println("겟 네임 리스트");
		System.out.println(attendanceList+"bbb");
		System.out.println(studentList);
		
		return SUCCESS;
	}
	
	public String insertAttendance(){
		System.out.println(attendanceinfo);
		System.out.println(attendanceinfo);
		System.out.println(attendanceinfo);
		
		System.out.println("아니 왜 getList가 실행3되냐고 ....");
		String[] attendanceArr = attendanceinfo.split(",");
		System.out.println("attendanceArr 배열의 크기...몇..? >>"+attendanceArr.length);
		
		AttendanceDao attendanceDao = new AttendanceDao();
		for(int i=0;i<attendanceArr.length;i++){
			String[] attendanceAttr =  attendanceArr[i].split("/");
			
			Attendance attendance = new Attendance(attendanceAttr[0],attendanceAttr[1],attendanceAttr[2],Integer.parseInt(attendanceAttr[3]));
			System.out.println(attendance);

			attendanceDao.insertAttendance(attendance);
		}
		return SUCCESS;
	}
	public String updateAttendance(){
		String[] attendanceArr = attendanceinfo.split(",");
		
		AttendanceDao attendanceDao = new AttendanceDao();
		for(int i=0;i<attendanceArr.length;i++){
			String[] attendanceAttr = attendanceArr[i].split("/");
			
			Attendance attendance = new Attendance(attendanceAttr[0],attendanceAttr[1],attendanceAttr[2],Integer.parseInt(attendanceAttr[3]));
			attendanceDao.updateAttendance(attendance);
		}
		return SUCCESS;
	}
	
	public String getAttendanceList1(){
		System.out.println("getAttendanceList입니다.");
		
		if(flag==0||class_num==null){
			return SUCCESS;
		}
		
		studentList = new AttendanceDao().getListname(flag,class_num);
		System.out.println(studentList);
		System.out.println(studentList);
		System.out.println(studentList);
		System.out.println(studentList);
		System.out.println(studentList);
		
		attendanceList = new AttendanceDao().getAttendanceList(flag,class_num,year,month);
		return SUCCESS;
	}
	
	/* 
	 * 
	 * 
	 * 여기서 부터는 사유서에 대한 엑션을 작성한다. 
	 *
	 *
	 * */
	public String statementRead(){
		
		System.out.println(statement_key);
		
		statementVo = new AttendanceDao().getStatement(statement_key);
		 
		return SUCCESS;
	}
	
	public String insertStatement(){
		System.out.println("insertStatement");
		System.out.println(statementVo);
		
		new AttendanceDao().insertStatement(statementVo);
		
		
		
		return SUCCESS;
	}
	public String updateStatement(){
		System.out.println(statementVo+"ooo");
		
		new AttendanceDao().updateStatement(statementVo);
		
		return SUCCESS;		
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getClass_num() {
		return class_num;
	}

	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public List<Student> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}

	public String getAttendanceinfo() {
		return attendanceinfo;
	}
	public void setAttendanceinfo(String attendanceinfo) {
		this.attendanceinfo = attendanceinfo;
	}
	public List<Attendance> getAttendanceList() {
		return attendanceList;
	}
	public void setAttendanceList(List<Attendance> attendanceList) {
		this.attendanceList = attendanceList;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public List<String> getFlagList() {
		return flagList;
	}
	public void setFlagList(List<String> flagList) {
		this.flagList = flagList;
	}
	public List<String> getClass_numList() {
		return class_numList;
	}
	public void setClass_numList(List<String> class_numList) {
		this.class_numList = class_numList;
	}
	public String getStatement_key() {
		return statement_key;
	}
	public void setStatement_key(String statement_key) {
		this.statement_key = statement_key;
	}
	public StatementVo getStatementVo() {
		return statementVo;
	}
	public void setStatementVo(StatementVo statementVo) {
		this.statementVo = statementVo;
	}



	
	
	
}