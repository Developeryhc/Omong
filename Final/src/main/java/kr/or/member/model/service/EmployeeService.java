package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.EmployeeDao;
import kr.or.member.model.vo.Employee;
import kr.or.member.model.vo.User;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeDao dao;
	public EmployeeService() {
		super();
		System.out.println("Service 생성");
	}

	public int insertEmployee(User u) {
		return dao.insertEmployee(u);
	}
	
	public User selectOneEmployee(User u) {
		return dao.selectOneEmployee(u);
	}

	public int employeeUpdate(User u) {
		return dao.employeeUpdate(u);
	}

	public ArrayList<User> totalUserList() {
		// TODO Auto-generated method stub
		return dao.totalUserList();
	}


}
