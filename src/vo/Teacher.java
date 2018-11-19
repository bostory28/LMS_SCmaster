package vo;

public class Teacher {
/*	CREATE TABLE teacher
	(
		id varchar2(20) NOT NULL,
		password varchar2(20) NOT NULL,
		name varchar2(20) NOT NULL,
		phone varchar2(30),
		email varchar2(30),
		type number NOT NULL,
		birth date,
		resum varchar2(200),
		field varchar2(20) DEFAULT 'IT' NOT NULL,
		currentcourse varchar2(50),
		propic varchar2(100),
		confirm number DEFAULT 0,
		PRIMARY KEY (id)
	);*/
	String id;
	String password;
	String name;
	String phone;
	String email;
	int type;
	String birth;
	String resum;
	String field;
	String currentcourse;
	String propic;
	String avapic;
	int confirm;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAvapic() {
		return avapic;
	}
	public void setAvapic(String avapic) {
		this.avapic = avapic;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getResum() {
		return resum;
	}
	public void setResum(String resum) {
		this.resum = resum;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getCurrentcourse() {
		return currentcourse;
	}
	public void setCurrentcourse(String currentcourse) {
		this.currentcourse = currentcourse;
	}
	public String getPropic() {
		return propic;
	}
	public void setPropic(String propic) {
		this.propic = propic;
	}
	public int getConfirm() {
		return confirm;
	}
	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}
	@Override
	public String toString() {
		return "Teacher [id=" + id + ", name=" + name + "]";
	}
}
