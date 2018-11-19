package trouble;

import java.util.List;
import java.util.Map;

import vo.Student;
import vo.Teacher;
import vo.Trouble;
import vo.TroubleResponse;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class troubleAction extends ActionSupport {
	String contents;
	String title;
	String today;
	int readKey;
	List<Trouble>troubleLists;
	Trouble trou;
	int counsel_seq;
	String answer;
	String teacherid;
	List<Teacher>teacherLists;
	Teacher teac;
	TroubleResponse tbrp;
	
	public String troubleWrite(){
		teacherLists=new troubleDao().teacherLists();
		return SUCCESS;
	}
	public String answerStudent(){
		trou=new troubleDao().troubleRead(readKey);
		tbrp=new troubleDao().answerStudent(readKey);
		
		return SUCCESS;
	}
	public String troubleInsert(){
		ActionContext context=ActionContext.getContext();
		Map<String, Object>session=context.getSession();
		
		Student stu=(Student) session.get("userSign");
		String studentid=stu.getId();
		Trouble tro=new Trouble(0, studentid, title, contents, today, teacherid, 0);
		System.out.println(tro);
		new troubleDao().troubleInsert(tro);
		return SUCCESS;
	}
	public String troubleStudent(){
		ActionContext context=ActionContext.getContext();
		Map<String, Object>session=context.getSession();
		
		Student stu=(Student) session.get("userSign");
		String studentid=stu.getId();
		troubleLists=new troubleDao().troubleStudent(studentid);
		return SUCCESS;
	}
	public String troubleAnwer(){
		System.out.println("다훈아");
	
		
		
		ActionContext context=ActionContext.getContext();
		Map<String, Object>session=context.getSession();
		
		Teacher trou=(Teacher) session.get("userSign");
		String id=trou.getId();
		
		TroubleResponse trour=new TroubleResponse(0, counsel_seq, id, contents, today);
		
		new troubleDao().insertResponse(trour);
		new troubleDao().updateCheck(counsel_seq);
		
		return SUCCESS;
	}
	public String troubleLists(){
		
		ActionContext context=ActionContext.getContext();
		Map<String, Object>session=context.getSession();
		teac=(Teacher) session.get("userSign");
		String keyValue=teac.getId();
		
		troubleLists=new troubleDao().troubleLists(keyValue);
		System.out.println(troubleLists);
		System.out.println(troubleLists);
		System.out.println(troubleLists);
		
		return SUCCESS;
	}
	public String troubleRead(){
		trou=new troubleDao().troubleRead(readKey);
		
		return SUCCESS;
	}
	public String troubleAdmin(){
		troubleLists=new troubleDao().troubleAdmin();
		return SUCCESS;
	}
	

	public Trouble getTrou() {
		return trou;
	}
	public void setTrou(Trouble trou) {
		this.trou = trou;
	}
	public String getContents() {
		return contents;
	}
	
	
	
	

	public TroubleResponse getTbrp() {
		return tbrp;
	}
	public void setTbrp(TroubleResponse tbrp) {
		this.tbrp = tbrp;
	}
	public String getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}
	public List<Teacher> getTeacherLists() {
		return teacherLists;
	}
	public void setTeacherLists(List<Teacher> teacherLists) {
		this.teacherLists = teacherLists;
	}
	public List<Trouble> getTroubleLists() {
		return troubleLists;
	}
	public void setTroubleLists(List<Trouble> troubleLists) {
		this.troubleLists = troubleLists;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	

	public int getCounsel_seq() {
		return counsel_seq;
	}
	public void setCounsel_seq(int counsel_seq) {
		this.counsel_seq = counsel_seq;
	}
	public int getReadKey() {
		return readKey;
	}
	public void setReadKey(int readKey) {
		this.readKey = readKey;
	}
	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Teacher getTeac() {
		return teac;
	}
	public void setTeac(Teacher teac) {
		this.teac = teac;
	}
	
	
	
}
