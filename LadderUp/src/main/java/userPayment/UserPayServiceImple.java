package userPayment;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.UserVo;

//import user.UserDao;
//import user.UserVo;




@Service
public class UserPayServiceImple implements UserPayService{

	@Autowired
	private UserPayDao payDao;
//	@Autowired
//	private UserDao userdao;
	

	@Override
	public UserPayVo paymentUser(UserPayVo vo) throws Exception {
		return payDao.paymentUser(vo);
	}
	
	@Override
	public int insert(UserPayVo vo) { // 재정의 
		return payDao.insert(vo);
	}

	@Override
	public boolean refundUpdate(UserPayVo vo, HttpSession sess) {
			payDao.refundUpdate(vo, sess);
			UserVo uv = payDao.refLogin(vo);
			if(uv != null) {
				sess.setAttribute("userInfo", uv);
				return true;
			}
			return false;
	}
	
	@Override
	public boolean pay(UserPayVo vo, HttpSession sess) {
			UserVo uv = payDao.pay(vo);
			if(uv != null) {
				sess.setAttribute("userInfo", uv);
				return true;
			}
			return false;
	}

	@Override
	public boolean userGrade(UserPayVo vo,HttpSession sess) {
		payDao.userGrade(vo);
		UserVo uv = payDao.refLogin(vo);
		if(uv != null) {
			sess.setAttribute("userInfo", uv);
			return true;
		}
		return false;
}



}
