package com.pro.myrp.controller.hr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.pro.myrp.controller.MyRPController;
import com.pro.myrp.domain.hr_management.FileDTO;
import com.pro.myrp.domain.hr_management.vo.EmployeeVO;

public interface HRController extends MyRPController {

	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 그룹 목록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 */
	public String base_code_group_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 그룹 등록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_base_code_group(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 그룹 번호 중복확인
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_base_code_group_dupCheck(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 그룹 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_base_code_group_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 그룹 수정하기
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_base_code_group(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 그룹 수정 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_base_code_group_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사코드 관리 > 그룹별 인사코드 목록보기
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String base_code_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 등록화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_base_code(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 번호 중복확인
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_base_code_dupCheck(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_base_code_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 관리 > 인사코드 수정화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Excetpion
	 */
	public String modify_base_code(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인시코드 관리 > 인사코드 수정처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_base_code_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 부서관리 > 부서목록보기
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String dept_list(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 부서관리 > 부서 등록 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_dept(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 부서관리 > 부서번호 중복체크
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_dept_dupCheck(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 부서관리 > 부서 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_dept_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 부서관리 > 부서정보 수정 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_dept(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 부서관리 > 부서정보 수정 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_dept_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사카드 관리 > 인사카드 검색
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String personnel_card_search(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사카드 관리 > 인사카드 목록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String personnel_card_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사카드 관리 > 인사카드 페이지 네비게이션
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String personnel_card_nav(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사카드 관리 > 인사카드 등록 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_personnel_card(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사카드 관리 > 사원 사진 등록 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_personnel_card_picture(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사카드 관리 > 직원사진 등록
	 * @author amaco78
	 * @param dto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_personnel_card_upload(FileDTO dto, Model model) throws Exception;

	/**
	 * 인사관리 > 인사카드 관리 > 사원번호 중복 체크
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_personnel_card_dupCheck(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사카드 관리 > 인사카드 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_personnel_card_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사카드 관리 > 인사카드 정보 수정 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_personnel_card(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사카드 관리 > 인사카드 정보 수정 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_personnel_card_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사카드 관리 > 인사카드 사원정보
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String personnel_card_info(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사발령 관리 > 인사발령 조회
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String hr_appointment_search(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사발령 관리 > 인사발령 페이지 네비게이션
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String hr_appointment_nav(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사발령 관리 > 인사발령 목록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String hr_appointment_list(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사발령 관리 > 인사발령 등록 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_hr_appointment(HttpServletRequest req, Model model) throws Exception; 
	
	/**
	 * 인사관리 > 인사발령 관리 > 부서선택시 해당부서 근무사원 반환
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public ResponseEntity<List<EmployeeVO>> select_dept(@PathVariable("dept_id") int dept_id);

	/**
	 * 인사관리 > 인사발령 관리 > 사원선택시 인사발령 폼 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String hr_appointment_regform(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사발령 관리 > 인사발령 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_hr_appointment_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 인사발령 관리 > 인사카드 인사발령 이력보기
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String personnel_card_appointment(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 퇴사자 관리 > 퇴사자 조회
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String retired_employee_search(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 퇴사자 관리 > 퇴사자 목록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String retired_employee_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 퇴사자 관리 > 퇴사자 페이지 네비게이션
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String retired_employee_nav(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 퇴사자 관리 > 퇴사자 등록 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_retired_employee(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 퇴사자 관리 > 퇴사자 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_retired_employee_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 퇴사자 관리 > 사원선택시 퇴사자 폼 화면
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String retired_employee_regform(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 퇴사자 관리 > 인사카드 퇴사자 이력보기
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String personnel_card_retired(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여대장 검색
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String salary_register_search(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여대장 목록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String salary_register_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 급여 관리 > 급여 대장 페이지 네비게이션
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String salary_register_nav(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여정보 등록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String reg_salary_info(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여정보 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String reg_salary_info_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여 전표 조회
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String salary_statement_search(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여 지급
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String clear_salary_bank_account(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여 지급 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String clear_salary_bank_account_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여대장 수정
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_salary_info(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 인사관리 > 급여 관리 > 급여대장 수정 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_salary_info_pro(HttpServletRequest req, Model model) throws Exception;
}