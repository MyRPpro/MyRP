package com.pro.myrp.controller.purchase;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.pro.myrp.service.purchase.PurchaseService;

@Controller
public class PurchaseControllerImpl implements PurchaseController {

	@Inject
	private PurchaseService service;
}
