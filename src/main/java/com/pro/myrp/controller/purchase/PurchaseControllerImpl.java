package com.pro.myrp.controller.purchase;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.purchase.purchaseService;

@Controller
@RequestMapping("/purchase_management/*")
public class PurchaseControllerImpl implements purchaseController ,CodeMyRP {

	@Inject
	private purchaseService service;

	
	@Override
	@GetMapping(value="search_purchase/purchase_list")
	public String purchase_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(purchase_list));
		model.addAttribute("req", req);
		return code.c(purchase_management,search_purchase,purchase_list);
	}
	
	
	@Override
	@GetMapping(value="search_purchase/purchase_list_table")
	public String purchase_list_table(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(purchase_list_table));
		model.addAttribute("req", req);
		service.purchase_list_servie(model);
		service.purchase_list_table_servie(model);
		return code.c(purchase_management,search_purchase,purchase_list_table);
	}


	@Override
	@GetMapping(value="search_purchase/purchase_list_page")
	public String purchase_list_page(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(purchase_list_page));
		model.addAttribute("req", req);
		service.purchase_list_servie(model);
		service.purchase_list_page_servie(model);
		return code.c(purchase_management,search_purchase,purchase_list_page);
	}

	
	@Override
	@GetMapping(value="search_purchase/detail_purchase")
	public String detail_purchase(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(detail_purchase));
		model.addAttribute("req", req);
		service.detail_purchase_service(model);
		return code.c(purchase_management, search_purchase,detail_purchase);
	}
	
	
	@Override
	@GetMapping(value="search_purchase/detail_purchase_pro")
	public String detail_purchase_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(detail_purchase));
		model.addAttribute("req", req);
		service.detail_purchase_pro_service(model);
		return code.c(purchase_management, search_purchase,detail_purchase_pro);
	}
	
	
	@Override
	@GetMapping(value="search_purchase/modify_purchase")
	public String modify_purchase(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_purchase));
		model.addAttribute("req", req);
		service.modify_purchase_service(model);
		return code.c(purchase_management, search_purchase, modify_purchase);
	}
	
	
	@Override
	@GetMapping(value="search_purchase/modify_purchase_pro")
	public String modify_purchase_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_purchase));
		model.addAttribute("req", req);
		service.modify_purchase_pro_service(model);
		return code.c(purchase_management, search_purchase, modify_purchase_pro);
	}
	
	

	
	
	
	@Override
	@GetMapping(value="input_purchase/reg_purchase")
	public String reg_purchase(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(reg_purchase));
		model.addAttribute("req",req);
		service.reg_purchase_service(model);
		return code.c(purchase_management , input_purchase , reg_purchase);
	}

	
	@Override
	@GetMapping(value="input_purchase/reg_purchase_table")
	public String reg_purchase_table(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(reg_purchase_table));
		model.addAttribute("req",req);
		service.reg_purchase_table(model);
		return code.c(purchase_management, input_purchase, reg_purchase_table);
	}
	
	
	@Override
	@GetMapping(value="status_purchase/search_status_purchase")
	public String search_status_purchase(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_status_purchase));
		model.addAttribute("req", req);
		return code.c(purchase_management, staus_purchase, search_status_purchase);
	}


	@Override
	public String reg_purchase_search(HttpServletRequest req, Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}




	
}


