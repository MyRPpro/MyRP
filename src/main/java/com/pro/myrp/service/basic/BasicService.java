package com.pro.myrp.service.basic;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface BasicService extends MyRPService {

	/**
	 * 거래처 등록 > 거래처 리스트 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void company_list_service(Model model) throws Exception;
	
	/**
	 * 거래처 등록 > 거래처 신규 등록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void reg_company_service(Model model) throws Exception;

	/**
	 * 거래처 등록 > 거래처 신규 등록 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void reg_company_pro_service(Model model) throws Exception;

	/**
	 * 거래처 등록 > 거래처 수정 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_company_service(Model model) throws Exception;

	/**
	 * 거래처 등록 > 거래처 수정 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_company_pro_service(Model model) throws Exception;
}
