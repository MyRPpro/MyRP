package com.pro.myrp.controller.attitude;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface AttitudeController extends MyRPController {
//
	
	/**
	 * 근태관리 > 근태조회 > 근태조회화면
	 * @author 장재희
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String search_attitude_search(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 근태관리 > 근태조회 > 근태 등록 화면
	 * @author 장재희
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_attitude_search(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 근태관리 > 근태조회> 사원선택 근태관련 폼 화면
	 * @author 장재희
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String attitude_form_service(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 근태관리  > 근태조회 > 근태등록처리
	 * @author 장재희
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_attitude_search_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * @author 장재희
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String hr_attitude_nav(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 근태 관리 > 근태 조회 > 근태 목록 화면 
	 * @author 장재희
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String hr_attitude_list (HttpServletRequest req, Model model) throws Exception;
	
	
	/**
	 * 근태관리 > 근태조회 > 인사카드 휴가등록 이력 보기
	 * @author 장재희
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String personnel_card_attitude(HttpServletRequest req, Model model) throws Exception;
}
