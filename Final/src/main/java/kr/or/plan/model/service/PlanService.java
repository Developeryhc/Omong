package kr.or.plan.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kr.or.mapPartner.model.vo.MapPartner;
import kr.or.member.model.vo.User;
import kr.or.plan.model.dao.PlanDao;
import kr.or.plan.model.vo.Day;
import kr.or.plan.model.vo.LikePlan;
import kr.or.plan.model.vo.Plan;

@Service
public class PlanService {
	@Autowired
	private PlanDao dao;
	@Transactional
	public int insertPlan(Plan plan, JsonArray list) {
		int planNo = 0;
		if(plan.getPlanNo()==0) {
			dao.insertPlan(plan);
		}else {
			dao.deleteDay(plan.getPlanNo());
		}
		planNo = plan.getPlanNo();
		int result = 0;
		for(int i=0; i<list.size(); i++) {
			JsonObject day = (JsonObject) list.get(i);
			for(int j=0; j<day.size(); j++) {
				Day d = new Day();
				JsonObject spot = (JsonObject) day.get(Integer.toString(j));
				d.setDayPlan(planNo);
				d.setDayDate(i);
				d.setDayLatitude(spot.get("lat").getAsString());
				d.setDayLongitude(spot.get("lng").getAsString());
				d.setDayTitle(spot.get("title").getAsString());
				d.setDayAddress(spot.get("address").getAsString());				
				result += dao.insertDay(d);
			}
		}
		return result;
	}
	
	public ArrayList<Plan> selectRecommendPlanList(User u, Plan plan) {
		if(u == null) {
			return null;
		}else {
			plan.setPlanMember(u.getNo());
			return dao.selectRecommendPlanList(plan);
		}
	}

	public ArrayList<Plan> selectNewPlanList(User u, Plan plan) {
		if(u == null) {
			return null;
		}else {
			plan.setPlanMember(u.getNo());
			return dao.selectNewPlanList(plan);
		}
	}

	public ArrayList<Plan> selectViewPlanList(User u, Plan plan) {
		if(u == null) {
			return null;
		}else {
			plan.setPlanMember(u.getNo());
			return dao.selectViewPlanList(plan);
		}
	}
	@Transactional
	public Plan selectOnePlan(Plan plan) {
		int result = dao.updateViewOnePlan(plan);
		if(result>0) {
			return dao.selectOnePlan(plan);
		}else {
			return null;
		}
	}

	public ArrayList<Day> selectOnePlanDays(Plan plan) {
		return dao.selectOnePlanDays(plan);
	}

	public ArrayList<MapPartner> selectMapPartnerSearch(MapPartner mapPartner) {
		return dao.selectMapPartnerSearch(mapPartner);
	}
	@Transactional
	public int planLike(User user, Plan plan, String likeCheck) {
		int result;
		LikePlan likePlan = new LikePlan();
		likePlan.setLikePlanMember(user.getNo());
		likePlan.setLikePlan(plan.getPlanNo());
		if(likeCheck.equals("1")) {
			result = dao.insertPlanLike(likePlan);
		}else {
			result = dao.deletePlanLike(likePlan);
		}
		return result;
	}

	
}
