package com.pro.myrp.persistence.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pro.myrp.domain.purchase_management.PurchaseDTO;
import com.pro.myrp.domain.sales_management.SalesDTO;
import com.pro.myrp.persistence.MyRPDAO;

public interface purchaseDAO extends MyRPDAO {

	public int select_purchase_cnt();

	

	public ArrayList<PurchaseDTO> select_detail_purchase(Map<String, Object> daoMap);

	public int update_purchase(PurchaseDTO dto);

	public int count_serch_purchase (String search_str);
	
	public ArrayList<PurchaseDTO> select_quick_serch_purchase( Map<String, Object> daoMap);

	public ArrayList<PurchaseDTO> select_product_ids();

	public ArrayList<PurchaseDTO> select_company_ids();

	public ArrayList<PurchaseDTO> select_employee_ids();

	public ArrayList<PurchaseDTO> select_account_ids();
	
	public int insert_reg_purchase(PurchaseDTO dto);
	


	public String select_purchase_id();
	
	public String select_statement_id();

	public List<PurchaseDTO> select_purchase_order(String product_id);
	
	public int select_search_purchase_cnt(String search_str);

	public int update_account_approve_purchase();

	public int select_account_approve_purchase_cnt();

	public int update_stock_in_purchase();

	public int select_stock_in_purchase_cnt();

	public int select_checkout_purchase_cnt();

	public int select_all_purchase_cnt();
	
	public ArrayList<PurchaseDTO> select_purchase_list( Map<String, Object> daoMap);

	public ArrayList<PurchaseDTO> select_account_approve_purchase_list(Map<String, Object> daoMap);

	public ArrayList<PurchaseDTO> select_stock_in_purchase_list(Map<String, Object> daoMap);

	public ArrayList<PurchaseDTO> select_checkout_purchase_list(Map<String, Object> daoMap);
	
	public ArrayList<PurchaseDTO> select_purchase_All_list(Map<String, Object> daoMap);

	public ArrayList<PurchaseDTO> select_modify_purchase(Map<String, Object> daoMap);



	public int update_req_storage_in(Map<String, Object> daoMap);




}
