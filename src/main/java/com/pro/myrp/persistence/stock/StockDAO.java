package com.pro.myrp.persistence.stock;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.pro.myrp.domain.base_registration.Order_stateVO;
import com.pro.myrp.domain.base_registration.ProductVO;
import com.pro.myrp.domain.distribution_manage.Search_distribution_orderDTO;
import com.pro.myrp.domain.distribution_manage.Select_stock_order_movement_warehouseDTO;
import com.pro.myrp.domain.distribution_manage.Select_stock_order_storageDTO;
import com.pro.myrp.domain.distribution_manage.Stock_conditionDTO;
import com.pro.myrp.domain.distribution_manage.Stock_informationVO;
import com.pro.myrp.domain.distribution_manage.Adjustment_inventoryDTO;
import com.pro.myrp.domain.distribution_manage.In_storageDTO;
import com.pro.myrp.domain.distribution_manage.Out_storageDTO;
import com.pro.myrp.domain.distribution_manage.Select_stockpile_searchDTO;
import com.pro.myrp.domain.distribution_manage.Stockpile_searchDTO;
import com.pro.myrp.domain.distribution_manage.WarehouseVO;
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
	public ArrayList<Stockpile_searchDTO> select_search_stockpile_search(Model model);

	/**
	 * 재고수불부 > 재고수불부 결과 페이지 > 재고수불부 결과 페이지
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<Select_stockpile_searchDTO> select_stockpile_search(Model model);

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

	/**
	 * 물류주문조회 > 물류주문 list에 뿌려줄 order_state 테이블
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<Order_stateVO> select_order_state(Model model);

	/**
	 * 물류주문조회 > 입고주문 조회
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<In_storageDTO> select_in_storage(Model model);

	/**
	 * 물류주문조회 > 출고주문 조회
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<Out_storageDTO> select_out_storage(Model model);

	/**
	 * 물류주문조회 > 출고주문 입력
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int insert_out_storage(Model model);

	/**
	 * 물류주문조회 > 입고주문 입력
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int insert_in_storage(Model model);

	/**
	 * 물류주문조회 > 출고시 재고 상태 변경
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int update_stock_out_storage(Model model);

	/**
	 * 물류주문조회 > 출고시 3001 창고에 product_id 입력 되어있는지 확인
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int select_product_in_warehouse(Model model);

	/**
	 * 물류주문조회 > 출고시 3001 창고에 product_id 없으면 insert
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int insert_stock_out_storage(Model model);

	/**
	 * 물류주문조회 > 출고시 sales_order state 변경
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int update_sales_state(Model model);

	/**
	 * 물류주문조회 > 입고시 order_state 변경
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int update_order_state(Model model);

	public ArrayList<Search_distribution_orderDTO> Search_distribution_order(Model model);

	public int update_purchase_state(Model model);

	public String select_stock_order_type(Model model);

	public Select_stock_order_storageDTO select_stock_order_out_order(Model model);

	public ArrayList<WarehouseVO> select_warehouse_list(Model model);

	public int insert_warehouse(Model model);

	public int update_warehouse(Model model);
	
	/**
	 * 물류주문조회 > 리스트 페이지 - 입고주문들
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<In_storageDTO> select_storage_in_order(Model model);

	/**
	 * 물류주문조회 > 리스트 페이지 - 출고주문들
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<Out_storageDTO> select_storage_out_order(Model model);

	/**
	 * 창고이동 > 창고이동 리스트
	 * @author choidream
	 * @param model
	 * @return
	 */
	public ArrayList<Select_stock_order_movement_warehouseDTO> select_movement_warehouse_list(Model model);

	/**
	 * 창고이동 > 창고내역 삭제
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int delete_movement_warehouse(Model model);

	/**
	 * stock_order 내역 삭제
	 * @author choidream
	 * @param model
	 * @return
	 */
	public int delete_movement_stock_order(Model model);

	public ArrayList<ProductVO> select_product_info(Model model);

	public int insert_movement_warehouse(Model model);

	public int update_movement_warehouse(Model model);

	public int insert_stock_order(Model model);

	public int update_stock_order(Model model);

	public Stock_informationVO select_stock_information(Model model);

	public int insert_adjustment_inventory(Model model);

	public ArrayList<ProductVO> select_only_product_id_name(Model model);

	public ArrayList<Adjustment_inventoryDTO> select_adjustment_inventory(Model model);
}
