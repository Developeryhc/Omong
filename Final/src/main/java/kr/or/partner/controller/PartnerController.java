package kr.or.partner.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.member.model.vo.User;
import kr.or.partner.model.service.PartnerService;
import kr.or.partner.model.vo.Option;
import kr.or.partner.model.vo.Package;
import kr.or.partner.model.vo.PartnerNotice;
import kr.or.partner.model.vo.Product;

@Controller
public class PartnerController {

	@Autowired
	private PartnerService service;

	@RequestMapping(value = "/insertPackage.do")
	public String insertPackage() {
		return "partner/insertPackage";
	}

	

	@RequestMapping(value = "/partnerLogin.do")
	public String login(User u, HttpServletRequest request, Model model ) {
		User partner = service.selectOnePartner(u);

		if (partner != null) {
			if (partner.getYn() == 0) {
				model.addAttribute("msg", "미승인된 아이디 입니다. 직원에게 문의바랍니다.");
				model.addAttribute("loc", "/");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("u", partner);
				int partnerNo = partner.getNo();
				int pacYn = service.selectPackage(partnerNo);
				System.out.println(pacYn);
				session.setAttribute("pacYn", pacYn);
				
				model.addAttribute("msg", "로그인 성공");
				model.addAttribute("loc", "/");
			}
			
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요");
			model.addAttribute("loc", "login.do");
		}
		
		return "common/msg";
	}

