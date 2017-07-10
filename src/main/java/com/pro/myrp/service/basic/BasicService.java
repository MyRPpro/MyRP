package com.pro.myrp.service.basic;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface BasicService extends MyRPService {

	public void company_list_service(Model model) throws Exception;
}
