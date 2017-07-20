package com.pro.myrp.persistence.sales;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.sales_management.ModifySelectDTO;
import com.pro.myrp.domain.sales_management.SalesDTO;
import com.pro.myrp.domain.sales_management.SalesVO;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int count_quick_serch_sales(String search_str) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.count_quick_serch_sales(search_str);
	}
	

	@Override
	public int select_sales_cnt() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_sales_cnt();
	}

	
	@Override
	public ArrayList<SalesDTO> select_sales_list(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_sales_list(daoMap);
	}


	@Override
	public ArrayList<SalesDTO> select_quick_serch_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_quick_serch_sales(daoMap);
	}


	@Override
	public ArrayList<SalesDTO> select_detail_sales(  Map<String, Object> daoMap ) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_detail_sales(daoMap);
	}


	@Override
	public int update_sales(SalesDTO dto) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.update_sales(dto);
	}


	@Override
	public ArrayList<ModifySelectDTO> select_account() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_account();
	}


	@Override
	public ArrayList<ModifySelectDTO> select_product() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_product();
	}


	@Override
	public ArrayList<ModifySelectDTO> select_company() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_company();
	}


	@Override
	public ArrayList<ModifySelectDTO> select_employee() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_employee();
	}

	
	
}
