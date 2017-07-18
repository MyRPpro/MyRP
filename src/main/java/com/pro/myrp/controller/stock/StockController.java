package com.pro.myrp.controller.stock;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface StockController extends MyRPController {

	/**
	 * 재고 현황 > 재고현황 페이지
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String stock_condition(HttpServletRequest req, Model model) throws Exception;
	
	
	/**
	 * 재고수불부 > 재고수불부 검색 페이지
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String stockpile(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 재고수불부 > 재고수불부 검색 페이지 > 창고 / 물품 검색 ajax 페이지
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String search_stockpile_search(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 재고수불부 > 재고수불부 검색 페이지 > 창고 / 물품 검색 결과 ajax 페이지
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String select_stockpile_search(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 창고등록 > 창고등록 목록 페이지
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String reg_warehouse(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 재고조정 > 재고조정 조회 페이지
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String movement_warehouse (HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 물류주문조회 > 전체 전표 목록 리스트
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String adjustment_inventory(HttpServletRequest req, Model model) throws Exception;
	
	public String search_distribution_order(HttpServletRequest req, Model model) throws Exception;


	
	
	
}
