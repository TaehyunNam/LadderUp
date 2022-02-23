package board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class CommunityVo extends CommonVo {
	private int community_no; 
	private String community_title; 
	private String community_content;
	private Timestamp community_date;  
	private int admin_no;
	private int user_no;
	private int community_readcount;
	private String admin_name;
	private String user_name;
	private int c_count;
}
