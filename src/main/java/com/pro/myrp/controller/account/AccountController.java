package com.pro.myrp.controller.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface AccountController extends MyRPController{

	/**
	 * 계좌등록 > 계좌 조회
	 * @author 정원
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	 public String bank_account_list(HttpServletRequest req, Model model) throws Exception;
	
	 /**
	 * 계좌등록 > 계좌 등록
	 * @param req
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	 public String register_bank_account(HttpServletRequest req, Model model) throws Exception;
	 /**
	  * 계좌등록 > 계좌등록 > bank_account_id값 account DB에서 검색해서 불러오기 
	  * @param req
	  * @param model
	  * @return
	  * @throws Exception
	  */
	 public String call_bank_account_id(HttpServletRequest req, Model model) throws Exception;
	 
	 /**
	 * 계좌등록 > 계좌 등록처리
	 * @param req
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	 public String register_bank_account_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 계좌등록 > 계좌 수정
	 * @param req
	 * @param model
	 * @return 
	 * @throws Exception
	 */
	 public String modify_bank_account(HttpServletRequest req, Model model) throws Exception;
	 
	 /**
	  * 계좌등록 > 계좌 수정 처리
	  * @param req
	  * @param model
	  * @return
	  * @throws Exception
	  */
	 public String modify_bank_account_pro(HttpServletRequest req, Model model) throws Exception;
	 
	 /**
	  * 전표관리 > 전체 전표 조회
	  * @param req
	  * @param model
	  * @return
	  * @throws Exception
	  */
	 public String search_all_statements(HttpServletRequest req, Model model) throws Exception;
	 
	 /**
	  * 전표관리 > 상세전표 조회
	  * @param req
	  * @param model
	  * @return
	  * @throws Exception
	  */
	 public String search_statement_detail(HttpServletRequest req, Model model) throws Exception;
	 
	 /**
	  * 전표관리 > 전표승인
	  * @param req
	  * @param model
	  * @return
	  * @throws Exception
	  */
	public String approve_statement(HttpServletRequest req, Model model) throws Exception;
	/**
	 * 전표관리 > 전표승인거절
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String disapprove_statement(HttpServletRequest req, Model model) throws Exception;
	/**
	 * 전표관리 > 미승인 전표 조회
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String search_unapproval_statements(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 전표관리 > 승인 전표 조회
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String search_approval_statements(HttpServletRequest req, Model model) throws Exception;
	
	 /**
	  * 전표관리 > 전표 생성
	  * @param req
	  * @param model
	  * @return
	  * @throws Exception
	  */
	public String make_statement(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 전표관리 > 전표생성 > connected_id 	불러오기 : 
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String call_connected_id(HttpServletRequest req, Model model) throws Exception;
	/**
	 * 전표관리 > 전표생성 > connected_id 	불러오기 : 뷰
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String call_connected_id_view(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 전표관리 > 전표생성 > 전표생성처리
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String make_statement_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 계정관리 > 계정 목록 조회
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String search_account_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 계정관리 > 계정 추가
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_account(HttpServletRequest req, Model model) throws Exception;	
	
	/**
	 * 계정 관리 > 계정 추가 > account_id 중복체크
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_account_dupCheck(HttpServletRequest req, Model model) throws Exception;

	/** 
	 * 계정 관리 > 계정 추가 처리
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_account_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 계정관리 > 계정 수정
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_account(HttpServletRequest req, Model model) throws Exception;
	/**
	 * 계정관리 > 계정수정 처리
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_account_pro(HttpServletRequest req, Model model) throws Exception;
}

