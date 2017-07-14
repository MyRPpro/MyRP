package com.pro.myrp.controller.sales;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.sales.SalesService;

@Controller
@RequestMapping("/sales_management/*")
public class SalesControllerImpl implements SalesController,CodeMyRP {

	@Inject
	private SalesService service;
	
	@Override
	@GetMapping(value="sales_list")
	public String sales_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println("sales_list");
		model.addAttribute("req", req);
		service.sales_list_servie(model);
		return code.c(sales_management, sales_list);
	}


	@Override
	@GetMapping(value="detail_sales")
	public String detail_sales(HttpServletRequest req, Model model) throws Exception {
		System.out.println("detail_sales");
		model.addAttribute("req", req);
		service.detail_sales_service(model);
		return code.c(sales_management, modify_sales);
	}


	
	
	
}
