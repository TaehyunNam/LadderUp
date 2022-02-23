package board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	// ----------------------- 공지사항 영역 시작 -----------------------
	
	List<NoticeVo> noticeList(NoticeVo vo);
	int noticeCount(NoticeVo vo);
	int noticeInsert(NoticeVo vo);
	NoticeVo noticeView(int notice_no);
	NoticeVo noticeEdit(int notice_no);
	int noticeUpdate(NoticeVo vo);
	int noticeDelete(String notice_no);
	
	// ----------------------- 공지사항 영역 끝 ------------------------
	
	
	
	// ----------------------- 시험일정 영역 시작 -----------------------
	
	List<TestdateVo> tdList(TestdateVo vo);
	int tdCount(TestdateVo vo);
	int tdInsert(TestdateVo vo);
	TestdateVo tdView(int td_no);
	TestdateVo tdEdit(int td_no);
	int tdUpdate(TestdateVo vo);
	int tdDelete(String td_no);
		
	// ----------------------- 시험일정 영역 끝 -------------------------
	
	
	
	// ----------------------- QnA 영역 시작 -----------------------
	
	List<QaVo> qaList(QaVo vo);
	int qaCount(QaVo vo);
	int qaInsert(QaVo vo);
	QaVo qaView(int qa_no);
	QaVo qaEdit(int qa_no);
	int qaUpdate(QaVo vo);
	int qaDelete(String qa_no);
	int userQaDelete(QaVo vo);
		
	// ----------------------- QnA 영역 끝 -------------------------
	
	
	
	// ----------------------- 커뮤니티 영역 시작 -----------------------
	
	List<CommunityVo> communityList(CommunityVo vo);
	int communityCount(CommunityVo vo);
	int communityInsert(CommunityVo vo);
	CommunityVo communityView(int community_no);
	CommunityVo communityEdit(int community_no);
	int communityUpdate(CommunityVo vo);
	int communityDelete(String community_no);
	int userCommunityDelete(CommunityVo vo);
		
	// ----------------------- 커뮤니티 영역 끝 -------------------------
	
	
	// ----------------------- FAQ 영역 시작 -----------------------
	
	List<FaqVo> faqList(FaqVo vo);
	int faqCount(FaqVo vo);
	int faqInsert(FaqVo vo);
	FaqVo faqView(int faq_no);
	FaqVo faqEdit(int faq_no);
	int faqUpdate(FaqVo vo);
	int faqDelete(String faq_no);
	
	// ----------------------- FAQ 영역 끝 ------------------------
}
