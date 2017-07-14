package com.pro.myrp.persistence.sales;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.SalesVO;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Inject
	private SqlSession sqlSession;
	

	@Override
	public int select_sales_cnt() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_sales_cnt();
	}

	@Override
	public ArrayList<SalesVO> select_sales_list(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_sales_list(daoMap);
	}

}
