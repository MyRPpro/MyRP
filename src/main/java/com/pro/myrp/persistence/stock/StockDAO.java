package com.pro.myrp.persistence.stock;

import java.util.ArrayList;

import com.pro.myrp.domain.Stock_conditionDTO;
import com.pro.myrp.persistence.MyRPDAO;

public interface StockDAO extends MyRPDAO {

	/**
	 * 재고현황 > 재고조회 페이지
	 * @author choidream
	 * @return
	 */
	public ArrayList<Stock_conditionDTO> select_stock_condition();

}
