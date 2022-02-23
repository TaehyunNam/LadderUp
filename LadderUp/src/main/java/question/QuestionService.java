package question;

import java.util.LinkedHashMap;
import java.util.List;

import admin.AdminVo;
import school.SchoolVo;

public interface QuestionService {

	/* Admin */
	int insertQuestion(QuestionVo qv);
	int insertwords(question.AnsweredQuestionVo qv);
	int insertExample(ExampleVo ev);
	QuestionVo selectQuestion(int question_no);
	List<ExampleVo> selectExample(int question_no);
	int updateQuestion(QuestionVo qv);
	int updateExample(ExampleVo ev);
	int deleteQuestion(int question_no);
	int delete(int word_no);
	List<QuestionVo> selectQuestionlist(QuestionVo qv);
	List<AnsweredQuestionVo> viewwords(AnsweredQuestionVo qv);
	List<QuestionVo> selectyear(QuestionVo qv);
	List<QuestionVo> showexam(QuestionVo qv);
	List<QuestionVo> selectsemester(QuestionVo qv);
	List<ExampleVo> selectExamplelist(ExampleVo ev);
	int insertSchool(SchoolVo sv);
	int insertExam(QuestionVo qv);
	QuestionVo selectExam(int exam_no);
	List<QuestionVo> selectexam(QuestionVo qv);
	
	/* USER */
	int insertAQ(AnsweredQuestionVo av);
	List<AnsweredQuestionVo> selectAQlist(AnsweredQuestionVo av);
	List<QuestionVo> randomQuestion(int school_no);
	List<QuestionVo> refQuestion(int question_ref);
	int insertRandom(RandomQuestionVo rv);
	List<RandomQuestionVo> selectRandom(RandomQuestionVo rv);	
	List<QuestionVo> selectWAlist(QuestionVo qv);
	int wrongCount(QuestionVo qv);
	int noteUpdate(QuestionVo qv);
	int noteDelete(String user_no);

	

}
