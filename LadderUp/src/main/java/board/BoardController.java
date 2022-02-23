package board;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import admin.AdminVo;
import comment.CommentService;
import comment.CommentVo;
import user.UserVo;
import util.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	CommentService cService;
	

	@GetMapping("/admin/board/index.do")
	public String adminBoardMain() {
		return "admin/board/notice/notice";
	}
	
	
// ----------------------------- 공지사항 영역 시작 -----------------------------
	
	@RequestMapping("/admin/board/notice/notice.do")
	public String noticeList(Model model, HttpServletRequest req, NoticeVo vo) throws Exception{			
			int totCount = boardService.noticeCount(vo);
			int totPage = totCount / 10; //총페이지수 
			if(totCount % 10 > 0) totPage++;
			
			int startIdx = (vo.getPage()-1)*10;
			vo.setStartIdx(startIdx);				 		
			
			List<NoticeVo> list = boardService.noticeList(vo);
			model.addAttribute("list",list);
			model.addAttribute("totPage",totPage);
			model.addAttribute("totCount",totCount);
			model.addAttribute("pageArea",Pagination.getPageArea("notice.do", vo.getPage(), totPage, 10));			
			return "admin/board/notice/notice";
	}
	
	@GetMapping("/user/board/notice/notice.do")
	public String UserNoticeList(Model model, HttpServletRequest req, NoticeVo vo) throws Exception{			
			int totCount = boardService.noticeCount(vo);
			int totPage = totCount / 10; //총페이지수 
			if(totCount % 10 > 0) totPage++;
			
			int startIdx = (vo.getPage()-1)*10;
			vo.setStartIdx(startIdx);				 		
			
			List<NoticeVo> list = boardService.noticeList(vo);
			model.addAttribute("list",list);
			model.addAttribute("totPage",totPage);
			model.addAttribute("totCount",totCount);
			model.addAttribute("pageArea",Pagination.getPageArea("notice.do", vo.getPage(), totPage, 10));
			return "user/board/notice/notice";
	}
	
	@RequestMapping("/admin/board/notice/write.do")
	public String noticeWrite() {
		return "admin/board/notice/write";
	}
	
	@PostMapping("/admin/board/notice/insert.do")
	public String noticeInsert(NoticeVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		vo.setAdmin_no(((AdminVo)sess.getAttribute("adminInfo")).getAdmin_no());
		
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf("."));
				String notice_file_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+notice_file_real)); 
				vo.setNotice_file_org(filename);
				vo.setNotice_file_real(notice_file_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		int r = boardService.noticeInsert(vo);
		System.out.println("r:"+r);
		
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "notice.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "admin/include/return";
	}
	
	@GetMapping("/admin/board/notice/view.do")
	public String noticeView(Model model, @RequestParam int notice_no) {
		model.addAttribute("data", boardService.noticeView(notice_no));
		return "admin/board/notice/view";
	}
	
	@GetMapping("/user/board/notice/view.do")
	public String noticeViewUser(Model model, @RequestParam int notice_no) {
		model.addAttribute("data", boardService.noticeView(notice_no));
		return "user/board/notice/view";
	}
	
	@GetMapping("/admin/board/notice/edit.do")
	public String noticeEdit(Model model, @RequestParam int notice_no) {
		model.addAttribute("data", boardService.noticeView(notice_no)); 
		return "admin/board/notice/edit";
	}
	
	@PostMapping("/admin/board/notice/update.do")
	public String noticeUpdate(Model model, NoticeVo vo, MultipartFile file, HttpServletRequest req) {
		// 기존파일 삭제 기능
		if (req.getParameter("delCheck") != null) {
			NoticeVo bv = boardService.noticeEdit(vo.getNotice_no());
			File f = new File(req.getRealPath("/upload/")+bv.getNotice_file_real());
			f.delete();
			vo.setNotice_file_org("");
			vo.setNotice_file_real("");
		}
		if (file != null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)				
				String Notice_file_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+Notice_file_real)); // 경로에 파일을 저장
				vo.setNotice_file_org(filename);
				vo.setNotice_file_real(Notice_file_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int res = boardService.noticeUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?notice_no="+vo.getNotice_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?notice_no="+vo.getNotice_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}	
	
	@RequestMapping("/admin/board/notice/delete.do")
	public String noticeDelete(HttpServletRequest request, NoticeVo vo) throws Exception {
		// 단일 및 다중선택 후 삭제 가능하도록 배열 처리
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]);
    		boardService.noticeDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}
