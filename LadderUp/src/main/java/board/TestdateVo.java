package board;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class TestdateVo extends CommonVo {
	private int td_no; 
	private String td_title; 
	private String td_content;  
	private Timestamp td_date;  
	private int admin_no; 
	private int td_readcount; 
	private String td_file_org; 
	private String td_file_real;
	private String admin_name;	
	
}
