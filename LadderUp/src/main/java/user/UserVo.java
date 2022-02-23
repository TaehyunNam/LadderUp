package user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class UserVo extends CommonVo{
	
	private int user_no;
	private String user_email;
	private String user_pwd;
	private String user_nick;
	private String user_name;
	private String user_tel;
	private Timestamp user_regdate;
	private String zipcode;
	private String addr1;
	private String addr2;
	private int user_grade;
	private int refund;
	private Timestamp pay_date;
	private int due_date;
	private int product_no;
	private int user_exp;
	private String user_rePwd;
	private int user_pwdSel;
}