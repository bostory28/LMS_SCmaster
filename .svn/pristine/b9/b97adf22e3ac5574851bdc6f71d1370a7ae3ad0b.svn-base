package vo;

public class Attendance {

	/*
		CREATE TABLE attendance
		(
			id varchar2(20) NOT NULL,
			attendance_date varchar2(30) NOT NULL,
			-- 출석 체크 유무
			-- ex ) 출석 1 지각 2 결석 3
			attendance_check number DEFAULT 1 NOT NULL,
			name varchar2(20) NOT NULL
		);
	*/
	private String id;
	private String name;
	private String attendance_date;
	private int attendance_check;
	public Attendance() {
		super();
	}
	public Attendance(String id, String name, String attendance_date,
			int attendance_check) {
		super();
		this.id = id;
		this.name = name;
		this.attendance_date = attendance_date;
		this.attendance_check = attendance_check;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAttendance_date() {
		return attendance_date;
	}
	public void setAttendance_date(String attendance_date) {
		this.attendance_date = attendance_date;
	}
	public int getAttendance_check() {
		return attendance_check;
	}
	public void setAttendance_check(int attendance_check) {
		this.attendance_check = attendance_check;
	}
	@Override
	public String toString() {
		return "Attendance [id=" + id + ", name=" + name + ", attendance_date="
				+ attendance_date + ", attendance_check=" + attendance_check
				+ "]";
	}
}
