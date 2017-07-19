package com.pro.myrp.service.account;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface AccountService extends MyRPService {

	/**
	 * 계좌 등록 > 계좌 리스트 서비스
	 * @author 정원
	 * @param model
	 * @throws Exception
	 */
	public void bank_account_list_service(Model model) throws Exception;
	
	/**
	 * 계좌 등록 > 계좌 등록 서비스
	 * @param model
	 * @throws Exception
	 */
	public void register_bank_account_service(Model model) throws Exception;
	
	/**
	 * 계좌 등록 > bank_account_id 불러오기 서비스
	 * @param model
	 * @throws Exception
	 */
	public void call_bank_account_id_service(Model model) throws Exception;
	
	/**
	 * 계좌 등록 > 계좌 등록 처리 서비스
	 * @param model
	 * @throws Exception
	 */
	public void register_bank_account_pro_service(Model model) throws Exception;
	
	/**
	 * 계좌 등록 > 계좌 수정 서비스
	 * @param model
	 * @throws Exception
	 */
	public void modify_bank_account_service(Model model) throws Exception;
	
	/**
	 * 계좌 등록 > 계좌 수정 처리 서비스
	 * @param model
	 * @throws Exception
	 */
	public void modify_bank_account_pro_service(Model model) throws Exception;
	
	/**
	 * 전표 관리 > 전체 전표 조회 서비스
	 * @param model
	 * @throws Exception
	 */
	public void search_all_statements_service(Model model) throws Exception;
	
	/**
	 * 전표 관리 > 상세 전표 조회 서비스
	 * @param model
	 * @throws Exception
	 */
	public void search_statement_detail(Model model) throws Exception;
	
	/**
	 * 전표 관리 > 세금 전표 자동 생성 서비스
	 * @param model
	 * @throws Exception
	 */
	/*public void make_statement_service(Model model) throws Exception;*/
	
	/**
	 * 전표관리 > 전표 승인 서비스
	 * @param model
	 * @throws Exception
	 */
	public void approve_statement_service(Model model) throws Exception;
}
