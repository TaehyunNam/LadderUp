package comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommentVo> selectList(CommentVo cv) {
		return sqlSessionTemplate.selectList("comment.selectList", cv);
	}
	
	public List<CommentVo> myList(CommentVo cv) {
		return sqlSessionTemplate.selectList("comment.myList", cv);
	}
	
	public int insert(CommentVo cv) {
		return sqlSessionTemplate.insert("comment.insert", cv);
	}
	
	public int delete(int c_no) {		
		return sqlSessionTemplate.delete("comment.delete", c_no); 
	}
}
