package com.pro.myrp.controller.purchase;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface purchaseController extends MyRPController {
	
	
	// ---------------------------------------------------
	// 			구매 검색 R-3001 search_purchase
	// ---------------------------------------------------
	
	/**
	 * 구매 리스트 
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String purchase_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 구매 리스트_ 테이블 내용
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String purchase_list_table(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 구매 리스트_ 테이블 번호
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String purchase_list_page(HttpServletRequest req, Model model) throws Exception;
	
	
	
	/**
	 * 구매 리스트 -> 세부 페이지
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String detail_purchase(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 구매 수정 처리
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_purchase_pro(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 구매 바로 검색
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String quick_serch_purchase(HttpServletRequest req, Model model) throws Exception;

	
	// ---------------------------------------------------
	// 			구매 입력  R-3002 input_purchase
	// ---------------------------------------------------
	
	
	/**
	 * 구매 입력
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String reg_purchase(HttpServletRequest req, Model model) throws Exception;


	/**
	 * 구매 입력 처리
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String reg_purchase_pro(HttpServletRequest req, Model model) throws Exception;


}
