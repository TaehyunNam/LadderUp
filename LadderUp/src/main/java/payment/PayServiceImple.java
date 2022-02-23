package payment;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.NoticeVo;



@Service
public class PayServiceImple implements PayService{

	@Autowired
	private PayDao payDao;
	

	@Override
	public List<PayVo> paymentUser(PayVo vo) throws Exception {
		return payDao.paymentUser(vo);
	}


	@Override
	public int cancelPay(PayVo vo) {
		return payDao.cancelPay(vo);
	}
	
	@Override
	public int cancelPay2(PayVo vo) {
		return payDao.cancelPay2(vo);
	}
	
	@Override
	public int payCount(PayVo vo) {
		return payDao.payCount(vo);
	}
	
	@Override
	public List<PayVo> payList(PayVo vo) {
		return payDao.payList(vo);
	}


}
