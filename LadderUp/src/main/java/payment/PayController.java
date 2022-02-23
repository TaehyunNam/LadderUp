package payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.AdminVo;
import board.NoticeVo;
import util.Pagination;



@Controller
public class PayController {

	@Autowired
	PayService payService;
	
	@GetMapping("/admin/payment/pay.do")
	public String payment(Model model,PayVo vo,HttpServletRequest req, HttpSession sess) throws Exception {
		vo.setAdmin_no(((AdminVo)sess.getAttribute("adminInfo")).getAdmin_no());

		
		
		int totCount = payService.payCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);	
		
		List<PayVo> list = payService.paymentUser(vo);
		model.addAttribute("data",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("pay.do", vo.getPage(), totPage, 10));			
		
		return "admin/payment/index";
	}
	
	@RequestMapping("/admin/payment/cancelPay.do")
	public String cancelPay(Model model, PayVo vo, HttpServletRequest req) {
		int r = payService.cancelPay(vo);
		if(r > 0) {
			model.addAttribute("msg","환불 되었습니다.");
			model.addAttribute("url","pay.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","환불 오류. 다시시도해주세요");
			model.addAttribute("url","pay.do"); //실패했을때 수정페이지 이동 
		}
		return "admin/include/return";
	}
	
	@RequestMapping("/admin/payment/cancelPay2.do")
	public String cancelPay2(Model model, PayVo vo, HttpServletRequest req) {
		int r = payService.cancelPay2(vo);
		if(r > 0) {
			model.addAttribute("msg","거절되었습니다.");
			model.addAttribute("url","pay.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","환불 오류. 다시시도해주세요");
			model.addAttribute("url","pay.do"); //실패했을때 수정페이지 이동 
		}
		return "admin/include/return";
	}
}
