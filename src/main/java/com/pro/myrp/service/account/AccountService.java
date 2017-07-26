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
	 * 전표 관리 > 전표 생성 서비스
	 * @param model
	 * @throws Exception
	 */
	public void make_statement_service(Model model) throws Exception;
	
	/**
	 * 전표관리 > 전표 승인 서비스
	 * @param model
	 * @throws Exception
	 */
	public void approve_statement_service(Model model) throws Exception;
	
	/**
	 * 전표관리 > 전표 승인거절 서비스
	 * @param model
	 * @throws Exception
	 */
	public void disapprove_statement_service(Model model) throws Exception;

	/**
	 * 전표관리 > 미승인 전표조회 서비스
	 * @param model
	 * @throws Exception
	 */
	public void search_unapproval_statements_service(Model model) throws Exception;
	
	/**
	 * 전표관리 > 승인 전표 조회 서비스
	 * @param model
	 * @throws Exception
	 */
	public void search_approval_statements_service(Model model) throws Exception;
	
	/**
	 * 전표관리 > 전표생성 > connected_id 불러오기 서비스 : 뷰
	 * @param model
	 * @throws Exception
	 */
	public void call_connected_id_view_service(Model model) throws Exception;
	/**
	 * 전표관리 > 전표생성 > connected_id 불러오기 서비스
	 * @param model
	 * @throws Exception
	 */
	public void call_connected_id_service(Model model) throws Exception;
	
	/**
	 * 전표관리 > 전표생성 > 전표생성처리 서비스
	 * @param model
	 * @throws Exception
	 */
	public void make_statement_pro_service(Model model) throws Exception;
	
	/**
	 * 계정관리 > 계정 목록 조회 서비스
	 * @param model
	 * @throws Exception
	 */
	public void search_account_list_service(Model model) throws Exception;
	
	/**
	 * 계정관리 > 계정 추가서비스
	 * @param model
	 * @throws Exception
	 */
	public void add_account_service(Model model) throws Exception;
	
	/**
	 * 계정관리 > 계정추가 > 계정 중복 확인서비스
	 * @param model
	 * @throws Exception
	 */
	public void add_account_dupCheck_service(Model model) throws Exception;

	/**
	 * 계정관리 > 계정추가처리서비스
	 * @param model
	 * @throws Exception
	 */
	public void add_account_pro_service(Model model) throws Exception;
	
	/**
	 * 계정관리 > 계정 수정 서비스
	 * @param model
	 * @throws Exception
	 */
	public void modify_account_service(Model model) throws Exception;
	
	/** 
	 * 계정관리 > 계정 수정 처리 서비스
	 * @param model
	 * @throws Exception
	 */
	public void modify_account_pro_service(Model model) throws Exception;
	
	/**
	 * 회계보고서 > 재무상태표 조회 서비스
	 * @param model
	 * @throws Exception
	 */
	public void search_balance_sheet_service(Model model) throws Exception;
	public void show_balance_sheet_service(Model model) throws Exception;
	
	/**
	 * 회계보고서 > 손익계산서 조회 서비스 
	 * @param model
	 * @throws Exception
	 */
	public void search_profit_and_loss_statement_service(Model model) throws Exception;
	public void show_profit_and_loss_statement_service(Model model) throws Exception;
}
