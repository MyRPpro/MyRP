package com.pro.myrp.persistence.sales;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pro.myrp.domain.sales_management.ModifySelectDTO;
import com.pro.myrp.domain.sales_management.SalesDTO;
import com.pro.myrp.persistence.MyRPDAO;


public interface SalesDAO extends MyRPDAO {
	
	
	// sales_list_servie
	public int count_quick_serch_sales (String search_str);
	
	public int select_sales_cnt();

	public ArrayList<SalesDTO> select_sales_list( Map<String, Object> daoMap);
	
	public ArrayList<SalesDTO> select_quick_serch_sales( Map<String, Object> daoMap);
	
	
	// detail_sales_service
	public ArrayList<SalesDTO> select_detail_sales( Map<String, Object> daoMap );

	
	// modify_sales_service
	public int update_sales(SalesDTO dto);

	public ArrayList<ModifySelectDTO> select_account();

	public ArrayList<ModifySelectDTO> select_product();

	public ArrayList<ModifySelectDTO> select_company();

	public ArrayList<ModifySelectDTO> select_employee();

	
	
	// input_sales_service

	public ArrayList<SalesDTO> select_product_ids();

	public ArrayList<SalesDTO> select_company_ids();

	public ArrayList<SalesDTO> select_employee_ids();

	public int insert_reg_sales(SalesDTO dto);

	public ArrayList<SalesDTO> select_account_ids();

	public int insert_reg_sales_statement(SalesDTO dto);

	public String select_sales_id();
	
	public String select_statement_id();

	public ArrayList<SalesDTO> select_sales_order(String product_id);
	
	public int update_req_storage_out(Map<String, Object> daoMap);
	
	

	// status_sales_service
	
	public ArrayList<SalesDTO> select_detail_status_sales(Map<String, Object> daoMap);

	public int count_search_status_sales(Map<String, String> daoMap);

	public ArrayList<SalesDTO> select_serch_status_sales(Map<String, Object> daoMap);

	public ArrayList<SalesDTO> select_all_status_sales(Map<String, Object> daoMap);

	public int count_option_status_sales(Map<String, Object> optionMap);

	public ArrayList<SalesDTO> select_serch_option_status_sales(Map<String, Object> optionMap);
	
	
	// search_sales_account

	public int select_count_approve_sales();

	public ArrayList<SalesDTO> select_account_approve_serch_sales(Map<String, Object> daoMap);

	public int update_account_approve_serch_sales();

	public int update_stock_out_serch_sales();

	public ArrayList<SalesDTO> select_stock_out_serch_sales(Map<String, Object> daoMap);

	public int select_count_stock_out_sales();

	
}
