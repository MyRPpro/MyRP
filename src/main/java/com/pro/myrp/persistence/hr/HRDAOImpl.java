package com.pro.myrp.persistence.hr;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.hr_management.Hr_codeVO;
import com.pro.myrp.domain.hr_management.Hr_code_groupVO;

@Repository
public class HRDAOImpl implements HRDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Hr_code_groupVO> select_hr_code_groups() {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_code_groups();
	}

	@Override
	public Hr_code_groupVO select_hr_code_group(int hr_code_group_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_code_group(hr_code_group_id);
	}

	@Override
	public int insert_base_code_group(Hr_code_groupVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.insert_base_code_group(vo);
	}

	@Override
	public List<Hr_codeVO> select_hr_codes(int hr_code_group_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_codes(hr_code_group_id);
	}

	@Override
	public int update_hr_code_group(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.update_hr_code_group(daoMap);
	}


	@Override
	public Hr_codeVO select_hr_code(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_code(daoMap);
	}

	@Override
	public int insert_base_code(Hr_codeVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.insert_base_code(vo);
	}
}
