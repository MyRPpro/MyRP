package com.pro.myrp.service.hr;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface HRService extends MyRPService {

	/**
	 * 인사관리 > 인사코드 등록 > 기초코드목록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void base_code_group_list_service(Model model) throws Exception;
	
	/**
	 * 인시관리 > 인사코드 등록 > 기초코드 그룹 등록화면 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_group(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 기초코드 그룹 아이디 중복체크
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_dupCheck(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 기초코드 그룹 아이디 등록 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_base_code_group_pro(Model model) throws Exception;

	/**
	 * 인사관리 > 인사코드 등록 > 그룹별 기초코드 목록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void base_code_list(Model model) throws Exception;
}
