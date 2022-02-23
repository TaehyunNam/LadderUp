package admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import board.NoticeVo;


public interface AdminService {

	boolean login(AdminVo vo, HttpSession sess);
	List<AdminVo> adminList(AdminVo vo);
	int adminDelete(String admin_no);
	AdminVo adminView(int admin_no);
	AdminVo adminEdit(int admin_no);
	int adminInsert(AdminVo vo);
	int adminUpdate(AdminVo vo);
	int adminCount(AdminVo vo);

}
