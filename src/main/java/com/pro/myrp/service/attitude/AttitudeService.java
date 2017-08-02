package com.pro.myrp.service.attitude;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface AttitudeService extends MyRPService {
//
	/**
	 * 근태관리 > 근태조회 > 근태조회 화면 서비스
	 * @author 장재희
	 * @param model
	 * @throws Exception
	 */
	public void search_attitude_search_service(Model model) throws Exception;
	
	/**
	 * 근태관리 > 근태조회 > 근태 등록 화면 서비스
	 * @author 장재희
	 * @param model
	 * @throws Exception
	 */
	public void add_attitude_search_service(Model model) throws Exception;
	
	/**
	 * 근태관리 > 근태조회 > 사원선택 근태관련 폼 화면
	 * @author 장재희
	 * @param model
	 * @throws Exception
	 */
	public void attitude_form_service(Model model) throws Exception;
	
	/**
	 * 근태관리 > 근태조회 > 근태 등록 처리 서비스
	 * @author 장재희
	 * @param model
	 * @throws Exception
	 */
	public void add_attitude_search_pro_service(Model model) throws Exception;
	
	
	/**
	 * 근태관리 > 근태조회 > 근태 목록 페이지 네비게이션
	 * @author 장재희
	 * @param model
	 * @throws Exception
	 */
	public void hr_attitude_nav_service(Model model) throws Exception;
	
	/**
	 * 근태관리 > 근태조회 > 근태 목록 화면
	 * @author 장재희
	 * @param model
	 * @throws Exception
	 */
	public void hr_attitude_list_service(Model model) throws Exception;
	
	/**
	 * 근태관리 > 근태조회 > 인사카드 휴가등록 이력 보기
	 * @author 장재희
	 * @param model
	 * @throws Exception
	 */
	public void personnel_card_attitude_service(Model model) throws Exception;
}
