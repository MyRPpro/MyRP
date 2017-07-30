package com.pro.myrp.service.purchase;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface purchaseService extends MyRPService {

	public void purchase_list_servie(Model model);
	
	public void detail_purchase_service(Model model);

	public void modify_purchase_service(Model model);

	public void reg_purchase_service(Model model);

	public void reg_purchase_table(Model model);


	
	public void search_reg_purchase_service(Model model);
	
	public void search_reg_purchase_table_service(Model model);
	
	public void search_reg_purchase_page_service(Model model);
	
	public void search_reg_purchase_pro_service(Model model);

	public void purchase_list_table_servie(Model model);

	public void purchase_list_page_servie(Model model);

	public void detail_purchase_pro_service(Model model);

	public void modify_purchase_pro_service(Model model);
	
	
	
	public void search_status_purchase_service(Model model);

	public void search_status_purchase_detail_service(Model model);
	
	public void search_status_purchase_table_service(Model model);

	public void search_status_purchase_page_service(Model model);

	
	

}
