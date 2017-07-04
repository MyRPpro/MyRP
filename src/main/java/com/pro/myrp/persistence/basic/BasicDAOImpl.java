package com.pro.myrp.persistence.basic;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BasicDAOImpl implements BasicDAO {

	@Inject
	private SqlSession sqlSession;
}
