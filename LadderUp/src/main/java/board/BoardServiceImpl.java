package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;

	
	// ----------------------- 공지사항 영역 시작 -----------------------

	@Override
	public int noticeCount(NoticeVo vo) {
		return boardDao.noticeCount(vo);
	}
	
	@Override
	public List<NoticeVo> noticeList(NoticeVo vo) {
		return boardDao.noticeList(vo);
	}

	@Override
	public int noticeInsert(NoticeVo vo) {
		return boardDao.noticeInsert(vo);
	}

	@Override
	public NoticeVo noticeView(int notice_no) { 
		boardDao.noticeUpdateReadcount(notice_no);
		return boardDao.noticeSelectOne(notice_no);
	}
	@Override
	public NoticeVo noticeEdit(int notice_no) {
		boardDao.noticeUpdateReadcount(notice_no);
		return boardDao.noticeSelectOne(notice_no);
	}	

	@Override
	public int noticeUpdate(NoticeVo vo) {
		return boardDao.noticeUpdate(vo);
	}
	

	@Override
	public int noticeDelete(String notice_no) { 		
		return boardDao.noticeDelete(notice_no);
	}	 

	// ----------------------- 공지사항 영역 끝 -----------------------
	
	
	
	
	
	// ----------------------- 시험일정 영역 시작 -----------------------
	
		
	@Override
	public int tdCount(TestdateVo vo) {
		return boardDao.tdCount(vo);
	}
	
	@Override
	public List<TestdateVo> tdList(TestdateVo vo) {
		return boardDao.tdList(vo);
	}

	@Override
	public int tdInsert(TestdateVo vo) {
		return boardDao.tdInsert(vo);
	}

	@Override
	public TestdateVo tdView(int td_no) { 
		boardDao.tdUpdateReadcount(td_no);
		return boardDao.tdSelectOne(td_no);
	}
	@Override
	public TestdateVo tdEdit(int td_no) {
		boardDao.tdUpdateReadcount(td_no);
		return boardDao.tdSelectOne(td_no);
	}	

	@Override
	public int tdUpdate(TestdateVo vo) {
		return boardDao.tdUpdate(vo);
	}
	

	@Override
	public int tdDelete(String td_no) { 		
		return boardDao.tdDelete(td_no);
	}		 

	// ----------------------- 시험일정 영역 끝 -----------------------
	
	
	
	
	
	// ----------------------- QnA 영역 시작 -----------------------
		
	@Override
	public int qaCount(QaVo vo) {
		return boardDao.qaCount(vo);
	}
	
	@Override
	public List<QaVo> qaList(QaVo vo) {
		return boardDao.qaList(vo);
	}

	@Override
	public int qaInsert(QaVo vo) {
		return boardDao.qaInsert(vo);
	}

	@Override
	public QaVo qaView(int qa_no) { 
		boardDao.qaUpdateReadcount(qa_no);
		return boardDao.qaSelectOne(qa_no);
	}
	@Override
	public QaVo qaEdit(int qa_no) {
		boardDao.qaUpdateReadcount(qa_no);
		return boardDao.qaSelectOne(qa_no);
	}	

	@Override
	public int qaUpdate(QaVo vo) {
		return boardDao.qaUpdate(vo);
	}
	

	@Override
	public int qaDelete(String qa_no) { 		
		return boardDao.qaDelete(qa_no);
	}
	
	@Override
	public int userQaDelete(QaVo vo) { 		
		return boardDao.userQaDelete(vo);
	}

	// ----------------------- QnA 영역 끝 -----------------------
	
	
	
	
	// ----------------------- 커뮤니티 영역 시작 -----------------------
	
	@Override
	public int communityCount(CommunityVo vo) {
		return boardDao.communityCount(vo);
	}
	
	@Override
	public List<CommunityVo> communityList(CommunityVo vo) {
		return boardDao.communityList(vo);
	}

	@Override
	public int communityInsert(CommunityVo vo) {
		return boardDao.communityInsert(vo);
	}

	@Override
	public CommunityVo communityView(int community_no) { 
		boardDao.communityUpdateReadcount(community_no);
		return boardDao.communitySelectOne(community_no);
	}
	@Override
	public CommunityVo communityEdit(int community_no) {
		boardDao.communityUpdateReadcount(community_no);
		return boardDao.communitySelectOne(community_no);
	}	

	@Override
	public int communityUpdate(CommunityVo vo) {
		return boardDao.communityUpdate(vo);
	}
	

	@Override
	public int communityDelete(String community_no) { 		
		return boardDao.communityDelete(community_no);
	}
	
	@Override
	public int userCommunityDelete(CommunityVo vo) { 		
		return boardDao.userCommunityDelete(vo);
	}

	// ----------------------- 커뮤니티 영역 끝 -----------------------
	
	
	// ----------------------- 공지사항 영역 시작 -----------------------

	@Override
	public int faqCount(FaqVo vo) {
		return boardDao.faqCount(vo);
	}
	
	@Override
	public List<FaqVo> faqList(FaqVo vo) {
		return boardDao.faqList(vo);
	}

	@Override
	public int faqInsert(FaqVo vo) {
		return boardDao.faqInsert(vo);
	}

	@Override
	public FaqVo faqView(int faq_no) { 
		return boardDao.faqSelectOne(faq_no);
	}
	@Override
	public FaqVo faqEdit(int faq_no) {
		return boardDao.faqSelectOne(faq_no);
	}	

	@Override
	public int faqUpdate(FaqVo vo) {
		return boardDao.faqUpdate(vo);
	}
	

	@Override
	public int faqDelete(String faq_no) { 		
		return boardDao.faqDelete(faq_no);
	}	 

	// ----------------------- 공지사항 영역 끝 -----------------------
}
