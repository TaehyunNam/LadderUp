package admin;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class AdminVo extends CommonVo {
	
	private int admin_no;
	private String admin_email;
	private String admin_pwd;
	private String admin_name;
	private Timestamp admin_regdate;

}

