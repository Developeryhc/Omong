package kr.or.omong.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import kr.or.member.model.service.EmployeeService;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.User;
import kr.or.plan.model.vo.Day;
import kr.or.plan.model.vo.Plan;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	public MemberController() {
		super();
		System.out.println("Controller 생성완료");
	}

	@RequestMapping(value = "/map.do")
	public String map() {
		return "map/map";
	}

	@RequestMapping(value = "/schedule.do")
	public String schedule() {
		return "schedule/scheduleList";
	}

	@RequestMapping(value = "/noticeList.do")
	public String noticeList() {
		return "notice/noticeList";
	}

	@RequestMapping(value = "/boardList.do")
	public String boardList() {
		return "board/boardList";
	}

	@RequestMapping(value = "/boardWriteFrm.do")
	public String boardWriteFrm() {
		return "board/boardWriteFrm";
	}

	@RequestMapping(value = "/noticeWriteFrm.do")
	public String noticeWriteFrm() {
		return "notice/noticeWriteFrm";
	}

	@RequestMapping(value = "/noticeView.do")
	public String noticeView() {
		return "notice/noticeView";
	}

	@RequestMapping(value = "/boardView.do")
	public String boardView() {
		return "board/boardView";
	}

	@RequestMapping(value = "/join.do")
	public String join() {
		return "member/join";
	}

	@RequestMapping(value = "/join_user.do")
	public String join_user() {
		return "member/join_user";
	}

	@RequestMapping(value = "/login.do")
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "/basicLogout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/mypage.do")
	public String mypage() {
		return "member/mypage";
	}

	@RequestMapping(value = "/topScheduleList.do")
	public String topScheduleList() {
		return "schedule/topScheduleList";
	}

	@RequestMapping(value = "/scheduleInsert.do")
	public String scheduleInsert() {
		return "schedule/scheduleInsert";
	}

	@RequestMapping(value = "/scheduleDetail.do")
	public String scheduleDetail(Plan p, HttpServletRequest request, Model model,HttpSession session) {
		String diff = request.getParameter("diff");
		session.setAttribute("plan", p);
		model.addAttribute("diff", diff);
		return "schedule/scheduleDetail";
	}
	@ResponseBody
	@RequestMapping(value="/getPlan.do",produces = "application/json;charset=utf-8")
	public String getPlan(@SessionAttribute Plan plan) {
		return new Gson().toJson(plan);
	}

	@RequestMapping(value = "/packageList.do")
	public String packageList() {
		return "partner/packageList";
	}

	@RequestMapping(value = "/memberLogin.do")
	public String login(User u, HttpServletRequest request, Model model) {
		User member = service.selectOneMember(u);
		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("u", member);
			model.addAttribute("msg", "로그인 성공");
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	@RequestMapping(value = "/memberLogout.do")
	public String logout(User u, Model model, HttpSession session) {
		if (session != null) {
			session.invalidate();
			model.addAttribute("msg", "로그아웃 되었습니다");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	@RequestMapping(value = "/joinMember.do")
	public String joinMember(User u, MultipartFile files[], HttpServletRequest request, Model model) {
		u.setBirth(u.getBirth().replaceAll("-", ""));
		System.out.println(u.getProfileImage());
		if (files[0].isEmpty()) {

		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/profile/");
			for (MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention;
					} else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				u.setProfileImage(filepath);
				System.out.println("savepath : " + savePath);
				System.out.println("filepath : " + filepath);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		int result = service.insertMember(u);
		if (result > 0) {
			model.addAttribute("msg", "회원가입 성공");
		} else {
			model.addAttribute("msg", "회원가입 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping(value="insertPlan.do")
	public String insertPlan(Plan p, ArrayList<Day> d, Model model) {
		model.addAttribute("loc", "/");
		return "common/msg";
	}
}