package com.pro.myrp.persistence.hr;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class HRDAOImpl implements HRDAO {

	@Inject
	private SqlSession sqlSession;
}
