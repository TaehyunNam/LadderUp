package userPayment;

import javax.servlet.http.HttpSession;


public interface UserPayService {

	UserPayVo paymentUser(UserPayVo vo) throws Exception;
	int insert(UserPayVo vo);
//	int refundUpdate(UserPayVo vo, HttpSession sess);
	boolean refundUpdate(UserPayVo vo, HttpSession sess);
	boolean pay(UserPayVo vo, HttpSession sess);
	boolean userGrade(UserPayVo vo, HttpSession sess);
}
