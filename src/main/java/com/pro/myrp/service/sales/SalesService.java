package com.pro.myrp.service.sales;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface SalesService extends MyRPService {

	public void sales_list_servie(Model model);
	
	public void sales_list_table_servie(Model model);
	
	public void sales_list_page_servie(Model model);
	
	public void detail_sales_service(Model model);
	
	public void modify_sales_pro_service(Model model);

	
	
	public void reg_sales_service(Model model);

	public void reg_sales_service_pro(Model model);

	public void reg_sales_table(Model model);


	
	
	public void search_status_sales_service(Model model);

	public void search_status_sales_detail_service(Model model);
	
	public void search_status_sales_table_service(Model model);

	public void search_status_sales_page_service(Model model);


	public void req_storage_out_service(Model model);

	
}
