package com.pro.myrp.persistence.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pro.myrp.domain.purchase_management.PurchaseDTO;
import com.pro.myrp.persistence.MyRPDAO;

public interface purchaseDAO extends MyRPDAO {

	public int select_purchase_cnt();

	public ArrayList<PurchaseDTO> select_purchase_list( Map<String, Object> daoMap);

	public PurchaseDTO select_detail_purchase(String company_id);

	public int update_purchase(PurchaseDTO dto);

	public int count_quick_serch_purchase (String search_str);
	
	public ArrayList<PurchaseDTO> select_quick_serch_purchase( Map<String, Object> daoMap);

	public ArrayList<PurchaseDTO> select_product_ids();

	public ArrayList<PurchaseDTO> select_company_ids();

	public ArrayList<PurchaseDTO> select_employee_ids();

	public int insert_reg_purchase(PurchaseDTO dto);

	public ArrayList<PurchaseDTO> select_account_ids();

	public int insert_reg_purchase_statement(PurchaseDTO dto);

	public String select_purchase_id();
	
	public String select_statement_id();

	public List<PurchaseDTO> select_purchase_order(String product_id);

	public ArrayList<PurchaseDTO> select_reg_purchase();

}
