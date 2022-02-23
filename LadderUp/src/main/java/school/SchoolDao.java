package school;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SchoolDao {

	@Autowired
	SqlSessionTemplate sst;


	public List<SchoolVo> selectList(SchoolVo sv) {
		List<SchoolVo> list= sst.selectList("question.selectList",sv);
		return list;
	}

	public SchoolVo selectSchool(int school_no) {
		return sst.selectOne("question.selectSchool",school_no);
	}
	
}
