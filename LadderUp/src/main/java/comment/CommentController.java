package comment;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import user.UserVo;

@Controller
public class CommentController {

	@Autowired
	CommentService service;
	
	@PostMapping("/comment/insert.do")
	public String insert(Model model, CommentVo vo) {
		model.addAttribute("result", service.insert(vo));
		return "admin/include/result";
	}
	
	@GetMapping("/comment/list.do")
	public String list(Model model, CommentVo vo) {		
		model.addAttribute("cList", service.selectList(vo));
		return "admin/include/commentList";
	}
	
	@GetMapping("/user/mypage/mycomment.do")
	public String mylist(Model model, HttpServletRequest req, CommentVo vo) {		
		vo.setUser_no(((UserVo)req.getSession().getAttribute("userInfo")).getUser_no());		
		model.addAttribute("cList", service.myList(vo));
		return "/user/mypage/mycomment";
	}
	
	@GetMapping("/comment/delete.do")	
	public String delete(Model model, CommentVo vo) {
		model.addAttribute("result", service.delete(vo.getC_no()));
		return "admin/include/result";
	}
}
