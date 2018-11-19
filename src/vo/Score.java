package vo;

public class Score {
	
	int test_seq;
	String id;
	int score;
	
	public Score(){}

	public Score(int test_seq, String id, int score) {
		super();
		this.test_seq = test_seq;
		this.id = id;
		this.score = score;
	}

	public int getTest_seq() {
		return test_seq;
	}

	public void setTest_seq(int test_seq) {
		this.test_seq = test_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Score [test_seq=" + test_seq + ", id=" + id + ", score="
				+ score + "]";
	}
	
	
	
	

}
