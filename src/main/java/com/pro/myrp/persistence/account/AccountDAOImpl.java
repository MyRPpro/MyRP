package com.pro.myrp.persistence.account;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Inject
	private SqlSession sqlSession;
}
