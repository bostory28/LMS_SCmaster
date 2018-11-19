package vo;

public class OneofTestScore {
/*	select score,testname,startdate from test,score
	where test.test_seq=score.test_seq and score.id=#{id};*/
	int score;
	String testname;
	String startdate;
	String type;
	int write;
	int interview;
	int speech;
	
	/*개인 월말&역량평가의평균과순위*/
	String id;
	double scoreavg; 
	int rank;
	//일본어월말평가
	double writeavg;
	double interviewavg;
	double speechavg;
	int japrank;
	
	public double getWriteavg() {
		return writeavg;
	}
	public void setWriteavg(double writeavg) {
		this.writeavg = writeavg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getInterviewavg() {
		return interviewavg;
	}
	public void setInterviewavg(double interviewavg) {
		this.interviewavg = interviewavg;
	}
	public double getSpeechavg() {
		return speechavg;
	}
	public void setSpeechavg(double speechavg) {
		this.speechavg = speechavg;
	}
	public int getJaprank() {
		return japrank;
	}
	public void setJaprank(int japrank) {
		this.japrank = japrank;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getScoreavg() {
		return scoreavg;
	}
	public void setScoreavg(double scoreavg) {
		this.scoreavg = scoreavg;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getWrite() {
		return write;
	}
	public void setWrite(int write) {
		this.write = write;
	}
	public int getInterview() {
		return interview;
	}
	public void setInterview(int interview) {
		this.interview = interview;
	}
	public int getSpeech() {
		return speech;
	}
	public void setSpeech(int speech) {
		this.speech = speech;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getTestname() {
		return testname;
	}
	public void setTestname(String testname) {
		this.testname = testname;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	@Override
	public String toString() {
		return "OneofTestScore [score=" + score + ", testname=" + testname
				+ ", startdate=" + startdate + "]";
	}
}
