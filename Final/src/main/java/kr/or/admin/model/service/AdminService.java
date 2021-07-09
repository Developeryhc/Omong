package kr.or.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.Admin;
import kr.or.member.model.vo.User;
@Service
public class AdminService {
	@Autowired
	private AdminDao dao;
	
	
	public AdminService() {
		super();
	System.out.println("adminSerivce 생성확인");
		
	}
	@Transactional	
	public Admin selectOneAdmin(Admin a) {
		return dao.selectOneAdmin(a);
	}
	@Transactional
	public ArrayList<User> selectAllEmployee() {
		// TODO Auto-generated method stub
		return dao.selectAllEmployee();
	}

	/*
	 * public int selectDeleteEmployee(String chk) { System.out.println("chk : "+
	 * chk); // TODO Auto-generated method stub return
	 * dao.selectDeleteEmployee(chk); }
	 */
	@Transactional
	public int selectAllDeleteEmployee(String[] chk) {
		int result = 0;
		for(int i=0;i<chk.length;i++) {
			String memberId = chk[i];
			result += dao.selectAllDeleteEmployee(memberId);
		}
		return result;
	}
	public ArrayList<Employee> findEmployee(String searchBox, int selectList) {
		if(selectList==1) {
			return dao.findEmployee1(searchBox);
		}else if(selectList==2){
			return dao.findEmployee2(searchBox);
		}
		return dao.findEmployee3(searchBox);
	}
	
}