	@RequestMapping(value = "/partnerLogout.do")
	public String logout(User u, Model model, HttpSession session) {
		if (session != null) {
			session.invalidate();
			model.addAttribute("msg", "로그아웃 되었습니다.");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	@RequestMapping(value = "/partnerNotice.do")
	public String partnerNotice() {
		return "partner/partnerNotice";
	}

	@RequestMapping(value = "/join_partner.do")
	public String join_partner() {
		return "member/join_partner";
	}

	@RequestMapping(value = "/partnerJoin.do")
	public String partnerJoin(User u, Model model) {
		int result = service.insertPartner(u);
		if (result > 0) {
			model.addAttribute("msg", "회원가입 성공");
		} else {
			model.addAttribute("msg", "회원가입 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	@RequestMapping(value = "/packageInsert.do")
	public String packageInsert(Package pa, Model model, int[] productNum, String[] productName, String[] optionName, String[] optionPrice , MultipartFile mainFiles[] ,MultipartFile subFiles[], HttpServletRequest request  ) {
		
		if(mainFiles[0].isEmpty()) {
			
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/package/");
			for (MultipartFile file : mainFiles) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0 , filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				int count = 0;
				while (true) {
					if(count == 0 ) {
						filepath = onlyFilename + extention;
						
					}else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if(!checkFile.exists()) {
						break;
						
					}
					count++;
				}
				pa.setPackageProductMainPicture(filepath);
				
				/* pa.setPackageProductSubPicture(); */
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
if(subFiles[0].isEmpty()) {
			
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/package/");
			for (MultipartFile file : subFiles) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0 , filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				int count = 0;
				while (true) {
					if(count == 0 ) {
						filepath = onlyFilename + extention;
						
					}else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if(!checkFile.exists()) {
						break;
						
					}
					count++;
				}
				pa.setPackageProductSubPicture(filepath);
				
				/* pa.setPackageProductSubPicture(); */
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
		int packageProduct = service.packageInsert(pa, productNum, productName, optionName, optionPrice);
		if (packageProduct > 0) {
			model.addAttribute("msg", "상품등록이 완료되었습니다.");
		} else {
			model.addAttribute("msg", "상품등록중 오류발생");
		}
		model.addAttribute("loc", "/");
		return "common/msg";

	}
	@RequestMapping(value = "/packageList.do")
	public String packageList(Model model) {
		ArrayList<Package> list = service.packageList();
		/* ArrayList<Product> product = service.prodcutList(); */
		model.addAttribute("list", list);
		/* model.addAttribute("product", product ); */
//		System.out.println(list.get(0).getPackageProductName());
		return "partner/packageList";
	}
	
	@RequestMapping(value = "/packageView.do")
	public String packageView(Model model , int partnerNo) {
		Package packageProduct = service.selectOnePackage(partnerNo);
		model.addAttribute("packageProduct", packageProduct);
		return "partner/packageView";
	}
	@ResponseBody
	@RequestMapping(value = "/selectOption.do" , produces = "application/json;charSet=utf-8")
	public String selectOption(Model model , int selectOption) {
		ArrayList<Option> list = service.selectOption(selectOption);
		return new Gson().toJson(list);
	}
	@RequestMapping(value = "/partnerMypage.do")
	public String partnerMypage(User u , Model model) {
		User user = service.selectOnePartner(u);
		model.addAttribute("u", user);
		return "partner/partnerMypage";
	}
	@RequestMapping(value = "/updatePartner.do")
	public String updatePartner(User u) {
		int result = service.updatePartner(u);
		return "redirect:/partnerMypage.do?partnerId="+u.getId();
	}
	@ResponseBody
	@RequestMapping(value = "/partnerCheckPw.do")
	public String partnerCheckPw(User u) {
		User partner = service.selectOnePartner(u);
		System.out.println(u.getPw());
		System.out.println(u.getId());
		
		if(partner != null) {
			return "1";
		}else{
			return "0";
		}
	}
	@RequestMapping(value = "/partnerDelete.do")
	public String partnerDelete(User u , Model model , HttpSession session) {
		int result = service.deletePartner(u);
		if(result > 0) {
			session.invalidate();
			model.addAttribute("msg", "탈퇴완료");
		}else {
			model.addAttribute("msg" ,"탈퇴실패..");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	
	@RequestMapping(value = "/partnerPwCheck.do")
	public String partnerPwCheck() {
		return "partner/partnerPwCheck";
	}
	@RequestMapping(value = "/partnerPwChange.do")
	public String partnerPwChange(User u , Model model) {
		int result = service.partnerPwChange(u);
		if(result > 0) {
			model.addAttribute("msg", "비밀번호 변경완료");
		}else {
			model.addAttribute("msg", "비밀번호 변경실패");
		}
		model.addAttribute("loc", "/partnerMypage.do?partnerId="+u.getId());
		return "common/msg";
	}
	@RequestMapping(value="/partnerFindId.do")
	public String partnerFindId() {
		return "partner/partnerFindId";
	}
	@RequestMapping(value="/partnerFindPw.do")
	public String partnerFindPw() {
		return "partner/partnerFindPw";
	}
	@RequestMapping(value="/partnerIdFind.do")
	public String partnerIdFind(User u , Model model) {
		User partner = service.partnerIdFind(u);
		if(partner != null) {
			model.addAttribute("msg", "아이디 : " + partner.getId());
		}else {
			model.addAttribute("msg", "입력한 정보와 일치하는 아이디가 존재하지 않습니다");
		}
		model.addAttribute("loc", "/login.do");
		return "common/msg";
	}
	@ResponseBody
	@RequestMapping(value="/partnerIdCheck.do")
	public String partnerIdCheck(User u) {
		User partner = service.selectOnePartner(u);
		if(partner != null) {
			return "1";
		}else {
			return "0";
		}
		 
	}
	@ResponseBody
	@RequestMapping(value="/partnerPhoneCheck.do")
	public String partnerPhone(User u) {
		User partner = service.selectOnePartnerPhone(u);
		if(partner != null) {
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping(value="/noticePartner.do")
	public String partnerNoticeList(int partnerNo , Model model) {
		ArrayList<PartnerNotice> list = service.partnerNoticeList(partnerNo);
		model.addAttribute("list", list);
		model.addAttribute("parnterNo", partnerNo);
		return "partner/partnerNoticeList";
	}
	@RequestMapping(value="/detailNoticePartner.do")
	public String detailNoticePartner(int noticePartnerNo , Model model) {
		PartnerNotice pn = service.detailNoticePartner(noticePartnerNo);
		System.out.println(noticePartnerNo);
		model.addAttribute("pn", pn);
		return "partner/detailNoticePartner";
	}
	
	
}
