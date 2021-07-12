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
import kr.or.plan.model.vo.SharePlan;

@Service
public class PlanService {
	@Autowired
	private PlanDao dao;
	@Transactional
	public int insertPlan(Plan plan, JsonArray list) {
		int planNo = 0;
		int result = 0;
		if(plan.getPlanNo()==0) {
			result = dao.insertPlan(plan);
		}else {
			result = dao.deleteDay(plan.getPlanNo());
		}
		System.out.println(result);
		planNo = plan.getPlanNo();
		int count = result;
		if(result>0) {
			System.out.println(list.size());
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
					count++;
					result += dao.insertDay(d);
				}
			}
		}

		if(result == count) {
			return result;
		}else {
			return -1;
		}
	}
	
	public ArrayList<Plan> selectPlanList(User u, Plan plan) {
		if(u == null) {
			return null;
		}else {
			plan.setPlanMember(u.getNo());
			return dao.selectPlanList(plan);
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
	
	@Transactional
	public int insertOtherPlan(User u, Plan plan) {
		// 공유 테이블 변수 선언 및 insert
		SharePlan sharePlan = new SharePlan();
		sharePlan.setSharePlan(plan.getPlanNo());
		sharePlan.setSharePlanMember(u.getNo());
		int result = dao.insertPlanShare(sharePlan);

		// plan 조회 후 해당 plan 저장
		Plan otherPlan = selectOnePlan(plan);
		otherPlan.setPlanWriter(u.getId());
		
		// 받은 planNo로 해당 days 받아와서 otherDayList 저장
		ArrayList<Day> otherDayList = selectOnePlanDays(plan);
		
		result += dao.insertPlan(otherPlan);
		if(result>1) {
			for(int i=0; i<otherDayList.size(); i++) {
				Day day = new Day();
				day.setDayPlan(otherPlan.getPlanNo());
				day.setDayDate(otherDayList.get(i).getDayDate());
				day.setDayLatitude(otherDayList.get(i).getDayLatitude());
				day.setDayLongitude(otherDayList.get(i).getDayLongitude());
				day.setDayTitle(otherDayList.get(i).getDayTitle());
				day.setDayAddress(otherDayList.get(i).getDayAddress());
				result += dao.insertDay(day);
			}
		}
		if(result == otherDayList.size()+2) {
			return result;
		}else {
			return -1;
		}
	}

	
}
