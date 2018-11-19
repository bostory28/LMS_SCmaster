package vo;

public class SubjectVO {
	private int subject_seq;
	private String id;
	private String subjectname;
	private String flag;
	private String class_num;
	private String start_date;
	private String end_date;
	private String field;
	public SubjectVO() {
		super();
	}
	public SubjectVO(int subject_seq, String id, String subjectname,
			String flag, String class_num, String start_date, String end_date,
			String field) {
		super();
		this.subject_seq = subject_seq;
		this.id = id;
		this.subjectname = subjectname;
		this.flag = flag;
		this.class_num = class_num;
		this.start_date = start_date;
		this.end_date = end_date;
		this.field = field;
	}
	public int getSubject_seq() {
		return subject_seq;
	}
	public void setSubject_seq(int subject_seq) {
		this.subject_seq = subject_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	@Override
	public String toString() {
		return "SubjectVO [subject_seq=" + subject_seq + ", id=" + id
				+ ", subjectname=" + subjectname + ", flag=" + flag
				+ ", class_num=" + class_num + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", field=" + field + "]";
	}
	
}
