package com.pro.myrp.persistence.hr;

import java.util.List;
import java.util.Map;

import com.pro.myrp.domain.hr_management.DeptVO;
import com.pro.myrp.domain.hr_management.Hr_codeVO;
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

	/**
	 * 선택된 그룹의 인사코드 목록보기
	 * @author amaco78
	 * @param hr_code_group_id
	 * @return
	 */
	public List<Hr_codeVO> select_hr_codes(int hr_code_group_id);

	/**
	 * 인사코드 그룹의 사용미사용 처리
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public int update_hr_code_group(Map<String, Object> daoMap);

	/**
	 * 선택된 번호의 인사코드 정보 검색
	 * @author amaco78
	 * @param hr_code_id
	 * @return
	 */
	public Hr_codeVO select_hr_code(Map<String, Object> daoMap);

	/**
	 * 인사코드 번호 등록
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_base_code(Hr_codeVO vo);

	/**
	 * 인사코드 정보 수정
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int update_hr_code(Hr_codeVO vo);

	/**
	 * 부서의 총 개수
	 * @author amaco78
	 * @return
	 */
	public int select_dept_cnt();

	/**
	 * 부서 목록 보기
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public List<DeptVO> select_dept_list(Map<String, Object> daoMap);

	/**
	 * 부서번호로 부서 정보 검색
	 * @author amaco78
	 * @param dept_id
	 * @return
	 */
	public DeptVO select_dept(int dept_id);

	/**
	 * 부서 등록 처리
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_dept(DeptVO vo);

	/**
	 * 부서 수정 처리
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int update_dept(DeptVO vo);
}
