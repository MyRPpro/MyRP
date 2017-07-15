package com.pro.myrp.controller.hr;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

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
	 * 인사관리 > 인사카드 관리 > 인사카드 목록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String personnel_card_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 근태 관리 > 출결달력 검색
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String search_attendance_absence(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 인사관리 > 급여 관리 > 급여대장
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String salary_register(HttpServletRequest req, Model model) throws Exception;

}
