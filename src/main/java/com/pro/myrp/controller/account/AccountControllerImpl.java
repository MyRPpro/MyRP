package com.pro.myrp.controller.account;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.account.AccountService;

@Controller
@RequestMapping("/accounting_management/*")
public class AccountControllerImpl implements AccountController, CodeMyRP{

	@Inject
	private AccountService service;

	@Override
	@GetMapping(value="bank_account_list")
	public String bank_account_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(bank_account_list));
		model.addAttribute("req",req);
		service.bank_account_list_service(model);
		return code.c(accounting_management, bank_account_list);
	}
}
