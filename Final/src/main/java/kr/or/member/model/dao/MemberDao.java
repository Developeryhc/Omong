package kr.or.member.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.User;
import kr.or.partner.model.vo.Package;
import kr.or.plan.model.vo.Plan;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberDao() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User selectOneMember(User u) {
		return sqlSession.selectOne("member.selectOneMember",u);
	}


	public int insertMember(User u) {
		return sqlSession.insert("member.insertMember", u);
	}


	public int updateMember(User u) {
		return sqlSession.update("member.updateMember", u);
	}
	
	public ArrayList<Plan> selectPlanList(Plan plan) {
		return (ArrayList)sqlSession.selectList("plan.selectPlanList", plan);
	}
	public int pwChangeMember(User u) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.pwChangeMember",u);
	}


	public User memberIdFind(User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.memberIdFind",u);
	}


	public User checkIdName(User u) {
		return sqlSession.selectOne("member.checkIdName",u);
	}


	public int newPw(User u) {
		return sqlSession.update("member.pwChangeMember",u);
	}


	public ArrayList<Package> selectPackageProductList(String keyword) {
		return (ArrayList)sqlSession.selectList("partner.selectPackageProductList", keyword);
	}
}
