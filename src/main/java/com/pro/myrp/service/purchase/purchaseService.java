package com.pro.myrp.service.purchase;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface purchaseService extends MyRPService {

	public void purchase_list_servie(Model model);
	
	public void detail_purchase_service(Model model);

	public void modify_purchase_service(Model model);

	public void quick_serch_purchase_service(Model model);

	public void reg_purchase_service(Model model);

	public void reg_purchase_service_pro(Model model);

	public void reg_purchase_table(Model model);

	public void search_reg_purchase_service(Model model);
	
	

}
