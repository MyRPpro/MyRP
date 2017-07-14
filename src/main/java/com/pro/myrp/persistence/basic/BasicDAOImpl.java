package com.pro.myrp.persistence.basic;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.base_registration.CompanyVO;
import com.pro.myrp.domain.base_registration.ProductVO;

@Repository
public class BasicDAOImpl implements BasicDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int select_company_cnt() {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.select_company_cnt();
	}
	
	@Override
	public ArrayList<CompanyVO> select_company_list(Map<String, Object> daoMap) {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.select_company_list(daoMap);
	}

	@Override
	public int insert_company(CompanyVO vo) {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.insert_company(vo);
	}

	@Override
	public CompanyVO select_company(String company_id) {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.select_company(company_id);
	}

	@Override
	public int update_company(CompanyVO vo) {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.update_company(vo);
	}

	@Override
	public int select_product_cnt() {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.select_product_cnt();
	}


	@Override
	public ArrayList<ProductVO> select_product_list(Map<String, Object> daoMap) {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.select_product_list(daoMap);
	}

	
}
