package com.pro.myrp.persistence.attitude;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AttitudeDAOImpl implements AttitudeDAO {

	@Inject
	private SqlSession sqlSession;
}
