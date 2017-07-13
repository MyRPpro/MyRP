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
	public List<Hr_code_groupVO> select_hr_code_groups();
	
	/**
	 * 인사코드 그룹번호로 인사코드 그룹 검색
	 * @author amaco78
	 * @param hr_code_group_id
	 * @return
	 */
	public Hr_code_groupVO select_hr_code_group(int hr_code_group_id);

	/**
	 * 인사코드 그룹번호 등록
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_base_code_group(Hr_code_groupVO vo);
}
