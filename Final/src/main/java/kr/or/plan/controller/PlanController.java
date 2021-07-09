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
import kr.or.plan.model.vo.Plan;

@Controller
public class PlanController {
	@Autowired
	private PlanService service;
	
	@RequestMapping(value = "/plan.do")
	public String plan(@SessionAttribute(required=false)User u, Plan plan, Model model) {
		// planDay를 구분하기 위해 사용
		// ArrayList 한개로도 가능할듯
		plan.setPlanDay("recommend");
		ArrayList<Plan> recommendList = service.selectPlanList(u, plan);
		plan.setPlanDay("new");
		ArrayList<Plan> newList = service.selectPlanList(u, plan);
		plan.setPlanDay("view");
		ArrayList<Plan> viewList = service.selectPlanList(u, plan);
		if(recommendList == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("loc", "login.do");
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
		}else {
			return "저장 실패. 관리자에게 문의바랍니다. 에러코드 [00pi]";
		}
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
	@RequestMapping(value="/selectAllPlanList.do")
	public String selectAllPlanList(@SessionAttribute(required=false) User u, Plan plan, Model model) {
		ArrayList<Plan> list = service.selectPlanList(u, plan);
		// planDay는 해당 controller에서 recommend, new, view 구분자로 사용
		model.addAttribute("planDay", plan.getPlanDay());
		model.addAttribute("list", list);
		return "/plan/planList";
	}

	@ResponseBody
	@RequestMapping(value="/planLike.do")
	public int planLike(@SessionAttribute(required=false) User u, Plan plan, String likeCheck) {
		int result = service.planLike(u, plan, likeCheck);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertOtherPlan.do")
	public String insertOtherPlan(@SessionAttribute(required=false) User u, Plan plan, Model model) {
		int result = service.insertOtherPlan(u, plan);
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
}
