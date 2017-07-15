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



}
