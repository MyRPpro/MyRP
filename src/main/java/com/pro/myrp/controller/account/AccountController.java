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
	/* public String search_statement_detail(HttpServletRequest req, Model model) throws Exception;*/
	 
	 /**
	  * 전표관리 > 세금전표 자동 생성
	  * @param req
	  * @param model
	  * @return
	  * @throws Exception
	  *//*
	 public String make_statement(HttpServletRequest req, Model model) throws Exception;*/
	 
	 /**
	  * 전표관리 > 전표승인
	  * @param req
	  * @param model
	  * @return
	  * @throws Exception
	  */
	/* public String approve_statement(HttpServletRequest req, Model model) throws Exception;*/
}
