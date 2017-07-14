package com.pro.myrp.service.sales;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface SalesService extends MyRPService {

	void sales_list_servie(Model model) throws Exception;

}
