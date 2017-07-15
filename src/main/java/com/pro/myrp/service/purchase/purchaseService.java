package com.pro.myrp.service.purchase;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface purchaseService extends MyRPService {

	public void purchase_list_servie(Model model);

	public void detail_purchase_service(Model model);


	public void modify_purchase_service(Model model);

}
