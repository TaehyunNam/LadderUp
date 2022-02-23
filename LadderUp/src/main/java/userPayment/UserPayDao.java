package userPayment;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import user.UserVo;




@Repository
public class UserPayDao {

	
	@Autowired
	private SqlSessionTemplate sst;
	
	public UserPayVo paymentUser(UserPayVo vo) throws Exception {
		UserPayVo uv = sst.selectOne("userPay.paymentUser", vo);
		 return uv;
	}
	
	public int insert(UserPayVo vo) {
		int r = -1;
		try {
			r = sst.insert("userPay.payInsert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public int refundUpdate(UserVo uv, HttpSession sess) {
		return sst.update("userPay.refundUpdate", uv);
	}
	
	public int userGrade(UserPayVo vo) {
		return sst.update("userPay.userGrade", vo);
	}
	
	public UserPayVo refLogin(UserPayVo vo) {
		UserPayVo uv = sst.selectOne("userPay.refLogin",vo);
		return uv;
	}
	
	public UserPayVo pay(UserPayVo vo) {
		UserPayVo uv = sst.selectOne("userPay.refLogin",vo);
		return uv;
	}
	public UserPayVo usergr(UserPayVo vo) {
		UserPayVo uv = sst.selectOne("userPay.refLogin",vo);
		return uv;
	}
}