// ----------------------------- 공지사항 영역 끝 -----------------------------------------
	
	
	
// ----------------------------- 시험일정 영역 시작 ----------------------------------------
	
	@GetMapping("/admin/board/testdate/testdate.do")
	public String tdList(Model model, HttpServletRequest req, TestdateVo vo) throws Exception{
		
		int totCount = boardService.tdCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<TestdateVo> list = boardService.tdList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("testdate.do", vo.getPage(), totPage, 10));
		return "admin/board/testdate/testdate";
	}
	
	@GetMapping("/user/board/testdate/testdate.do")
	public String userTdList(Model model, HttpServletRequest req, TestdateVo vo) throws Exception{
		
		int totCount = boardService.tdCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<TestdateVo> list = boardService.tdList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("testdate.do", vo.getPage(), totPage, 10));
		return "user/board/testdate/testdate";
	}
	
	@RequestMapping("/admin/board/testdate/write.do")
	public String tdWrite() {
		return "admin/board/testdate/write";
	}
	
	@PostMapping("/admin/board/testdate/insert.do")
	public String tdInsert(TestdateVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		vo.setAdmin_no(((AdminVo)sess.getAttribute("adminInfo")).getAdmin_no());
		
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf("."));
				String td_file_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+td_file_real)); 
				vo.setTd_file_org(filename);
				vo.setTd_file_real(td_file_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		int r = boardService.tdInsert(vo);
		System.out.println("r:"+r);
		
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "testdate.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "admin/include/return";
	}
	
	@GetMapping("/admin/board/testdate/view.do")
	public String tdView(Model model, @RequestParam int td_no) {
		model.addAttribute("data", boardService.tdView(td_no));
		return "admin/board/testdate/view";
	}
	
	@GetMapping("/user/board/testdate/view.do")
	public String userTdView(Model model, @RequestParam int td_no) {
		model.addAttribute("data", boardService.tdView(td_no));
		return "user/board/testdate/view";
	}
	
	@GetMapping("/admin/board/testdate/edit.do")
	public String tdEdit(Model model, @RequestParam int td_no) {
		model.addAttribute("data", boardService.tdView(td_no)); 
		return "admin/board/testdate/edit";
	}
	
	@PostMapping("/admin/board/testdate/update.do")
	public String tdUpdate(Model model, TestdateVo vo, MultipartFile file, HttpServletRequest req) {
		// 기존파일 삭제 기능
		if (req.getParameter("delCheck") != null) {
			TestdateVo bv = boardService.tdEdit(vo.getTd_no());
			File f = new File(req.getRealPath("/upload/")+bv.getTd_file_real());
			f.delete();
			vo.setTd_file_org("");
			vo.setTd_file_real("");
		}
		if (file != null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)				
				String td_file_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+td_file_real)); // 경로에 파일을 저장
				vo.setTd_file_org(filename);
				vo.setTd_file_real(td_file_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int res = boardService.tdUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?td_no="+vo.getTd_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?td_no="+vo.getTd_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}	
	
	@RequestMapping("/admin/board/testdate/delete.do")
	public String tdDelete(HttpServletRequest request, TestdateVo vo) throws Exception {
		// 단일 및 다중선택 후 삭제 가능하도록 배열 처리
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]); 
    		boardService.tdDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}
	
	
