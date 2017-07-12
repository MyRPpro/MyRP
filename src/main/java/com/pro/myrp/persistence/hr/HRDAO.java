package com.pro.myrp.persistence.hr;

import java.util.List;

import com.pro.myrp.domain.hr_management.Hr_code_groupVO;
import com.pro.myrp.persistence.MyRPDAO;

public interface HRDAO extends MyRPDAO {

	/**
	 * 인사코드 그룹 목록보기
	 * @author amaco78
	 * @return
	 */
	public List<Hr_code_groupVO> select_hr_code_group();
}
