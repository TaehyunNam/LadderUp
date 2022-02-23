package board;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class FaqVo extends CommonVo {
	private int faq_no;
	private String faq_division;
	private String faq_title; 
	private String faq_content;  
	private int admin_no; 
	private String admin_name;
	
}
