package user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import question.ExamVo;
import school.SchoolVo;
import userPayment.UserPayVo;


@Repository
public class UserDao {

	@Autowired
	SqlSessionTemplate sst;

	public UserVo login(UserVo vo) {
		UserVo uv = sst.selectOne("user.login",vo);
		return uv;
	}
	public int dueDate(UserVo vo) {
		return sst.update("user.dueDate", vo);
	}

	//이메일 중복체크
	public int userEmailCheck(String email) {
		return sst.selectOne("user.userEmailCheck", email);
	}

	// 회원가입
	public int insert(UserVo vo) {
		return sst.insert("user.insert", vo);
	}
	//
	public UserVo searchId(UserVo vo) {
		return sst.selectOne("user.searchId", vo);
	}
	public UserVo searchPwd(UserVo vo) {
		return sst.selectOne("user.searchPwd", vo);
	}
	public int updateTempPwd(UserVo vo) {
		return sst.update("user.updateTempPwd", vo);
	}
	//
	public String userConfirm(String userConfirm) {
		return sst.selectOne("user.userConfirm", userConfirm);
	}
	
	//이메일 중복체크
	public int emailDuplicate(String emailDuplicate) {
		return sst.selectOne("user.emailDuplicate", emailDuplicate);
	}

	public List<UserVo> userList(UserVo vo) {
		return sst.selectList("user.userList", vo);
	}
	
	public int userDelete(String user_no) {		
		return sst.delete("user.userDelete", user_no);
	}

	public UserVo userSelectOne(int user_no) {
		return sst.selectOne("user.userOne", user_no);
	}
	
	public int userCount(UserVo vo) {
		return sst.selectOne("user.userCount", vo);
	}
	
	public int userUpdate(UserVo vo) {
		return sst.update("user.userUpdate", vo);
	}

	public int mypageUpdate(UserVo vo) {
		return sst.update("user.mypageUpdate", vo);
	}
	

	public int mypageDelete(int user_no) {		
		return sst.delete("user.mypagedelete", user_no);
	}

	public List<ExamVo> myExamlist(int user_no){
		return sst.selectList("user.myExamlist",user_no);
	}
	
	public List<SchoolVo> myRandomExam(int user_no){
		return sst.selectList("user.myRandomExam",user_no);
	}
	
	
	public UserVo reLogin(UserVo vo) {
		UserVo uv = sst.selectOne("user.reLogin",vo);
		return uv;
	}
}