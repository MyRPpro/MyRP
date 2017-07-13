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
	 */
	
	/**
	 * 계좌등록 > 계좌 수정
	 */
	
	/**
	 * 계좌등록 > 계좌 삭제
	 */
	
	
}
