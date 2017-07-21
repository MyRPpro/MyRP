package com.pro.myrp.controller.sales;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface SalesController extends MyRPController {

	

	// ---------------------------------------------------
	// 			판매 검색 R-2001 search_sales
	// ---------------------------------------------------
	
	/**
	 * 판매 리스트 
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String sales_list(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 판매 리스트_ 테이블 내용
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String sales_list_table(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 판매 리스트_ 테이블 번호
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String sales_list_page(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 판매 리스트 -> 세부 페이지
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String detail_sales(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 판매 리스트 -> 수정
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_sales(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 판매 리스트 -> 수정 처리
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_sales_pro(HttpServletRequest req, Model model) throws Exception;
	
	

	// ---------------------------------------------------
	// 			판매 입력  R-2002 input_purchase
	// ---------------------------------------------------
	
	
	/**
	 * 판매 입력
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	public String reg_sales(HttpServletRequest req, Model model) throws Exception;
	

	/**
	 * 판매 입력 테이블
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	public String reg_sales_table(HttpServletRequest req, Model model) throws Exception;


	

}
