package vo;

public class Detail {
	int detail_seq;
	String detailTitle;
	int subject_seq;
	public int getDetail_seq() {
		return detail_seq;
	}
	public void setDetail_seq(int detail_seq) {
		this.detail_seq = detail_seq;
	}
	public String getDetailTitle() {
		return detailTitle;
	}
	public void setDetailTitle(String detailTitle) {
		this.detailTitle = detailTitle;
	}
	public int getSubject_seq() {
		return subject_seq;
	}
	public void setSubject_seq(int subject_seq) {
		this.subject_seq = subject_seq;
	}
	@Override
	public String toString() {
		return "Detail [detail_seq=" + detail_seq + ", detailTitle="
				+ detailTitle + ", subject_seq=" + subject_seq + "]";
	}
	public Detail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Detail(int detail_seq, String detailTitle, int subject_seq) {
		super();
		this.detail_seq = detail_seq;
		this.detailTitle = detailTitle;
		this.subject_seq = subject_seq;
	}
	
}
