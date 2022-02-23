package user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.BoardService;
import board.NoticeVo;
import question.ExamVo;
import school.SchoolService;
import school.SchoolVo;
import util.Pagination;

@Controller
public class UserController {

	@Autowired
	UserService userservice;
	@Autowired
	BoardService boardService;
	@Autowired
	SchoolService schoolService;
	
	@GetMapping("/user/login.do")
	public String userlogin() {
		return "user/login/login";
	}
	@GetMapping("/user/join.do")
	public String join() {
		return "user/login/join";
	}
	@GetMapping("/user/index.do")
	public String usermainpage(Model model, HttpServletRequest req, NoticeVo vo) throws Exception{
		int totCount = boardService.noticeCount(vo);
		int totPage = totCount / 3; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<NoticeVo> list = boardService.noticeList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("notice.do", vo.getPage(), totPage, 5));
		return "user/index";
	}	
	
	@PostMapping("/user/login.do")
	public String userloginprocess(UserVo vo, HttpSession sess, Model model) {
		model.addAttribute("result",userservice.login(vo, sess));
		return "user/include/result";
	}
	
	@RequestMapping("/user/logoutView.do")
	public String logoutView() {
		return "user/login/logoutView";		
	}
	
	@GetMapping("/user/logout.do")
	public String logOut(Model model, HttpSession sess) {
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "index.do");
		sess.invalidate();
		return "user/include/return";
	}
	

	@GetMapping("/user/userEmailCheck.do")
	public String userEmailCheck(Model model, @RequestParam String email) {
		model.addAttribute("result", userservice.userEmailCheck(email));
		return "user/include/result";
	}
	
	@PostMapping("/user/insert.do")
	public String insert(UserVo vo, HttpServletRequest req) {
		if (userservice.insert(vo) > 0) {
			req.setAttribute("msg", "정상적으로 가입되었습니다.");
			req.setAttribute("url", "/question_pool/user/index.do");
		} else {
			req.setAttribute("msg", "가입오류");
		}
		return "user/include/return";
	}
	
	@GetMapping("/user/emailDuplicate.do")
	public String aaa(Model model, @RequestParam String email) {
		model.addAttribute("result", userservice.emailDuplicate(email));
		return "user/include/result";
	}
	
	//
	@RequestMapping(value="/user/searchId.do", method=RequestMethod.GET)
	public String searchId() {
		return "user/login/searchId";
	}
	@RequestMapping(value="/user/searchId.do", method=RequestMethod.POST)
	public String searchId(Model model, UserVo vo) {
		UserVo uv = userservice.searchId(vo);
		//String email = "";
		//if (uv != null) email = uv.getEmail();
		model.addAttribute("result", uv == null ? "" : uv.getUser_email());
		return "user/include/result";
	}
	
	@RequestMapping(value="/user/searchPwd.do", method=RequestMethod.GET)
	public String searchPwd() {
		return "user/login/searchPwd";
	}
	@RequestMapping(value="/user/searchPwd.do", method=RequestMethod.POST)
	public String searchPwd(Model model, UserVo vo) {
		UserVo uv = userservice.searchPwd(vo);
		//String email = "";
		//if (uv != null) email = uv.getEmail();
		model.addAttribute("result", uv == null ? "" : "ok");
		return "user/include/result";
	}
	
	

	@GetMapping("/admin/member/index.do")
	public String userList(Model model, UserVo vo ) throws Exception {
		
		int totCount = userservice.userCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);	
		
		List<UserVo> list = userservice.userList(vo);
		model.addAttribute("list", list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("index.do", vo.getPage(), totPage, 10));

		return "admin/member/index";
	}

	@RequestMapping("/admin/member/delete.do")
	public String userDelete(HttpServletRequest request, UserVo vo) throws Exception {
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]);
        	userservice.userDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}	
	
	@GetMapping("/admin/member/view.do")
	public String userView(Model model, @RequestParam int user_no) {
		model.addAttribute("data", userservice.userView(user_no));
		return "admin/member/view";
	}
	
	@GetMapping("/admin/member/edit.do")
	public String userEdit(Model model, @RequestParam int user_no) {
		model.addAttribute("data", userservice.userView(user_no)); 
		return "admin/member/edit";
	}
	
	@PostMapping("/admin/member/update.do")
	public String userUpdate(Model model, UserVo vo, HttpServletRequest req, HttpSession sess) {

		boolean res = userservice.userUpdate(vo, sess);
		if (res) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?user_no="+vo.getUser_no()); 
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?user_no="+vo.getUser_no()); 
		}
		return "admin/include/return";
	}
	
	@GetMapping("/user/mypage/index.do")
	public String mypageIndex() {
		return "user/mypage/index";
	}
	
	@GetMapping("/user/mypage/myinfo.do")
	public String mypageMyinfo() {
		return "user/mypage/myinfo";
	}
	
	@PostMapping("/user/mypage/myinfoUpdate.do")
	public String mypageUpdate(Model model, UserVo vo, HttpServletRequest req, HttpSession sess) {

		boolean res = userservice.userUpdate(vo, sess);
		if (res) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do"); 
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "myinfo.do?user_no="+vo.getUser_no()); 
		}
		return "user/include/return";
	}
	

	@GetMapping("/user/mypage/mypwd.do")
	public String updatePwd() {
		return "user/mypage/myPwd";
	}
	
	@GetMapping("/user/mypage/mydelchk.do")
	public String myDelChk() {
		return "user/mypage/myinfoDelChk";
	}
	
	@GetMapping("/user/mypage/delete.do")
	public String mypageDelete(Model model, UserVo vo) {
		model.addAttribute("result", userservice.mypageDelete(vo.getUser_no()));
		return "user/include/result";
	}

	@RequestMapping("/user/mypage/myExams.do")
	public String myExams(HttpServletRequest req, Model model) {
		List<ExamVo> elist = userservice.myExamlist(((UserVo)req.getSession().getAttribute("userInfo")).getUser_no());
		List<SchoolVo> slist = userservice.myRandomExam(((UserVo)req.getSession().getAttribute("userInfo")).getUser_no());
		for(int i=0; i<elist.size(); i++) {
			elist.get(i).setSchool_name((schoolService.selectSchool(elist.get(i).getSchool_no())).getSchool_name());
		}
		model.addAttribute("elist",elist);
		model.addAttribute("slist",slist);
		return "user/mypage/myExams";
	}
	
	@RequestMapping("/user/mypage/payRecord.do")
	public String payRecord() {
		return "user/mypage/payRecord";
	}
}
