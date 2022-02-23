package user;

import java.util.List;

import javax.servlet.http.HttpSession;

import question.ExamVo;
import school.SchoolVo;


public interface UserService {

	boolean login(UserVo vo, HttpSession sess);
	String userEmailCheck(String email);
	int insert(UserVo vo);
	int emailDuplicate(String emailDuplicate);
	List<UserVo> userList(UserVo vo);
	int userDelete(String user_no);
	UserVo searchId(UserVo vo);
	UserVo searchPwd(UserVo vo);
	
	
	UserVo userView(int user_no);
	int userCount(UserVo vo);
	UserVo userEdit(int user_no);
	boolean userUpdate(UserVo vo, HttpSession sess);
	int mypageUpdate(UserVo vo);
	int mypageDelete(int user_no);
	

	List<ExamVo> myExamlist(int user_no);
	List<SchoolVo> myRandomExam(int user_no);

}