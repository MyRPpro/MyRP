package com.pro.myrp.controller.stock;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@RequestMapping(value = "reg_warehouse/warehouse_list", method = {RequestMethod.GET,RequestMethod.POST})
	public String reg_warehouse(HttpServletRequest req, Model model) throws Exception {
		return code.c(distribution_management, reg_warehouse, warehouse_list);
	}

	@Override
	@RequestMapping(value = "movement_warehouse/movement_all_list", method = {RequestMethod.GET,RequestMethod.POST})
	public String movement_warehouse(HttpServletRequest req, Model model) throws Exception {
		return code.c(distribution_management, movement_warehouse, movement_all_list);
	}

	@Override
	@RequestMapping(value = "adjustment_inventory/adjustment_inventory_list", method = {RequestMethod.GET,RequestMethod.POST})
	public String adjustment_inventory(HttpServletRequest req, Model model) throws Exception {
		return code.c(distribution_management, adjustment_inventory, adjustment_inventory_list);
	}

	@Override
	@RequestMapping(value = "search_distribution_order/all_statement_list", method = {RequestMethod.GET,RequestMethod.POST})
	public String search_distribution_order(HttpServletRequest req, Model model) throws Exception {
		return code.c(distribution_management, search_distribution_order, all_statement_list);
	}
}
