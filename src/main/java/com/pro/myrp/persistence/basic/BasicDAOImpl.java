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

	
}
