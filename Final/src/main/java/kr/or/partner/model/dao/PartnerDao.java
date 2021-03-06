package kr.or.partner.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.mapPartner.model.vo.MapPartner;
import kr.or.member.model.vo.User;
import kr.or.partner.model.vo.Option;
import kr.or.partner.model.vo.Product;
import kr.or.partner.model.vo.Package;
import kr.or.partner.model.vo.PartnerNotice;

@Repository
public class PartnerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public User selectOnePartner(User u) {
		
		return sqlSession.selectOne("partner.selectOnePartner" ,u);
	}

	public int insertPartner(User u) {
		// TODO Auto-generated method stub
		return sqlSession.insert("partner.insertPartner" , u);
	}

	public int packageInsert(Package pa) {		
		return sqlSession.insert("partner.packageInsert" , pa );
	}

	public int selectPacNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.selectPacNo");
	}

	public int productInsert(Product pro) {
		// TODO Auto-generated method stub
		return sqlSession.insert("partner.productInsert", pro);
	}

	public int selectProNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.selectProNo");
	}

	public int optionInsert(Option op) {
		// TODO Auto-generated method stub
		return sqlSession.insert("partner.optionInsert", op);
	}

	public int selectPackage(int partnerNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.selectPackage" , partnerNo);
	}

	public ArrayList<Package> packageList() {
		List<Package> list = sqlSession.selectList("partner.packageList");
		return (ArrayList<Package>)list;
	}

	public Package selectOnePackage(int partnerNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.selectOnePackage" , partnerNo);
	}

	/*
	 * public ArrayList<Product> productList() { List<Product> list =
	 * sqlSession.selectList("partner.productList"); return
	 * (ArrayList<Product>)list; }
	 */

	public List selectProduct(int packageProductNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("partner.productList" , packageProductNo);
	}

	public List selectOption(int selectOption) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("partner.selectOption" , selectOption);
	}

	public int updatePartner(User u) {
		// TODO Auto-generated method stub
		return sqlSession.update("partner.updatePartner", u);
	}

	public int deletePartner(User u) {
		// TODO Auto-generated method stub
		return sqlSession.delete("partner.deletePartner" , u);
	}

	public int partnerPwChange(User u) {
		// TODO Auto-generated method stub
		return sqlSession.update("partner.partnerPwChange", u);
	}

	public User partnerIdFind(User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.partnerIdFind", u);
	}

	public User selectOnePartnerPhone(User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.selectOnePartnerPhone",u);
	}

	public ArrayList<PartnerNotice> partnerNoticeList(int partnerNo) {
		List<PartnerNotice> list = sqlSession.selectList("partner.partnerNoticeList", partnerNo);
		return (ArrayList<PartnerNotice>)list;
	}

	public PartnerNotice detailNoticePartner(int noticePartnerNo) {
		
		return sqlSession.selectOne("partner.detailNoticePartner" , noticePartnerNo);
	}


	public int insertNoticePartner(PartnerNotice pn) {
		// TODO Auto-generated method stub\
		int result = sqlSession.insert("partner.insertNoticePartner" , pn);
		return result;
	}

	public int selectMapPartner(String mapPartnerId) {
		return sqlSession.selectOne("mapPartner.selectMapPartner", mapPartnerId);
	}

	public int updateMapPartner(MapPartner mapPartner) {
		return sqlSession.update("mapPartner.updateMapPartner", mapPartner);

	}

	public int noticePartnerDelete(int noticePartnerNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("partner.deletePartnerNotice" , noticePartnerNo);
	}

	public int updateNoticePartner(PartnerNotice pn) {
		// TODO Auto-generated method stub
		return sqlSession.update("partner.updateNoticePartner", pn);
	}
	
	/*
	 * public int packageInsert(Package pa, String[] productName, String[]
	 * optionName, String[] optionPrice) { // TODO Auto-generated method stub return
	 * sqlSession.insert("partner.packageInsert" , pa , productName , optionName ,
	 * optionPrice); }
	 */
}
