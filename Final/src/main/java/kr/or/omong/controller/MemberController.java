package kr.or.omong.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.User;
import kr.or.partner.model.vo.Package;
import kr.or.plan.model.vo.Day;
import kr.or.plan.model.vo.Plan;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	MailSender sender;

	public MemberController() {
		super();
		System.out.println("Controller 생성완료");
	}

	@RequestMapping(value = "/map.do")
	public String map() {
		return "map/map";
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

	@RequestMapping(value = "/findId.do")
	public String findId() {
		return "member/findId";
	}

	@RequestMapping(value = "/findPw.do")
	public String findPw() {
		return "member/findPw";
	}

	@ResponseBody
	@RequestMapping(value = "/getPlan.do", produces = "application/json;charset=utf-8")
	public String getPlan(@SessionAttribute Plan plan) {
		return new Gson().toJson(plan);
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

	@RequestMapping(value = "/memberIdFind.do")
	public String memberIdFind(User u, Model model) {
		User member = service.memberIdFind(u);
		if (member != null) {
			model.addAttribute("msg", "아이디 : " + member.getId());
		} else {
			model.addAttribute("msg", "입력한 정보와 일치하는 아이디가 존재하지 않습니다");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	@RequestMapping(value = "/joinMember.do")
	public String joinMember(User u, MultipartFile files[], HttpServletRequest request, Model model) {
		u.setBirth(u.getBirth().replaceAll("-", ""));
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

	@RequestMapping(value = "/updateMember.do")
	public String updateMember(User u, MultipartFile files[], HttpServletRequest request, Model model, String nofile, HttpSession session) {
		if (files[0].isEmpty()) {
			u.setProfileImage(nofile);
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
		int result = service.updateMember(u);
		if (result > 0) {
			model.addAttribute("msg", "정보변경 성공");
		} else {
			model.addAttribute("msg", "정보변경 실패");
		}
		model.addAttribute("loc", "/");
		session.setAttribute("u", u);
		return "redirect:/mypage.do?email=" + u.getId();
	}

	@ResponseBody
	@RequestMapping(value = "selectPlanList.do")
	public ArrayList<User> selectPlanList(Plan plan, Model model) {
		ArrayList list = service.selectPlanList(plan);
		model.addAttribute("list", list);
		// 여기에 넣을꺼 만들기
		if (list == null) {
			return null;
		} else {
			return list;
		}
	}

	@RequestMapping(value = "/pwCheck.do")
	public String pwCheck() {
		return "member/pwCheck";
	}

	@ResponseBody
	@RequestMapping(value = "/checkPw.do")
	public String checkPw(User u) {
		// 해당하는 아이디의 비밀번호가 일치하는지 확인
		User member = service.selectOneMember(u);
		if (member != null) {
			// 입력한 비밀번호가 일치하는경우
			return "1";
		} else {
			// 비밀번호 틀린경우
			return "0";
		}
	}

	@RequestMapping(value = "/pwChange.do")
	public String pwChange(User u, Model model) {
		int result = service.pwChangeMember(u);
		if (result > 0) {
			model.addAttribute("msg", "변경 성공");
		} else {
			model.addAttribute("msg", "변경 실패");
		}
		model.addAttribute("loc", "/mypage.do?memberId=" + u.getId());
		return "common/msg";
	}

	@ResponseBody
	@RequestMapping(value = "/checkIdName.do")
	public String checkIdName(User u) {
		// 해당하는 아이디의 비밀번호가 일치하는지 확인
		User member = service.checkIdName(u);
		if (member != null) {
			return "1";
		} else {
			// 비밀번호 틀린경우
			return "0";
		}
	}
	@RequestMapping(value="/newPw.do")
	public String newPw(User u) {
		int result = service.newPw(u);
		if (result > 0) {
			return "1";
		} else {
			// 비밀번호 틀린경우
			return "0";
		}
	}
	
	@RequestMapping(value = "/mailSend.do")
	public String mailSend(User u) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(u.getEmail());
		message.setSubject("[오몽]임시비밀번호입니다");
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
				.split(",");
		for (int i = 0; i < 6; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		u.setPw(buffer.toString());
		message.setText("임시비밀번호입니다 ["+buffer.toString()+"] 비밀번호를 변경 후 사용해 주세요");
		message.setFrom("kangbb95@gmail.com");
		sender.send(message);
		String newPw = buffer.toString();
		u.setPw(newPw);
		int result = service.newPw(u);
		return "newPw";
	}
	@ResponseBody
	@RequestMapping(value="/emailCheck")
	public String idCheck(User u) {
		User member = service.selectOneMember(u);
		if(member !=null) {
			return "1";
		}else {
			return "0";
		}
	}
	
	// @07/11 검색
	@RequestMapping(value="/search.do")
	public String searchKeyword(HttpServletRequest request, Model model) {
		String keyword = request.getParameter("keyword");
		ArrayList<Package> packageList = service.selectPackageProductList(keyword);
		// 코드 다용화를 위한 객체 생성
		Plan plan = new Plan();
		// planDay 키워드로 사용
		plan.setPlanDay(keyword);
		ArrayList<Plan> planList = service.selectPlanList(plan);
		model.addAttribute("packageList", packageList);
		model.addAttribute("planList", planList);
		return "/member/searchKeyword";
	}

}