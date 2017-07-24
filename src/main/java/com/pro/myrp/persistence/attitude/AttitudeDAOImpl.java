package com.pro.myrp.persistence.attitude;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.attitude_management.AttitudeVO;
import com.pro.myrp.persistence.hr.HRDAO;

@Repository
public class AttitudeDAOImpl implements AttitudeDAO {
///
	@Inject
	private SqlSession sqlSession;

	@Override
	public int insert_attitude(AttitudeVO vo) {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.insert_attitude(vo);
	}
}
