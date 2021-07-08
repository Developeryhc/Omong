package kr.or.plan.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import kr.or.mapPartner.model.vo.MapPartner;
import kr.or.member.model.vo.User;
import kr.or.plan.model.service.PlanService;
import kr.or.plan.model.vo.Day;
import kr.or.plan.model.vo.LikePlan;
import kr.or.plan.model.vo.Plan;

@Controller
public class PlanController {
	@Autowired
	private PlanService service;
	
	@RequestMapping(value = "/plan.do")
	public String plan(@SessionAttribute(required=false)User u, Plan plan, Model model) {
		ArrayList<Plan> recommendList = service.selectRecommendPlanList(u, plan);
		ArrayList<Plan> newList = service.selectNewPlanList(u, plan);
		ArrayList<Plan> viewList = service.selectViewPlanList(u, plan);
		if(recommendList == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("loc", "member/login");
			return "common/msg";
		}else {
			model.addAttribute("recommendList", recommendList);
			model.addAttribute("newList", newList);
			model.addAttribute("viewList", viewList);
			return "plan/plan";
		}
	}
	// 삭제 예정
	@RequestMapping(value = "/topplanList.do")
	public String topplanList() {
		return "plan/topPlanList";
	}

	@RequestMapping(value = "/planInsert.do")
	public String planInsert() {
		return "plan/planInsert";
	}

	@RequestMapping(value = "/planDetail.do")
	public String planDetail(Plan p, HttpServletRequest request, Model model,HttpSession session) {
		String diff = request.getParameter("diff");
		session.setAttribute("plan", p);
		model.addAttribute("diff", diff);
		return "plan/planDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="insertPlan.do", produces = "text/html;charset=UTF-8")
	public String insertPlan(@SessionAttribute(required=false) Plan plan, String data, Model model) {
		JsonParser parser = new JsonParser();
		JsonArray list = (JsonArray) parser.parse(data);
		int result = service.insertPlan(plan, list);
		if(result>0) {
			return "저장 완료";
		}
		return "저장 실패. 관리자에게 문의바랍니다. 에러코드 [00pi]";
	}
	
	@RequestMapping(value="/selectOnePlan.do")
	public String selectOnePlan(Plan plan, Model model) {
		Plan onePlan = service.selectOnePlan(plan);
		model.addAttribute("onePlan", onePlan);
		return "/plan/planView";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectOnePlanDays.do", produces = "application/json; charset=UTF-8")
	public String selectOnePlanDays(Plan plan, Model model) {
		ArrayList<Day> planDays = service.selectOnePlanDays(plan);
		return new Gson().toJson(planDays);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectMapPartnerSearch.do", produces = "application/json; charset=UTF-8")
	public String selectMapPartnerSearch(MapPartner mapPartner, Model model) {
		ArrayList<MapPartner> list = service.selectMapPartnerSearch(mapPartner);
		return new Gson().toJson(list);
	}
	@RequestMapping(value="/selectRecommendPlanList.do")
	public String selectRecommendPlanList(@SessionAttribute(required=false) User u, Plan plan, Model model) {
		ArrayList<Plan> list = service.selectRecommendPlanList(u, plan);
		model.addAttribute("recommendList",list);
		return "/plan/planList";
	}
	
	@RequestMapping(value="/selectNewPlanList.do")
	public String selectNewPlanList(@SessionAttribute(required=false) User u, Plan plan, Model model) {
		ArrayList<Plan> list = service.selectNewPlanList(u, plan);
		model.addAttribute(list);
		return "/plan/planList";
	}
	
	@RequestMapping(value="/selectViewPlanList.do")
	public String selectViewPlanList(@SessionAttribute(required=false) User u, Plan plan, Model model) {
		ArrayList<Plan> list = service.selectViewPlanList(u, plan);
		model.addAttribute(list);
		return "/plan/planList";
	}
	
	@ResponseBody
	@RequestMapping(value="/planLike.do")
	public int planLike(@SessionAttribute(required=false) User u, Plan plan, String likeCheck) {
		int result = service.planLike(u, plan, likeCheck);
		return result;
	}
	
	@RequestMapping(value="/insertOtherPlan.do")
	public String insertOtherPlan(@SessionAttribute(required=false) User u, Plan plan, Model model) {
		/*
		int result = service.insertOtherPlan(u, plan);
		if(result > 0) {
			model.addAttribute("msg", "담기 완료");
		}else {
			model.addAttribute("msg", "담기 실패, 관리자에게 문의하세요 에러코드 [00CI]");
		}
		*/
		// ajax로 실행할 예정
		return "/common/msg";
	}
}
