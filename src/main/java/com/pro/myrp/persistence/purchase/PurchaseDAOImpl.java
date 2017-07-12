package com.pro.myrp.persistence.purchase;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {

	@Inject
	private SqlSession sqlSession;
}
