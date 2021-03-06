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
	public void add_company_service(Model model) throws Exception;

	/**
	 * 거래처 등록 > 거래처 번호 중복 확인
	 * @author amaco78
	 * @param model
	 */
	public void add_company_dupCheck_service(Model model) throws Exception; 
	
	/**
	 * 거래처 등록 > 거래처 신규 등록 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_company_pro_service(Model model) throws Exception;

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

	/**
	 * 상품 등록 > 상품 리스트 서비스
	 * @param model
	 * @throws Exception
	 */
	public void product_list_service(Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 신규 등록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_product_service(Model model) throws Exception;

	/**
	 * 상품 등록 > 상품번호 중복 확인
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_product_dupCheck_service(Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 신규 등록 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void add_product_pro_service(Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 수정 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_product_service(Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 수정 처리 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void modify_product_pro_service(Model model) throws Exception;

}
