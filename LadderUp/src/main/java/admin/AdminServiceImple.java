package admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.NoticeVo;


@Service
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminDao admindao;
	
	@Override
	public boolean login(AdminVo vo, HttpSession sess) {
		AdminVo av = admindao.login(vo);
		if(av!=null) {
			sess.setAttribute("adminInfo", av);
			return true;
		}
		return false;
	}
	
	@Override
	public List<AdminVo> adminList(AdminVo vo){
		return admindao.adminList(vo);
	}

	@Override
	public int adminDelete(String admin_no) {
		return admindao.adminDelete(admin_no);
	}
	
	@Override
	public AdminVo adminView(int admin_no) {
		return admindao.adminSelectOne(admin_no);
	}
	
	@Override
	public AdminVo adminEdit(int admin_no) {
		return admindao.adminSelectOne(admin_no);
	}	
	
	@Override
	public int adminInsert(AdminVo vo) {
		return admindao.adminInsert(vo);
	}
	
	@Override
	public int adminUpdate(AdminVo vo) {
		return admindao.adminUpdate(vo);
	}
	
	@Override
	public int adminCount(AdminVo vo) {
		return admindao.adminCount(vo);
	}
}