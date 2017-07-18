package com.pro.myrp.persistence.hr;

import java.util.List;
import java.util.Map;

import com.pro.myrp.domain.hr_management.DeptVO;
import com.pro.myrp.domain.hr_management.EmployeeVO;
import com.pro.myrp.domain.hr_management.Employee_infoVO;
import com.pro.myrp.domain.hr_management.Hr_codeVO;
import com.pro.myrp.domain.hr_management.Hr_code_groupVO;
import com.pro.myrp.domain.hr_management.Personnel_cardDTO;
import com.pro.myrp.domain.hr_management.Personnel_card_listDTO;
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
	 * 사용상태를 조건으로 한 선택그룹의 인사코드 목록보기
	 * @author amaco78
	 * @param use_state
	 * @param hr_code_group_id
	 * @return
	 */
	public List<Hr_codeVO> select_used_hr_codes(Map<String, Object> daoMap);
	
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
	 * 사용상태를 조건으로 한 부서 목록 보기
	 * @author amaco78
	 * @param use_state
	 * @return
	 */
	public List<DeptVO> select_used_dept_list(String use_state);
	
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

	/**
	 * 사원의 총 수
	 * @author amaco78
	 * @return
	 */
	public int select_employee_cnt(String searchStr);

	/**
	 * 사번으로 사원 정보 검색
	 * @author amaco78
	 * @param employee_id
	 * @return
	 */
	public EmployeeVO select_employee(int employee_id);
	
	/**
	 * 사원 목록 보기
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public List<EmployeeVO> select_employee_list(Map<String, Object> daoMap);

	/**
	 * 인사카드 목록 보기
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public List<Personnel_card_listDTO> select_personnel_card_list(Map<String, Object> daoMap);

	/**
	 * 인사카드 등록
	 * @author amaco78
	 * @return
	 */
	public int insert_employee(EmployeeVO vo);

	/**
	 * 인사카드 정보 등록
	 * @author amaco78
	 * @param vo2
	 * @return
	 */
	public int insert_employee_info(Employee_infoVO vo2);

	public Personnel_cardDTO select_personnel_card(int employee_id);
}
