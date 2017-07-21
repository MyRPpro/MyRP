package com.pro.myrp.persistence.stock;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.pro.myrp.domain.base_registration.ProductVO;
import com.pro.myrp.domain.distribution_manage.Stock_conditionDTO;
import com.pro.myrp.domain.distribution_manage.select_stockpile_searchDTO;
import com.pro.myrp.domain.distribution_manage.stockpile_searchDTO;
import com.pro.myrp.persistence.MyRPDAO;

public interface StockDAO extends MyRPDAO {

	/**
	 * 재고현황 > 재고조회 페이지
	 * @author choidream
	 * @return
	 */
	public ArrayList<Stock_conditionDTO> select_stock_condition();

	/**
	 * 재고수불부 > 재고수불부 검색 페이지 > 창고 / 물품 검색 결과 select 
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<stockpile_searchDTO> select_search_stockpile_search(Model model);

	/**
	 * 재고수불부 > 재고수불부 결과 페이지 > 재고수불부 결과 페이지
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<select_stockpile_searchDTO> select_stockpile_search(Model model);

	/**
	 * 재고수불부 > 재고수불부 결과 페이지 > 뿌려줄 product_name
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<ProductVO> select_product_name(Model model);

	/**
	 * 재고수불부 > 재고수불부 결과 페이지 > 비교할 product_id
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<ProductVO> select_product_id(Model model);
}
