package com.pro.myrp.persistence.purchase;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pro.myrp.domain.accounting_management.Purchase_statementVO;
import com.pro.myrp.domain.base_registration.Order_stateVO;
import com.pro.myrp.domain.purchase_management.PU_stockorderVO;
import com.pro.myrp.domain.purchase_management.PurchaseDTO;
import com.pro.myrp.domain.sales_management.SA_stockorderVO;
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


	public ArrayList<PurchaseDTO> select_reg_purchases(String purchase_id);

	

	public PurchaseDTO select_reg_purchase_pro(String lack_sales_id);

	
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

	public int select_lack_reg_purchase_cnt();

	public ArrayList<PurchaseDTO> select_lack_reg_purchase(Map<String, Object> daoMap);

	public Date select_purchase_pay_date(Map<String, Object> daoMap);

	public int select_purchase_pay_diff(Map<String, Object> daoMap);

	public PurchaseDTO select_purchase(String purchase_id);

	public int update_state(Map<String, Object> daoMap);

	public int update_state_force(Map<String, Object> daoMap);



	public List<Order_stateVO> select_statements_approval();



	public List<SA_stockorderVO> select_sales_statement(String statement_id);



	public PurchaseDTO select_search_purchase_order(Map<String, Object> daoMap);



	public int update_order_state(Map<String, Object> daoMap);



	public SalesDTO select_search_sales_order(Map<String, Object> daoMap);



	public List<Order_stateVO> select_request_purchase();



	public List<Purchase_statementVO> select_purchase_statement(String statement_id);



	public List<Order_stateVO> select_complete_storage_in();



	public List<PU_stockorderVO> select_purchase_stockorder(String statement_id);



	public int update_complete_pay_purchase();



	public ArrayList<PurchaseDTO> select_complete_pay_purchase_list(Map<String, Object> daoMap);

}
