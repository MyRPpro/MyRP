package com.pro.myrp.controller.purchase;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface purchaseController extends MyRPController {
	
	/**
	 * 구맬 리스트 
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String purchase_list(HttpServletRequest req, Model model) throws Exception;
	
	
	
	/**
	 * 구매 리스트 -> 세부 페이지
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String detail_purchase(HttpServletRequest req, Model model) throws Exception;


}
