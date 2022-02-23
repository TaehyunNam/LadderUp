package admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.NoticeVo;


@Repository
public class AdminDao {

	@Autowired
	SqlSessionTemplate sst;

	//로그인("namespace.id")
	public AdminVo login(AdminVo vo) {
		return sst.selectOne("admin.login",vo);
	}

	public List<AdminVo> adminList(AdminVo vo) {
		return sst.selectList("admin.adminList", vo);
	}
	
	public AdminVo adminSelectOne(int admin_no) {
		return sst.selectOne("admin.adminOne", admin_no);
	}

	public int adminDelete(String admin_no) {		
		return sst.delete("admin.adminDelete", admin_no);
	}

	public int adminInsert(AdminVo vo) {
		int r = -1;
		try {
			r = sst.insert("admin.adminInsert", vo);
		} catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public int adminUpdate(AdminVo vo) {
		return sst.update("admin.adminUpdate", vo);
	}

	public int adminCount(AdminVo vo) {
		return sst.selectOne("admin.adminCount", vo);
	}
	
}


