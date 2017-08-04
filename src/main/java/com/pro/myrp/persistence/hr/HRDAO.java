package com.pro.myrp.persistence.hr;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.pro.myrp.domain.accounting_management.Salary_register_statementVO;
import com.pro.myrp.domain.base_registration.Order_stateVO;
import com.pro.myrp.domain.hr_management.dto.Calc_salaryDTO;
import com.pro.myrp.domain.hr_management.dto.Hr_appointment_listDTO;
import com.pro.myrp.domain.hr_management.dto.Personnel_cardDTO;
import com.pro.myrp.domain.hr_management.dto.Personnel_card_listDTO;
import com.pro.myrp.domain.hr_management.dto.Personnel_card_salaryDTO;
import com.pro.myrp.domain.hr_management.dto.Retired_EmployeeDTO;
import com.pro.myrp.domain.hr_management.vo.DeptVO;
import com.pro.myrp.domain.hr_management.vo.EmployeeVO;
import com.pro.myrp.domain.hr_management.vo.Employee_infoVO;
import com.pro.myrp.domain.hr_management.vo.Hr_codeVO;
import com.pro.myrp.domain.hr_management.vo.Hr_code_groupVO;
import com.pro.myrp.domain.hr_management.vo.Personnel_appointmentVO;
import com.pro.myrp.domain.hr_management.vo.Retired_employeeVO;
import com.pro.myrp.domain.hr_management.vo.SalaryVO;
import com.pro.myrp.domain.hr_management.vo.Salary_registerVO;
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
	 * @param daoMap [use_state, hr_code_group_id]
	 * @return List [Hr_codeVO]
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
	 * 선택된 번호의 인사코드명 검색
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public String select_hr_code_name(Map<String, Object> daoMap);
	
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
	 * 부서번호로 부서명 검색
	 * @author amaco78
	 * @param dept_id
	 * @return
	 */
	public String select_dept_name(int dept_id);
	
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
	 * 전체 사원 목록 보기
	 * @author amaco78
	 * @return
	 */
	public List<EmployeeVO> select_employees();
	
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

	/**
	 * 사번으로 인사카드 정보 검색
	 * @author amaco78
	 * @param employee_id
	 * @return
	 */
	public Personnel_cardDTO select_personnel_card(int employee_id);

	/**
	 * 인사카드 수정
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int update_employee(EmployeeVO vo);

	/**
	 * 인사카드 정보 수정
	 * @author amaco78
	 * @param vo2
	 * @return
	 */
	public int update_employee_info(Employee_infoVO vo2);

	/**
	 * 검색된 인사발령 정보 총수
	 * @author amaco78
	 * @param searchStr
	 * @return
	 */
	public int select_appointment_cnt(String searchStr);

	/**
	 * 검색어로 선택된 인사발령 정보 검색
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public List<Hr_appointment_listDTO> select_hr_appointment_list(Map<String, Object> daoMap);

	/**
	 * 부서선택시 해당부서 근무사원 검색
	 * @author amaco78
	 * @param dept_id
	 * @return
	 */
	public List<EmployeeVO> select_employee_list_for_dept_id(int dept_id);

	/**
	 * 인사발령 등록
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_personnel_appointment(Personnel_appointmentVO vo);

	/**
	 * 해당 사원의 가장 늦은 발령일자 조회
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public Date select_appointment_date(int employee_id);

	/**
	 * 사원테이블에 인사발령 정보 반영
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public int update_employee_appoint(Map<String, Object> daoMap);

	/**
	 * 해당 사원으 인사발령 목록 조회
	 * @author amaco78
	 * @param employee_id
	 * @return
	 */
	public List<Hr_appointment_listDTO> select_appointment(int employee_id);

	 /** 
	 * 검색된 퇴사자 정보 총수
	 * @author amaco78
	 * @param searchStr
	 * @return
	 */
	public int select_retired_employee_cnt(String searchStr);
	
	/**
	 * 퇴사자 목록 조회
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public List<Retired_EmployeeDTO> select_retired_employee_list(Map<String, Object> daoMap);

	/**
	 * 퇴사자 조회
	 * @author amaco78
	 * @param employee_id
	 * @return
	 */
	public Retired_EmployeeDTO select_retired_employee(int employee_id);
	
	/**
	 * 퇴사자 등록
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_retired_employee(Retired_employeeVO vo);

	/**
	 * 선택된 사원의 부서 이동
	 * @author amaco78
	 * @param dept_no
	 * @return
	 */
	public int update_employee_dept_no(Map<String, Object> daoMap);

	/**
	 * 해당사원의 퇴사정보 목록 조회
	 * @author amaco78
	 * @param employee_id
	 * @return
	 */
	public List<Retired_EmployeeDTO> select_retired_employee_history(int employee_id);

	/**
	 * 검색어를 반영한 급여대장 개수 검색
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public int select_salary_register_cnt(Map<String, Object> daoMap);

	/**
	 * 검색어를 반영한 급여대장 목록 조회
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public List<Salary_registerVO> select_salary_register_list(Map<String, Object> daoMap);

	/**
	 * 급여정보 등록
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_salary_register(Salary_registerVO vo);

	/**
	 * 급여정보 등록2
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_salary_register2(Salary_registerVO vo);

	/**
	 * 승인된 회계전표 조회
	 * @author amaco78
	 * @return
	 */
	public List<Order_stateVO> select_statements_approval();

	/**
	 * 회계전표번호와 연결된 급여전표 목록 조회
	 * @author amaco78
	 * @param salary_register_id
	 * @return
	 */
	public List<Salary_register_statementVO> select_salary_statement(String statement_id);

	/**
	 * 선택된 급여대장번호의 급여대장 정보를 조회
	 * @author amaco78
	 * @param daoMap [salary_register_id, account_id]
	 * @return Salary_registerVO
	 */
	public Salary_registerVO select_salary_register(Map<String, Object> daoMap);
	
	/**
	 * 선택된 급여대장의 급여대장 상태를 변경
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public int update_salary_register_state(Map<String, Object> daoMap);

	/**
	 * 지급대기상태인 급여대장 목록 조회
	 * @author amaco78
	 * @return
	 */
	public List<Salary_registerVO> select_salary_register_for_clear();

	/**
	 * 급여통장의 돈을 변경
	 * @author amaco78
	 * @param pay_money
	 * @return
	 */
	public int update_bank_account_balance(long pay_money);

	/**
	 * 선택된 주문의 주문상태를 초기화
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public int update_order_state(Map<String, Object> daoMap);

	/**
	 * 급여대장 정보 수정
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int update_salary_register(Salary_registerVO vo);

	/**
	 * 급여계산용 인사정보
	 * @author amaco78
	 * @return
	 */
	public List<Calc_salaryDTO> select_calc_salary();

	/**
	 * 개인급여정보 등록
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_salary(SalaryVO vo);

	/**
	 * 급여확정유무 확인
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public int select_fixed_salary(Map<String, Object> daoMap);

	/**
	 * 개인급여정보 조회
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public SalaryVO select_salary(Map<String, Object> daoMap);

	/**
	 * 인사카드 급여이력 조회
	 * @author amaco78
	 * @param daoMap
	 * @return
	 */
	public List<Personnel_card_salaryDTO> select_personnel_card_salary(Map<String, Object> daoMap);

	/**
	 * 주문상태명 조회
	 * @author amaco78
	 * @param salary_state
	 * @return
	 */
	public String select_state(int salary_state);

	/**
	 * 업로드 사진 uid 업데이트
	 * @author amaco78
	 * @param model
	 * @return
	 */
	public int update_employee_picture(Model model);

	/**
	 * 업로드 사진 uid 존재여부 체크
	 * @author amaco78
	 * @param model
	 * @return
	 */
	public int select_employee_picture(Model model);

	/**
	 * 업로드 사진 uid 등록
	 * @author amaco78
	 * @param model
	 * @return
	 */
	public int insert_employee_picture(Model model);

	/**
	 * 사진 pic_uid 조회
	 * @author amaco78
	 * @param employee_id
	 * @return
	 */
	public String select_pic_uid(int employee_id);
}