package vo;

public class JapAvgVO {
	int katakanaAvg;
	int kanjiAvg;
	int writingAvg;
	int readingAvg;
	public int getKatakanaAvg() {
		return katakanaAvg;
	}
	public void setKatakanaAvg(int katakanaAvg) {
		this.katakanaAvg = katakanaAvg;
	}
	public int getKanjiAvg() {
		return kanjiAvg;
	}
	public void setKanjiAvg(int kanjiAvg) {
		this.kanjiAvg = kanjiAvg;
	}
	public int getWritingAvg() {
		return writingAvg;
	}
	public void setWritingAvg(int writingAvg) {
		this.writingAvg = writingAvg;
	}
	public int getReadingAvg() {
		return readingAvg;
	}
	public void setReadingAvg(int readingAvg) {
		this.readingAvg = readingAvg;
	}
	@Override
	public String toString() {
		return "JapAvgVO [katakanaAvg=" + katakanaAvg + ", kanjiAvg="
				+ kanjiAvg + ", writingAvg=" + writingAvg + ", readingAvg="
				+ readingAvg + "]";
	}
}
