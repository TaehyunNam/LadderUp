package payment;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class PayVo extends CommonVo {

	private int admin_no;
	private String user_name;
	private String user_email;
	private String category;
	private int price;
	private Timestamp pay_date;
	private int refund;
	private int refund_reason;
	private int user_no;
	private int product_no;
	private String merchant_id;
	private String pay_id;
	private int pay_no;
	private int user_grade;
	

}
