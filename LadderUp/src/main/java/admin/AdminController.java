package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import util.Pagination;


@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;
	
	@GetMapping("/admin/login.do")
	public String adminlogin() {
		return "admin/login";
	}
	
	@GetMapping("/admin/index.do")
	public String adminmainpage() {
		return "admin/index";
	}	
	
	@PostMapping("/admin/login.do")
	public String adminloginprocess(AdminVo vo, HttpSession sess, Model model) {
		if(adminservice.login(vo, sess)) {
			return "redirect:/admin/index.do";
		}else {
			model.addAttribute("msg","이메일, 비밀번호를 확인해주세요");
		return "admin/include/return";
		}
	}
	
	@RequestMapping("/admin/logout.do")
	public String logout(Model model, HttpSession sess) {
		sess.invalidate();
		model.addAttribute("msg","로그아웃되었습니다");
		model.addAttribute("url","/question_pool/admin/login.do");
		return "admin/include/return";
	}

	@GetMapping("/admin/admin/index.do")
	public String adminList(Model model, AdminVo vo ) throws Exception {
		
		int totCount = adminservice.adminCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);	

		List<AdminVo> list = adminservice.adminList(vo);
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("index.do", vo.getPage(), totPage, 10));

		return "admin/admin/index";
	}
	
	@RequestMapping("/admin/admin/delete.do")
	public String adminDelete(HttpServletRequest request, AdminVo vo) throws Exception {
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]);
        	adminservice.adminDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}
	
	@GetMapping("/admin/admin/view.do")
	public String adminView(Model model, @RequestParam int admin_no) {
		model.addAttribute("data", adminservice.adminView(admin_no));
		return "admin/admin/view";
	}
	
	@GetMapping("/admin/admin/edit.do")
	public String adminEdit(Model model, @RequestParam int admin_no) {
		model.addAttribute("data", adminservice.adminView(admin_no)); 
		return "admin/admin/edit";
	}
	
	@RequestMapping("/admin/admin/write.do")
	public String adminWrite() {
		return "admin/admin/write";
	}
	
	@PostMapping("/admin/admin/insert.do")
	public String adminInsert(AdminVo vo, HttpServletRequest req, HttpSession sess) {
		
		int r = adminservice.adminInsert(vo);
		System.out.println("r:"+r);
		
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "admin/include/return";
	}

	@PostMapping("/admin/admin/update.do")
	public String adminUpdate(Model model, AdminVo vo, HttpServletRequest req) {

		int res = adminservice.adminUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?admin_no="+vo.getAdmin_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?admin_no="+vo.getAdmin_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}
}