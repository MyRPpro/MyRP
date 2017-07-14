package com.pro.myrp.controller.sales;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface SalesController extends MyRPController {

	

	/**
	 * 판매리스트
	 * @author Jang.EC
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */
	public String sales_list (HttpServletRequest req, Model model) throws Exception;
	
	
	
	
	
}