// ----------------------------- 시험일정 영역 끝 ---------------------------------------

	
// ----------------------------- QnA 영역 시작 -----------------------------------------

	@GetMapping("/admin/board/qa/qa.do")
	public String qaList(Model model, HttpServletRequest req, QaVo vo) throws Exception{
		int totCount = boardService.qaCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<QaVo> list = boardService.qaList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("qa.do", vo.getPage(), totPage, 10));
		return "admin/board/qa/qa";
	}
	
	@GetMapping({"/user/board/qa/qa.do", "/user/mypage/myboard.do"})
	public String userQaList(Model model, HttpServletRequest req, QaVo vo) throws Exception{		
		String view = "user/board/qa/qa";
		if ("/user/mypage/myboard.do".equals(req.getServletPath())) { // 마이페이지로 접속한 경우
			vo.setUser_no(((UserVo)req.getSession().getAttribute("userInfo")).getUser_no());
			view = "/user/mypage/myboard";
		}
		
		int totCount = boardService.qaCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<QaVo> list = boardService.qaList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		if ("/user/mypage/myboard.do".equals(req.getServletPath())) { // 마이페이지로 접속한 경우
			model.addAttribute("pageArea",Pagination.getPageArea("myboard.do", vo.getPage(), totPage, 10));
		} else {
			model.addAttribute("pageArea",Pagination.getPageArea("qa.do", vo.getPage(), totPage, 10));	
		}
		return view;
	}
	
	@RequestMapping("/admin/board/qa/write.do")
	public String qaWrite() {
		return "admin/board/qa/write";
	}
	
	@RequestMapping("/user/board/qa/write.do")
	public String userQaWrite() {
		return "user/board/qa/write";
	}
	
	@PostMapping("/admin/board/qa/insert.do")
	public String qaInsert(QaVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setAdmin_no(((AdminVo)sess.getAttribute("adminInfo")).getAdmin_no());
		
		int r = boardService.qaInsert(vo);
				
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "qa.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "admin/include/return";
	}
	
	@PostMapping("/user/board/qa/insert.do")
	public String userQaInsert(QaVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUser_no(((user.UserVo)sess.getAttribute("userInfo")).getUser_no());
		
		int r = boardService.qaInsert(vo);
				
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "qa.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "user/include/return";
	}
	
	@GetMapping("/admin/board/qa/view.do")
	public String qaView(Model model, @RequestParam int qa_no) {
		model.addAttribute("data", boardService.qaView(qa_no));
		return "admin/board/qa/view";
	}
	
	@GetMapping("/admin/board/qa/edit.do")
	public String qaEdit(Model model, @RequestParam int qa_no) {
		model.addAttribute("data", boardService.qaView(qa_no)); 
		return "admin/board/qa/edit";
	}
	
	@PostMapping("/admin/board/qa/update.do")
	public String qaUpdate(Model model, QaVo vo) {		
		int res = boardService.qaUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?qa_no="+vo.getQa_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?qa_no="+vo.getQa_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}	
	
	@RequestMapping("/admin/board/qa/delete.do")
	public String qaDelete(HttpServletRequest request, QaVo vo) throws Exception {
		// 단일 및 다중선택 후 삭제 가능하도록 배열 처리
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]); 
    		boardService.qaDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}
	
	@GetMapping({"/user/board/qa/view.do", "/user/mypage/view.do"})
	public String userqaView(Model model, @RequestParam int qa_no) {
		model.addAttribute("data", boardService.qaView(qa_no));
		CommentVo cv = new CommentVo();
		cv.setQa_no(qa_no);
		cv.setTablename("qa");
		model.addAttribute("cList", cService.selectList(cv));
		return "user/board/qa/view";
	}
	
	@GetMapping("/user/board/qa/edit.do")
	public String userqaEdit(Model model, @RequestParam int qa_no) {
		model.addAttribute("data", boardService.qaView(qa_no)); 
		return "user/board/qa/edit";
	}
	
	@PostMapping("/user/board/qa/update.do")
	public String userqaUpdate(Model model, QaVo vo) {		
		int res = boardService.qaUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?qa_no="+vo.getQa_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?qa_no="+vo.getQa_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}
	
	
	@RequestMapping("/user/board/qa/delete.do")
	public String userQaDelete(Model model, QaVo vo) throws Exception {
		int r = boardService.userQaDelete(vo);
		System.out.println("con : "+r);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "qa.do"); // 성공했을때 목록페이지로 이동
		} else {
			model.addAttribute("msg", "삭제 오류");
			model.addAttribute("url", "view.do?qa_no="+vo.getQa_no()); // 실패했을때 상세페이지로 이동
		}
		return "admin/include/return";
	}

