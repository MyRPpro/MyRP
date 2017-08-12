package com.pro.myrp.controller.sales;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.sales.SalesService;

@Controller
@RequestMapping("/sales_management/*")
public class SalesControllerImpl implements SalesController,CodeMyRP {

	@Inject
	private SalesService service;


	@Override
	@GetMapping(value="search_sales/sales_list")
	public String sales_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(sales_list));
		model.addAttribute("req", req);
		return code.c(sales_management,search_sales,sales_list);
	}
	
	@Override
	@GetMapping(value="search_sales/sales_list_table")
	public String sales_list_table(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(sales_list_table));
		model.addAttribute("req", req);
		service.sales_list_servie(model);
		service.sales_list_table_servie(model);
		return code.c(sales_management,search_sales,sales_list_table);
	}

	@Override
	@GetMapping(value="search_sales/sales_list_page")
	public String sales_list_page(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(sales_list_page));
		model.addAttribute("req", req);
		service.sales_list_servie(model);
		service.sales_list_page_servie(model);
		return code.c(sales_management,search_sales,sales_list_page);
	}
	
	@Override
	@GetMapping(value="search_sales/detail_sales")
	public String detail_sales(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(detail_sales));
		model.addAttribute("req", req);
		service.detail_sales_service(model);
		return code.c(sales_management, search_sales,detail_sales);
	}
	
	@Override
	@GetMapping(value="search_sales/detail_sales_pro")
	public String detail_sales_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(detail_sales));
		model.addAttribute("req", req);
		service.detail_sales_pro_service(model);
		return code.c(sales_management, search_sales,detail_sales_pro);
	}

	@Override
	@GetMapping(value="search_sales/modify_sales")
	public String modify_sales(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_sales));
		model.addAttribute("req", req);
		service.modify_sales_service(model);
		return code.c(sales_management, search_sales, modify_sales);
	}

	@Override
	@GetMapping(value="search_sales/modify_sales_pro")
	public String modify_sales_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_sales));
		model.addAttribute("req", req);
		service.modify_sales_pro_service(model);
		return code.c(sales_management, search_sales, modify_sales_pro);
	}
	
	
	
	// 수금 요청
	@Override
	@GetMapping(value="search_sales/req_receive")
	public String req_receive(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(req_receive));
		model.addAttribute("req", req);
		service.req_receive_service(model);
		return code.c(sales_management, search_sales, req_receive);
	}

	
	@Override
	@GetMapping(value="search_sales/req_receive_pro")
	public String req_receive_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(req_receive_pro));
		model.addAttribute("req", req);
		service.req_receive_pro_service(model);
		return code.c(sales_management, search_sales, req_receive_pro);
	}
	
	
	
	
	
	
	// 등록 
	@Override
	@GetMapping(value="input_sales/reg_sales")
	public String reg_sales(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(reg_sales));
		model.addAttribute("req",req);
		service.reg_sales_service(model);
		return code.c(sales_management , input_sales , reg_sales);
	}
	
	@Override
	@GetMapping(value="input_sales/reg_sales_table")
	public String reg_sales_table(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(reg_sales_table));
		model.addAttribute("req",req);
		service.reg_sales_table(model);
		return code.c(sales_management, input_sales, reg_sales_table);
	}


	@Override
	@GetMapping(value="search_sales/req_storage_out")
	public String req_storage_out(HttpServletRequest req, Model model) throws Exception {
		model.addAttribute("req", req);
		service.req_storage_out_service(model);
		return code.c(sales_management, search_sales, sales_list);
	}

	
	
	@Override
	@GetMapping(value="status_sales/search_status_sales")
	public String search_status_sales(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_status_sales));
		model.addAttribute("req",req);
		service.search_status_sales_service(model);
		return code.c(sales_management, status_sales, search_status_sales);
	
	}

	@Override
	@GetMapping(value="status_sales/search_status_sales_table")
	public String search_status_sales_table(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_status_sales_table));
		model.addAttribute("req",req);
		service.search_status_sales_table_service(model);
		return code.c(sales_management, status_sales, search_status_sales_table);
	}


	@Override
	@GetMapping(value="status_sales/search_status_sales_page")
	public String search_status_sales_page(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_status_sales_page));
		model.addAttribute("req",req);
		service.search_status_sales_page_service(model);
		return code.c(sales_management, status_sales, search_status_sales_page);
	
	}

	@Override
	@GetMapping(value="status_sales/search_status_sales_detail")
	public String search_status_sales_detail(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_status_sales_detail));
		model.addAttribute("req",req);
		service.search_status_sales_detail_service(model);
		return code.c(sales_management, status_sales, search_status_sales_detail);
	
	}

	

	/*----------------------------------------------------------------------------------------------------------*/
	
	
	
	
	
	
}
