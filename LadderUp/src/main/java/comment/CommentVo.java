package comment;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentVo {
	private int c_no;
	private String tablename;
	private String content;
	private int admin_no;
	private String admin_name;
	private int user_no;
	private String user_name;
	private int qa_no;
	private int notice_no;
	private int td_no;
	private int community_no;
	private Timestamp regdate;
	
}
