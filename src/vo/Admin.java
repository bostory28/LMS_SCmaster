package vo;

public class Admin {
/*
	ID                                        NOT NULL VARCHAR2(20)
	PASSWORD                                  NOT NULL VARCHAR2(20)
	NAME                                      NOT NULL VARCHAR2(20)
	PHONE                                     NOT NULL VARCHAR2(30)
	EMAIL                                     NOT NULL VARCHAR2(30)
	TYPE   avapic                                   NOT NULL NUMBER*/
	String id;
	String password;
	String name;
	String phone;
	String email;
	String avapic;
	int type;
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
	public String getAvapic() {
		return avapic;
	}
	public void setAvapic(String avapic) {
		this.avapic = avapic;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + "]";
	}
}
