package com.pro.myrp.persistence.basic;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.CompanyVO;

@Repository
public class BasicDAOImpl implements BasicDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int get_company_cnt() {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.get_company_cnt();
	}
	
	@Override
	public ArrayList<CompanyVO> get_company_list(Map<String, Object> daoMap) {
		BasicDAO dao = sqlSession.getMapper(BasicDAO.class);
		return dao.get_company_list(daoMap);
	}

	
}
