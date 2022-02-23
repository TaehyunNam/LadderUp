package payment;

import java.util.List;




public interface PayService {

	List<PayVo> paymentUser(PayVo vo) throws Exception;
	int cancelPay(PayVo vo);
	int cancelPay2(PayVo vo);
	List<PayVo> payList(PayVo vo);
	int payCount(PayVo vo);
}
