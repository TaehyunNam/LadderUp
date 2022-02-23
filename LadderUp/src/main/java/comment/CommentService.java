package comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	
	@Autowired
	CommentDao commentDao;
	
	public List<CommentVo> selectList(CommentVo vo) {
		return commentDao.selectList(vo);
	}
	
	public List<CommentVo> myList(CommentVo vo) {
		return commentDao.myList(vo);
	}
	
	public int insert(CommentVo vo) {
		return commentDao.insert(vo);
	}
		
	public int delete(int c_no) {
		return commentDao.delete(c_no);
	}
}
