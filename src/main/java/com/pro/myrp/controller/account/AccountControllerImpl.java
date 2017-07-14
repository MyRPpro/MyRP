package com.pro.myrp.controller.account;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		model.addAttribute("req", req);
		service.bank_account_list_service(model);
		return code.c(accounting_management, bank_account_list);
	}

	@Override
	@GetMapping(value="register_bank_account")
	public String register_bank_account(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(register_bank_account));
		model.addAttribute("req", req);
		service.register_bank_account_service(model);
		return code.c(accounting_management, register_bank_account);
	}
	
	@Override
	@GetMapping(value="call_bank_account_id")
	public String call_bank_account_id(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(call_bank_account_id));
		model.addAttribute("req", req);
		service.call_bank_account_id_service(model);
		return code.c(accounting_management, call_bank_account_id);
	}
	
	@Override
	@PostMapping(value="register_bank_account_pro")
	public String register_bank_account_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(register_bank_account));
		model.addAttribute("req", req);
		service.register_bank_account_pro_service(model);
		return "redirect:"+code.c(accounting_management, bank_account_list);
	}
}
