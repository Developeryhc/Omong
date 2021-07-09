package kr.or.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.Admin;
import kr.or.member.model.vo.User;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;

	@RequestMapping(value = "/adminLogin1.do")
	public String adminLogin1() {
		return "admin/adminLogin";

	}

	public AdminController() {
		super();
		System.out.println("adminController 생성확인");
	}
	@RequestMapping(value="/goAdminPage.do")
	public String goAdmingPage(HttpSession session, Model model) {
		/* model.addAttribute("loc", "/allEmployee1.do"); */
		return "redirect:/allEmployee1.do";
	}

	@RequestMapping(value = "/adminLogin.do")
	public String adminLogin(Admin a, HttpSession session, Model model) {
		Admin admin = service.selectOneAdmin(a);
		if (admin != null) {
			session.setAttribute("m", admin);
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("loc", "/allEmployee1.do");
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요");

			model.addAttribute("loc", "/adminLogin1.do");
		}
		return "common/msg";
	}

	 @RequestMapping(value="/allEmployee1.do") 
	 public String allEmployee(Model model) {
	  ArrayList<User> list = service.selectAllEmployee(); 
	  model.addAttribute("list",list); 
	  return "admin/adminPage";
	  }
	 
	 @RequestMapping(value="/deleteEmployee1.do")
	 public String selectAllDeleteEmployee(String[] chk,HttpSession session,Model model) {
		 int result = service.selectAllDeleteEmployee(chk);
		 if(result==chk.length) {
			 model.addAttribute("msg","계정정보가 삭제 완료되었습니다.");
		 }else {
			 model.addAttribute("msg","삭제실패");
		 }
		 model.addAttribute("loc","/allEmployee1.do");
		 return "common/msg";
	 }
	 @RequestMapping(value="/findEmployee.do")
	 public String findEmployee(String searchBox,int selectList, Model model) {
			/* System.out.println(selectList+"와"+searchBox+"가 들어왔습니다"); */
		 ArrayList<User> list = service.findEmployee(searchBox,selectList);
		 model.addAttribute("list",list);
		 model.addAttribute("searchBox", searchBox);
		 model.addAttribute("selectList", selectList);
		 return "admin/findEmployee";
	 }
	 
	 
}
