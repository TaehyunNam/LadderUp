package question;

public class ExamVo {

	private int exam_no;
	private int year;
	private int number_of_questions;
	private int exam_time;
	private int semester;
	private int school_no;
	private String school_name;
	
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public int getExam_no() {
		return exam_no;
	}
	public void setExam_no(int exam_no) {
		this.exam_no = exam_no;
	}
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getNumber_of_questions() {
		return number_of_questions;
	}
	public void setNumber_of_questions(int number_of_questions) {
		this.number_of_questions = number_of_questions;
	}
	public int getExam_time() {
		return exam_time;
	}
	public void setExam_time(int exam_time) {
		this.exam_time = exam_time;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getSchool_no() {
		return school_no;
	}
	public void setSchool_no(int school_no) {
		this.school_no = school_no;
	}
}
