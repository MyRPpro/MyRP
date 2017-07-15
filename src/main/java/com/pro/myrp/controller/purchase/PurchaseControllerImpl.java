package com.pro.myrp.controller.purchase;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.purchase.purchaseService;

@Controller
@RequestMapping("/purchase_management/*")
public class PurchaseControllerImpl implements purchaseController,CodeMyRP {

	@Inject
	private purchaseService service;

	@Override
	@GetMapping(value="search_purchase/purchase_list")
	public String purchase_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(purchase_list));
		model.addAttribute("req", req);
		service.purchase_list_servie(model);
		return code.c(purchase_management,search_purchase,purchase_list);
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
	@GetMapping(value="search_purchase/modify_purchase")
	public String modify_purchase_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_purchase));
		model.addAttribute("req", req);
		service.modify_purchase_service(model);
		return code.c(purchase_management, search_purchase, modify_purchase);
	}


	@Override
	@GetMapping(value="search_purchase/quick_serch_purchase")
	public String quick_serch_purchase(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(quick_serch_purchase));
		model.addAttribute("req", req);
		service.quick_serch_purchase_service(model);
		return "redirect:"+code.c(purchase_management, search_purchase, purchase_list);
	}


	
	
}



