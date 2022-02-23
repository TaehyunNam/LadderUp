package payment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.NoticeVo;


@Repository
public class PayDao {

	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<PayVo> paymentUser(PayVo vo) throws Exception {
		return sst.selectList("pay.PaymentRecord", vo);
	}
	
	public int cancelPay(PayVo vo) {
		return sst.update("pay.cancelPay", vo);
	}
	
	public int cancelPay2(PayVo vo) {
		return sst.update("pay.cancelPay2", vo);
	}
	
	public int payCount(PayVo vo) {
		return sst.selectOne("pay.payCount", vo);
	}
	
	public List<PayVo> payList(PayVo vo) {
		return sst.selectList("pay.payList", vo);
	}
}
