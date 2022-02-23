package question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.SchoolVo;

@Service
public class QuestionServiceImple implements QuestionService {

	@Autowired
	QuestionDao dao;
	
	@Override
	public int insertQuestion(QuestionVo qv) {
		return dao.insertQuestion(qv);
	}
	
	@Override
	public int insertExample(ExampleVo ev) {
		return dao.insertExample(ev);
	}

	@Override
	public List<QuestionVo> selectQuestionlist(QuestionVo qv) {
		return dao.selectQuestionlist(qv);
	}
	@Override
	public List<QuestionVo> selectyear(QuestionVo qv) {
		return dao.selectyear(qv);
	}
	@Override
	public List<AnsweredQuestionVo> viewwords(AnsweredQuestionVo qv) {
		return dao.viewwords(qv);
	}
	@Override
	public List<QuestionVo> showexam(QuestionVo qv) {
		return dao.showexam(qv);
	}
	@Override
	public List<QuestionVo> selectsemester(QuestionVo qv) {
		return dao.selectsemester(qv);
	}
	
	@Override
	public List<ExampleVo> selectExamplelist(ExampleVo ev) {
		return dao.selectExamplelist(ev);
	}
	
	@Override
	public int insertSchool(SchoolVo sv) {
		return dao.insertSchool(sv);
	}

	@Override
	public int insertExam(QuestionVo qv) {
		return dao.insertExam(qv);
	}

	@Override
	public List<QuestionVo> selectexam(QuestionVo qv){
		return dao.selectList(qv);
	}

	@Override
	public QuestionVo selectExam(int exam_no) {
		return dao.selectExam(exam_no);
	}

	@Override
	public int updateQuestion(QuestionVo qv) {
		return dao.updateQuestion(qv);
	}

	@Override
	public int updateExample(ExampleVo ev) {
		return dao.updateExample(ev);
	}

	@Override
	public QuestionVo selectQuestion(int question_no) {
		return dao.selectQuestion(question_no);
	}
	
	@Override
	public List<ExampleVo> selectExample(int question_no) {
		return dao.selectExample(question_no);
	}

	@Override
	public int deleteQuestion(int question_no) {
		return dao.deleteQuestion(question_no);
	}

	/* --------------------USER-------------------- */
	@Override
	public int insertAQ(AnsweredQuestionVo av) {
		return dao.insertAQ(av);
	}

	@Override
	public List<AnsweredQuestionVo> selectAQlist(AnsweredQuestionVo av) {
		return dao.selectAQlist(av);
	}

	@Override
	public List<QuestionVo> randomQuestion(int school_no) {
		return dao.randomQuestion(school_no);
	}

	@Override
	public List<QuestionVo> refQuestion(int question_ref) {
		return dao.refQuestion(question_ref);
	}

	@Override
	public int insertRandom(RandomQuestionVo rv) {
		return dao.insertRandom(rv);
	}

	@Override
	public List<RandomQuestionVo> selectRandom(RandomQuestionVo rv) {
		return dao.selectRandom(rv);
	}

	@Override
	public int insertwords(question.AnsweredQuestionVo qv) {
		return dao.insertwords(qv);
	}	
	
	@Override
	public List<QuestionVo> selectWAlist(QuestionVo qv){
			return dao.selectWAlist(qv);
	}
	
	@Override
	public int delete(int word_no) {
		return dao.delete(word_no);
	}
	
	@Override
	public int wrongCount(QuestionVo qv) {
		return dao.wrongCount(qv);
	}
		
	@Override
	public int noteDelete(String user_no) {
		return dao.noteDelete(user_no);
	}
			
	@Override
	public int noteUpdate(QuestionVo qv) {
		return dao.noteUpdate(qv);
	}
		
}
