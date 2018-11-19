package vo;

public class Register {
/*	CREATE TABLE register
	(
		subject_seq number NOT NULL,
		id varchar2(20) NOT NULL
	);*/
	int subject_seq;
	String id;
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
}
