package question;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.AdminVo;
import school.SchoolVo;

@Repository
public class QuestionDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int delete(int word_no) {		
		return sqlSessionTemplate.delete("question.delete", word_no); 
	}

	public List<QuestionVo> selectList(QuestionVo qv) {
		List<QuestionVo> list = sqlSessionTemplate.selectList("question.selectexam", qv);
		return list;
	}

	public int insertQuestion(QuestionVo qv) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_question", qv);
		} catch (Exception e) {
			r = 0;
		}
		return r;
	}

	public int insertExample(ExampleVo ev) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_example", ev);
		} catch (Exception e) {
			r = 0;
		}
		return r;
	}

	public QuestionVo selectQuestion(int question_no) {
		return sqlSessionTemplate.selectOne("question.selectQuestion", question_no);
	}
	
	public List<ExampleVo> selectExample(int question_no) {
		return sqlSessionTemplate.selectList("question.selectExample",question_no);
	}

	public List<AnsweredQuestionVo> viewwords(AnsweredQuestionVo qv) {
		return sqlSessionTemplate.selectList("question.viewwords",qv);
	}

	public int updateQuestion(QuestionVo qv) {
		return sqlSessionTemplate.update("question.updateQuestion", qv);
	}

	public int updateExample(ExampleVo ev) {
		return sqlSessionTemplate.update("question.updateExample", ev);
	}

	public int deleteQuestion(int question_no) {
		return sqlSessionTemplate.delete("question.deleteQuestion", question_no);
	}

	public List<QuestionVo> selectQuestionlist(QuestionVo qv) {
		return sqlSessionTemplate.selectList("question.selectQuestionlist", qv);
	}

	public List<QuestionVo> selectyear(QuestionVo qv) {
		return sqlSessionTemplate.selectList("question.selectyear", qv);
	}

	public List<QuestionVo> selectsemester(QuestionVo qv) {
		return sqlSessionTemplate.selectList("question.selectsemester", qv);
	}
	public List<QuestionVo> showexam(QuestionVo qv) {
		return sqlSessionTemplate.selectList("question.showexam", qv);
	}

	public List<ExampleVo> selectExamplelist(ExampleVo ev) {
		return sqlSessionTemplate.selectList("question.selectExamplelist", ev);
	}

	public int insertSchool(SchoolVo sv) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_school", sv);
		} catch (Exception e) {
			r = 0;
		}
		return r;
	}

	public int insertExam(QuestionVo qv) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_exam", qv);
		} catch (Exception e) {
			r = 0;
		}
		return r;
	}

	public QuestionVo selectExam(int exam_no) {
		return sqlSessionTemplate.selectOne("question.selectExam", exam_no);
	}
	
	public int insertwords(question.AnsweredQuestionVo qv) {
		return sqlSessionTemplate.insert("question.insertwords", qv);
	}
	
	//////////////////////////////////// USER////////////////////////////////////////

	public int insertAQ(AnsweredQuestionVo av) {
		return sqlSessionTemplate.insert("question.insertAQ", av);
	}
	
	public List<AnsweredQuestionVo> selectAQlist(AnsweredQuestionVo av){
		return sqlSessionTemplate.selectList("question.selectAQlist",av);
	}
	
	public List<QuestionVo> randomQuestion(int school_no) {
		return sqlSessionTemplate.selectList("question.randomQuestion",school_no);
	}
	
	public List<QuestionVo> refQuestion(int question_ref){
		return sqlSessionTemplate.selectList("question.refQuestion",question_ref);
	}
	
	public int insertRandom(RandomQuestionVo rv) {
		return sqlSessionTemplate.insert("question.insertRandom",rv);
	}
	
	public List<RandomQuestionVo> selectRandom(RandomQuestionVo rv){
		return sqlSessionTemplate.selectList("question.selectRandom",rv);
	}
	
	public List<QuestionVo> selectWAlist(QuestionVo qv){
		return sqlSessionTemplate.selectList("question.selectWAlist", qv);
	}
	
	public int wrongCount(QuestionVo qv) {
		return sqlSessionTemplate.selectOne("question.wrongCount", qv);
	}
	
	public int noteUpdate(QuestionVo qv) {
		return sqlSessionTemplate.update("question.noteUpdate", qv);
	}
	
	public int noteDelete(String user_no) {		
		return sqlSessionTemplate.delete("question.noteDelete", user_no);
	}

}
