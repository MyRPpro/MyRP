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

	public String search_stockpile_search_service(HttpServletRequest req, Model model) throws Exception;

	public void select_stockpile_search_service(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 물류 주문 > 주문 리스트 
	 * @author choidream 
	 * @param req
	 * @param model
	 * @throws Exception
	 */
	public void search_distribution_order_service(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 물류 주문 > 주문 상세 
	 * @author choidream 
	 * @param req
	 * @param model
	 * @throws Exception
	 */
	public void request_in_out_storage_service(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 물류 주문 > 주문 처리 
	 * @author choidream 
	 * @param req
	 * @param model
	 * @throws Exception
	 */
	public void request_in_out_storage_pro_service(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 창고등록 > 창고리스트 
	 * @author choidream 
	 * @param req
	 * @param model
	 * @throws Exception
	 */
	public void reg_warehouse_service(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 창고등록 > 창고 등록 / 수정 입력
	 * @author choidream 
	 * @param req
	 * @param model
	 * @throws Exception
	 */
	public void reg_warehouse_view_service(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 창고등록 > 창고 등록 / 수정 처리
	 * @author choidream 
	 * @param req
	 * @param model
	 * @throws Exception
	 */
	public void reg_warehouse_pro_service(HttpServletRequest req, Model model) throws Exception;

	
	

}
