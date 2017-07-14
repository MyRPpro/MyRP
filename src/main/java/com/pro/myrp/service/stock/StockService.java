package com.pro.myrp.service.stock;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface StockService extends MyRPService {
	
	/**
	 * 재고 현황 > 재고현황 페이지
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String stock_condition_service(HttpServletRequest req, Model model) throws Exception;

}
