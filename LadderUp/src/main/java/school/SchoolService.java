package school;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SchoolService {
	@Autowired
	SchoolDao dao;

	
	public List<SchoolVo> selectList(SchoolVo vo){
		return dao.selectList(vo);
	}
	
	public SchoolVo selectSchool(int school_no) {
		return dao.selectSchool(school_no);
	}
}
