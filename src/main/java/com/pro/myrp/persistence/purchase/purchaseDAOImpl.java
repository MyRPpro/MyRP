package com.pro.myrp.persistence.purchase;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.PurchaseVO;

@Repository
public class purchaseDAOImpl implements purchaseDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int select_purchase_cnt() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_purchase_cnt();
	}

	@Override
	public ArrayList<PurchaseVO> select_purchase_list(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_purchase_list(daoMap);
	}

	@Override
	public PurchaseVO select_detail_purchase(String company_id) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_detail_purchase(company_id);
	}

	@Override
	public int update_purchase(PurchaseVO vo) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.update_purchase(vo);
	}
	
	@Override
	public ArrayList<PurchaseVO> select_quick_serch_purchase(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_quick_serch_purchase(daoMap);
	}

	@Override
	public int count_quick_serch_purchase(String search_str) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.count_quick_serch_purchase(search_str);
	}





}
