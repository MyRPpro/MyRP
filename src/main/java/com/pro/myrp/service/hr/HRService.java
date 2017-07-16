package com.pro.myrp.service.hr;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface HRService extends MyRPService {

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드목록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void base_code_group_list_service(Model model) throws Exception;
	
	/**
	 * 인시관리 > 인사코드 등록 > 인사코드 그룹 등록화면 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_group_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 그룹 아이디 중복체크
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_group_dupCheck_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 그룹 아이디 등록 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_group_pro_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 그룹 수정화면 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_base_code_group_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 그룹 수정처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_base_code_group_pro_service(Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사코드 등록 > 그룹별 인사코드 목록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void base_code_list_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 등록 화면 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 아이디 중복확인 
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_dupCheck_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 등록 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_pro_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 수정화면 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_base_code_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 인사코드 수정처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_base_code_pro_service(Model model) throws Exception;

	/**
	 * 인사관리 > 부서 관리 > 부서 목록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void dept_list_service(Model model) throws Exception;

	/**
	 * 인사관리 > 부서 관리 > 부서 등록 화면 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_dept_service(Model model) throws Exception;

	/**
	 * 인사관리 > 부서 관리 > 부서번호 중뵥 체크 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_dept_dupCheck_service(Model model) throws Exception;

	/**
	 * 인사관리 > 부서 관리 > 부서 등록 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_dept_pro_service(Model model) throws Exception;

	/**
	 * 인사관리 > 부서관리 > 부서정보 수정 화면 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_dept_service(Model model) throws Exception;

	/**
	 * 인사관리 > 부서관리 > 부서정보 수정 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_dept_pro_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사카드관리 > 인사카드 검색 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void personnel_card_search_service(Model model) throws Exception;
	
	/**
	 * 인사관리 > 인사카드관리 > 인사카드 목록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void personnel_card_list_service(Model model) throws Exception;

	/**
	 * 인사관리 > 인사카드관리 > 인사카드 페이지 네비게이션 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void personnel_card_nav_service(Model model) throws Exception;
}