// ----------------------------- QnA 영역 끝 ----------------------------------------

	
	
	
	
// ----------------------------- 커뮤니티 영역 시작 -----------------------------------------

	@GetMapping("/admin/board/community/community.do")
	public String communityList(Model model, HttpServletRequest req, CommunityVo vo) throws Exception{
		int totCount = boardService.communityCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<CommunityVo> list = boardService.communityList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("community.do", vo.getPage(), totPage, 10));
		return "admin/board/community/community";
	}
	
	@GetMapping({"/user/board/community/community.do", "/user/mypage/mycomu.do"})
	public String userCommunityList(Model model, HttpServletRequest req, CommunityVo vo) throws Exception{
		String view = "user/board/community/community";
		if ("/user/mypage/mycomu.do".equals(req.getServletPath())) { // 마이페이지로 접속한 경우
			vo.setUser_no(((UserVo)req.getSession().getAttribute("userInfo")).getUser_no());
			view = "/user/mypage/mycomu";
		}
		
		int totCount = boardService.communityCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<CommunityVo> list = boardService.communityList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		if ("/user/mypage/mycomm.do".equals(req.getServletPath())) { // 마이페이지로 접속한 경우
			model.addAttribute("pageArea",Pagination.getPageArea("mycomm.do", vo.getPage(), totPage, 10));
		} else {
			model.addAttribute("pageArea",Pagination.getPageArea("community.do", vo.getPage(), totPage, 10));	
		}
		return view;
	}
	
	@RequestMapping("/admin/board/community/write.do")
	public String communityWrite() {
		return "admin/board/community/write";
	}
	
	@RequestMapping("/user/board/community/write.do")
	public String userCommunityWrite() {
		return "user/board/community/write";
	}
	
	@PostMapping("/user/board/community/insert.do")
	public String communityInsert(CommunityVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUser_no(((user.UserVo)sess.getAttribute("userInfo")).getUser_no());
		
		int r = boardService.communityInsert(vo);
				
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "community.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "admin/include/return";
	}
	
	@GetMapping("/admin/board/community/view.do")
	public String communityView(Model model, @RequestParam int community_no) {
		model.addAttribute("data", boardService.communityView(community_no));
		return "admin/board/community/view";
	}
	
	@GetMapping({"/user/board/community/view.do", "/user/mypage/view2.do"})
	public String userCommunityView(Model model, @RequestParam int community_no) {
		model.addAttribute("data", boardService.communityView(community_no));
		CommentVo cv = new CommentVo();
		cv.setCommunity_no(community_no);
		cv.setTablename("community");
		model.addAttribute("cList", cService.selectList(cv));
		return "user/board/community/view";
	}
	
	@GetMapping("/admin/board/community/edit.do")
	public String communityEdit(Model model, @RequestParam int community_no) {
		model.addAttribute("data", boardService.communityView(community_no)); 
		return "admin/board/community/edit";
	}
	
	@PostMapping("/admin/board/community/update.do")
	public String communityUpdate(Model model, CommunityVo vo) {		
		int res = boardService.communityUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?community_no="+vo.getCommunity_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?community_no="+vo.getCommunity_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}
	
	@GetMapping("/user/board/community/edit.do")
	public String userCommunityEdit(Model model, @RequestParam int community_no) {
		model.addAttribute("data", boardService.communityView(community_no)); 
		return "user/board/community/edit";
	}
	
	@PostMapping("/user/board/community/update.do")
	public String userCommunityUpdate(Model model, CommunityVo vo) {		
		int res = boardService.communityUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?community_no="+vo.getCommunity_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?community_no="+vo.getCommunity_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}
	
	@RequestMapping("/admin/board/community/delete.do")
	public String communityDelete(HttpServletRequest request, CommunityVo vo) throws Exception {
		// 단일 및 다중선택 후 삭제 가능하도록 배열 처리
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]); 
    		boardService.communityDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}
	
	@RequestMapping("/user/board/community/delete.do")
	public String userCommunityDelete(Model model, CommunityVo vo) throws Exception {
		int r = boardService.userCommunityDelete(vo);
		System.out.println("con : "+r);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "community.do"); // 성공했을때 목록페이지로 이동
		} else {
			model.addAttribute("msg", "삭제 오류");
			model.addAttribute("url", "view.do?community_no="+vo.getCommunity_no()); // 실패했을때 상세페이지로 이동
		}
		return "admin/include/return";
	}

