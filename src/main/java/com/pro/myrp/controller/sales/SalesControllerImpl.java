package com.pro.myrp.controller.sales;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.pro.myrp.service.sales.SalesService;

@Controller
public class SalesControllerImpl implements SalesController {

	@Inject
	private SalesService service;
}
