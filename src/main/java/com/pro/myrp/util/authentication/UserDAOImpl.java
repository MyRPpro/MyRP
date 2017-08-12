package com.pro.myrp.util.authentication;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.authentication.LoginDTO;
import com.pro.myrp.domain.authentication.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public UserVO login(Map<String, Object> daoMap) throws Exception {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.login(daoMap);
	}

	@Override
	public Object select_retired_employee(int employee_id) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.select_retired_employee(employee_id);
	}

}
