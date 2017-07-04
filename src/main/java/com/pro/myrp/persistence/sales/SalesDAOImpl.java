package com.pro.myrp.persistence.sales;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Inject
	private SqlSession sqlSession;
}
