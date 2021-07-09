package kr.or.admin.model.dao;






import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Admin;
import kr.or.member.model.vo.User;
@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;	

	public AdminDao() {
		super();
		System.out.println("adminDao 생성확인");
	}

	public Admin selectOneAdmin(Admin a) {
		
		return sqlSession.selectOne("admin.selectOneAdmin",a);
	}

	public ArrayList<User> selectAllEmployee() {
		List<User> list = sqlSession.selectList("admin.selectAllEmployee");
		return (ArrayList<User>)list;
	}

	/*
	 * public int selectDeleteEmployee(String chk) { // TODO Auto-generated method
	 * stub return sqlSession.delete("admin.selectDeleteEmployee",chk); }
	 */
	public int selectAllDeleteEmployee(String chk) {
		
		
		return sqlSession.delete("admin.selectAllDeleteEmployee",chk);
	}

	public ArrayList<User> findEmployee1(String searchBox) {
		List<User> list = sqlSession.selectList("admin.findEmployee1",searchBox);
		return (ArrayList<User>)list;
	}

	public ArrayList<User> findEmployee2(String searchBox) {
		List<User> list = sqlSession.selectList("admin.findEmployee2",searchBox);
		return (ArrayList<User>)list;
	}

	public ArrayList<User> findEmployee3(String searchBox) {
		List<User> list = sqlSession.selectList("admin.findEmployee3",searchBox);
		return (ArrayList<User>)list;
	}
}


