package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.User;
import kr.or.partner.model.vo.Package;
import kr.or.plan.model.vo.Plan;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	
	public MemberService() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User selectOneMember(User u) {
		return dao.selectOneMember(u);
	}
	
	public int insertMember(User u) {
		return dao.insertMember(u);
	}


	public int updateMember(User u) {
		return dao.updateMember(u);
	}


	public ArrayList<Plan> selectPlanList(Plan plan) {
		return dao.selectPlanList(plan);
	}
	@Transactional
	public int pwChangeMember(User u) {
		// TODO Auto-generated method stub
		return dao.pwChangeMember(u);
	}


	public User memberIdFind(User u) {
		return dao.memberIdFind(u);
	}


	public User checkIdName(User u) {
		return dao.checkIdName(u);
	}


	public int newPw(User u) {
		return dao.newPw(u);
	}


	public ArrayList<Package> selectPackageProductList(String keyword) {
		return dao.selectPackageProductList(keyword);
	}

}