// ----------------------------- 커뮤니티 영역 끝 ----------------------------------------
	
	
	
// ----------------------------- FAQ 영역 시작 -----------------------------

	@GetMapping("/admin/board/faq/faq.do")
	public String faqList(Model model, HttpServletRequest req, FaqVo vo) throws Exception{
			
			int totCount = boardService.faqCount(vo);
			int totPage = totCount / 10; //총페이지수 
			if(totCount % 10 > 0) totPage++;
			
			int startIdx = (vo.getPage()-1)*10;
			vo.setStartIdx(startIdx);				 		
			
			List<FaqVo> list = boardService.faqList(vo);
			model.addAttribute("list",list);
			model.addAttribute("totPage",totPage);
			model.addAttribute("totCount",totCount);
			model.addAttribute("pageArea",Pagination.getPageArea("faq.do", vo.getPage(), totPage, 10));			
			return "admin/board/faq/faq";
	}
	
	@GetMapping("/user/board/faq/faq.do")
	public String UserfaqList(Model model, HttpServletRequest req, FaqVo vo) throws Exception{
			
			int totCount = boardService.faqCount(vo);
			int totPage = totCount / 10; //총페이지수 
			if(totCount % 10 > 0) totPage++;
			
			int startIdx = (vo.getPage()-1)*10;
			vo.setStartIdx(startIdx);				 		
			
			List<FaqVo> list = boardService.faqList(vo);
			model.addAttribute("list",list);
			model.addAttribute("totPage",totPage);
			model.addAttribute("totCount",totCount);
			model.addAttribute("pageArea",Pagination.getPageArea("faq.do", vo.getPage(), totPage, 10));
			return "user/board/faq/faq";
	}
	
	@RequestMapping("/admin/board/faq/write.do")
	public String faqWrite() {
		return "admin/board/faq/write";
	}
	
	@PostMapping("/admin/board/faq/insert.do")
	public String faqInsert(FaqVo vo, HttpServletRequest req) {				
		int r = boardService.faqInsert(vo);
		System.out.println("r:"+r);
		
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "faq.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "admin/include/return";
	}
	
	@GetMapping("/admin/board/faq/view.do")
	public String faqView(Model model, @RequestParam int faq_no) {
		model.addAttribute("data", boardService.faqView(faq_no));
		return "admin/board/faq/view";
	}
	
	@GetMapping("/user/board/faq/view.do")
	public String faqViewUser(Model model, @RequestParam int faq_no) {
		model.addAttribute("data", boardService.faqView(faq_no));
		return "user/board/faq/view";
	}
	
	@GetMapping("/admin/board/faq/edit.do")
	public String faqEdit(Model model, @RequestParam int faq_no) {
		model.addAttribute("data", boardService.faqView(faq_no)); 
		return "admin/board/faq/edit";
	}
	
	@PostMapping("/admin/board/faq/update.do")
	public String faqUpdate(Model model, FaqVo vo, HttpServletRequest req) {		
		int res = boardService.faqUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?faq_no="+vo.getFaq_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?faq_no="+vo.getFaq_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}	
	
	@RequestMapping("/admin/board/faq/delete.do")
	public String faqDelete(HttpServletRequest request, FaqVo vo) throws Exception {
		// 단일 및 다중선택 후 삭제 가능하도록 배열 처리
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]);
    		boardService.faqDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}
// ----------------------------- FAQ 영역 끝 -----------------------------------------
}	

