package question;

import java.sql.Timestamp;

public class AnsweredQuestionVo {

	private int aq_no;
	private String user_answer;
	private int score;
	private Timestamp answered_date;
	private String memo;
	private int question_no;
	private int user_no;
	private int exam_no;
	private String word;
	private String mean;
	private int word_no;

	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getMean() {
		return mean;
	}
	public void setMean(String mean) {
		this.mean = mean;
	}
	
	public int getAq_no() {
		return aq_no;
	}
	public void setAq_no(int aq_no) {
		this.aq_no = aq_no;
	}
	public String getUser_answer() {
		return user_answer;
	}
	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Timestamp getAnswered_date() {
		return answered_date;
	}
	public void setAnswered_date(Timestamp answered_date) {
		this.answered_date = answered_date;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getExam_no() {
		return exam_no;
	}
	public void setExam_no(int exam_no) {
		this.exam_no = exam_no;
	}
	public int getWord_no() {
		return word_no;
	}
	public void setWord_no(int word_no) {
		this.word_no = word_no;
	}
	
}
