package com.pro.myrp.controller.stock;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.stock.StockService;

@Controller
@RequestMapping("/distribution_management/*")
public class StockControllerImpl implements StockController, CodeMyRP{

	@Inject
	private StockService service;
	
	@Override
	@GetMapping(value = "stock_condition/search_stock_condition")
	public String stock_condition(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_stock_condition));
		service.stock_condition_service(req, model);
		return code.c(distribution_management, stock_condition, search_stock_condition);
	}

	@Override
	@RequestMapping(value = "stockpile/search_stockpile", method = {RequestMethod.GET,RequestMethod.POST})
	public String stockpile(HttpServletRequest req, Model model) throws Exception {
		return code.c(distribution_management, stockpile, search_stockpile );
	}
	
	@Override
	@RequestMapping(value = "stockpile/search_stockpile_search", method = {RequestMethod.GET,RequestMethod.POST})
	public String search_stockpile_search(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_stockpile_search));
		service.search_stockpile_search_service(req,model);
		return code.c(distribution_management, stockpile, search_stockpile_search);
	}
	
	@Override
	@RequestMapping(value = "stockpile/select_stockpile_search", method = {RequestMethod.GET,RequestMethod.POST})
	public String select_stockpile_search(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(select_stockpile_search));
		service.select_stockpile_search_service(req,model);
		return code.c(distribution_management, stockpile, select_stockpile_search);
	}

	@Override
	@RequestMapping(value = "reg_warehouse/warehouse_list", method = {RequestMethod.GET,RequestMethod.POST})
	public String reg_warehouse(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(warehouse_list));
		service.reg_warehouse_service(req,model);
		return code.c(distribution_management, reg_warehouse, warehouse_list);
	}
	
	@Override
	@RequestMapping(value = "reg_warehouse/warehouse_view", method = {RequestMethod.GET,RequestMethod.POST})
	public String reg_warehouse_view(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(warehouse_view));
		service.reg_warehouse_view_service(req,model);
		return code.c(distribution_management, reg_warehouse, warehouse_view);
	}
	
	@Override
	@RequestMapping(value = "reg_warehouse/warehouse_pro", method = {RequestMethod.GET,RequestMethod.POST})
	public String reg_warehouse_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(warehouse_pro));
		service.reg_warehouse_pro_service(req,model);
		return "redirect:" + code.c(distribution_management, reg_warehouse, warehouse_list);
	}

	@Override
	@RequestMapping(value = "movement_warehouse/movement_list", method = {RequestMethod.GET,RequestMethod.POST})
	public String movement_warehouse_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(movement_list));
		service.movement_warehouse_list_service(req,model);
		return code.c(distribution_management, movement_warehouse, movement_list);
	}
	
	@Override
	@RequestMapping(value = "movement_warehouse/movement_view", method = {RequestMethod.GET,RequestMethod.POST})
	public String movement_warehouse_movement_view(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(movement_view));
		service.movement_warehouse_view_service(req,model);
		return code.c(distribution_management, movement_warehouse, movement_view);
	}
	
	@Override
	@RequestMapping(value = "movement_warehouse/movement_pro", method = {RequestMethod.GET,RequestMethod.POST})
	public String movement_warehouse_movement_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(movement_pro));
		service.movement_warehouse_pro_service(req,model);
		return  "redirect:" + code.c(distribution_management, movement_warehouse, movement_list);
	}
	
	@Override
	@RequestMapping(value = "movement_warehouse/movement_product", method = {RequestMethod.GET,RequestMethod.POST})
	public String movement_warehouse_movement_product(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(movement_product));
		service.movement_warehouse_product_service(req,model);
		return code.c(distribution_management, movement_warehouse, movement_product);
	}
	
	@Override
	@RequestMapping(value = "adjustment_inventory/adjustment_inventory_list", method = {RequestMethod.GET,RequestMethod.POST})
	public String adjustment_inventory(HttpServletRequest req, Model model) throws Exception {
		service.adjustment_inventory_list(req,model);
		return code.c(distribution_management, adjustment_inventory, adjustment_inventory_list);
	}
	
	@Override
	@RequestMapping(value = "adjustment_inventory/adjustment_inventory_view", method = {RequestMethod.GET,RequestMethod.POST})
	public String adjustment_inventory_view(HttpServletRequest req, Model model) throws Exception {
		service.adjustment_inventory_view_service(req,model);
		return code.c(distribution_management, adjustment_inventory, adjustment_inventory_view);
	}

	@Override
	@RequestMapping(value = "adjustment_inventory/adjustment_inventory_pro", method = {RequestMethod.GET,RequestMethod.POST})
	public String adjustment_inventory_pro(HttpServletRequest req, Model model) throws Exception {
		service.adjustment_inventory_pro_service(req,model);
		return "redirect:" + code.c(distribution_management, adjustment_inventory, adjustment_inventory_list);
	}

	@Override
	@RequestMapping(value = "search_distribution_order/statement_list", method = {RequestMethod.GET,RequestMethod.POST})
	public String search_distribution_order(HttpServletRequest req, Model model) throws Exception {
		
		System.out.println("/statement_list");
		
		service.search_distribution_order_service(req,model);
		
		return code.c(distribution_management, search_distribution_order, statement_list);
	}
	
	@Override
	@RequestMapping(value = "search_distribution_order/request_in_out_storage", method = {RequestMethod.GET,RequestMethod.POST})
	public String request_in_out_storage(HttpServletRequest req, Model model) throws Exception {
		
		System.out.println("/request_in_out_storage");
		
		service.request_in_out_storage_service(req,model);
		
		return code.c(distribution_management, search_distribution_order, request_in_out_storage);
	}
	
	@Override
	@RequestMapping(value = "search_distribution_order/request_in_out_storage_pro", method = {RequestMethod.GET,RequestMethod.POST})
	public String request_in_out_storage_pro(HttpServletRequest req, Model model) throws Exception {
		
		System.out.println("/request_in_out_storage_pro");
		
		service.request_in_out_storage_pro_service(req,model);
		
		return "redirect:" + code.c(distribution_management, search_distribution_order, statement_list);
	}

	

	
}
