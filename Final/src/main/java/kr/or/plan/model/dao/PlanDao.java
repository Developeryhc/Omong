package kr.or.plan.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.mapPartner.model.vo.MapPartner;
import kr.or.member.model.vo.User;
import kr.or.plan.model.vo.Day;
import kr.or.plan.model.vo.LikePlan;
import kr.or.plan.model.vo.Plan;
import kr.or.plan.model.vo.SharePlan;

@Repository
public class PlanDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPlan(Plan p) {
		return sqlSession.insert("plan.insertPlan", p);
	}
	public int insertDay(Day d) {
		return sqlSession.insert("plan.insertDay", d);
	}
	public int selectOneDay(int planNo) {
		return sqlSession.selectOne("plan.selectOneDay", planNo);
	}
	public int deleteDay(int planNo) {
		return sqlSession.delete("plan.deleteDay", planNo);
	}
	public ArrayList<Plan> selectPlanList(Plan plan) {
		List list = sqlSession.selectList("plan.selectPlanList", plan);
		return (ArrayList<Plan>)list;
	}
	public Plan selectOnePlan(Plan plan) {
		return sqlSession.selectOne("plan.selectOnePlan", plan);
	}
	public ArrayList<Day> selectOnePlanDays(Plan plan) {
		List list = sqlSession.selectList("plan.selectOnePlanDays", plan); 
		return (ArrayList<Day>)list;
	}
	public int updateViewOnePlan(Plan plan) {
		return sqlSession.update("plan.updateViewOnePlan", plan);
	}
	public ArrayList<MapPartner> selectMapPartnerSearch(MapPartner mapPartner) {
		List list = sqlSession.selectList("mapPartner.selectMapPartnerSearch", mapPartner);
		return (ArrayList<MapPartner>)list;
	}
	public int insertPlanLike(LikePlan likePlan) {
		return sqlSession.insert("plan.insertLikePlan", likePlan);
	}
	public int deletePlanLike(LikePlan likePlan) {
		return sqlSession.delete("plan.deleteLikePlan", likePlan);
	}
	public int insertPlanShare(SharePlan sharePlan) {
		return sqlSession.insert("plan.insertSharePlan", sharePlan);
	}
}
