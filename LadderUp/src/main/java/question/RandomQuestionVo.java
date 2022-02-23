package question;

import java.sql.Timestamp;

public class RandomQuestionVo extends QuestionVo {

	private int random_no;
	private String user_answer;
	private int score;
	private Timestamp answered_date;
	private String memo;
	private int question_no;
	private int user_no;
	private int school_no;
	
	public int getRandom_no() {
		return random_no;
	}
	public void setRandom_no(int random_no) {
		this.random_no = random_no;
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
	public int getSchool_no() {
		return school_no;
	}
	public void setSchool_no(int school_no) {
		this.school_no = school_no;
	}
	
}
