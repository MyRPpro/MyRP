package com.pro.myrp.persistence.hr;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.hr_management.Hr_code_groupVO;

@Repository
public class HRDAOImpl implements HRDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Hr_code_groupVO> select_hr_code_group() {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_code_group();
	}
}
