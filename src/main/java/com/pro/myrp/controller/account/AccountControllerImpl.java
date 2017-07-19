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
	@GetMapping(value="bank_account_registration/bank_account_list")
	public String bank_account_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(bank_account_list));
		model.addAttribute("req", req);
		service.bank_account_list_service(model);
		return code.c(accounting_management, bank_account_registration, bank_account_list);
	}

	@Override
	@GetMapping(value="bank_account_registration/register_bank_account")
	public String register_bank_account(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(register_bank_account));
		model.addAttribute("req", req);
		service.register_bank_account_service(model);
		return code.c(accounting_management, bank_account_registration, register_bank_account);
	}
	
	@Override
	@GetMapping(value="bank_account_registration/call_bank_account_id")
	public String call_bank_account_id(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(call_bank_account_id));
		model.addAttribute("req", req);
		service.call_bank_account_id_service(model);
		return code.c(accounting_management, bank_account_registration, call_bank_account_id);
	}
	
	@Override
	@PostMapping(value="bank_account_registration/register_bank_account_pro")
	public String register_bank_account_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(register_bank_account));
		model.addAttribute("req", req);
		service.register_bank_account_pro_service(model);
		return "redirect:"+code.c(accounting_management, bank_account_registration, bank_account_list);
	}

	@Override
	@GetMapping(value="bank_account_registration/modify_bank_account")
	public String modify_bank_account(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_bank_account));
		model.addAttribute("req", req);
		service.modify_bank_account_service(model);
		return code.c(accounting_management, bank_account_registration, modify_bank_account);
	}

	@Override
	@PostMapping(value="bank_account_registration/modify_bank_account_pro")
	public String modify_bank_account_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_bank_account));
		model.addAttribute("req", req);
		service.modify_bank_account_pro_service(model);
		return "redirect:"+code.c(accounting_management, bank_account_registration, bank_account_list);
	}

	@Override
	@GetMapping(value="statement_management/search_all_statements")
	public String search_all_statements(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_all_statements));
		model.addAttribute("req", req);
		service.search_all_statements_service(model);
		return code.c(accounting_management, statement_management, search_all_statements);
	}

	@Override
	@GetMapping(value="statement_management/search_statement_detail")
	public String search_statement_detail(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_statement_detail));
		model.addAttribute("req", req);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
		service.search_statement_detail(model);
		return code.c(accounting_management, statement_management , search_statement_detail);
	}
	@Override
	@GetMapping(value="statement_management/approve_statement")
	public String approve_statement(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(approve_statement));
		model.addAttribute("req", req);
		service.approve_statement_service(model);
		return code.c(accounting_management, statement_management, approve_statement);
	}

	@Override
	@GetMapping(value="statement_management/disapprove_statement")
	public String disapprove_statement(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(disapprove_statement));
		model.addAttribute("req",req);
		service.disapprove_statement_service(model);
		return code.c(accounting_management, statement_management, disapprove_statement);
	}

	@Override
	@GetMapping(value="statement_management/search_unapproval_statements")
	public String search_unapproval_statements(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_unapproval_statements));
		model.addAttribute("req", req);
		service.search_unapproval_statements_service(model);
		return code.c(accounting_management, statement_management, search_unapproval_statements);
	}

	/*@Override
	public String make_statement(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(make_statement));
		model.addAttribute("req",req);
		service.make_statement_service(model);
		return code.c(accounting_management, statement_management, make_statement);
	}*/
	
	
}
