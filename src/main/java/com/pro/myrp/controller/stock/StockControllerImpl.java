package com.pro.myrp.controller.stock;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.pro.myrp.service.stock.StockService;

@Controller
public class StockControllerImpl implements StockController {

	@Inject
	private StockService service;
}
