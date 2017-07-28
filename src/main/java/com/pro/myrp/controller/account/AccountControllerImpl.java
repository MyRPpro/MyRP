package com.pro.myrp.controller.account;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@GetMapping(value="statement_management/search_statements")
	public String search_statements(HttpServletRequest req, Model model) throws Exception {
		System.out.println("search_statements");
		model.addAttribute("req", req);
		service.search_statements_service(model);
		return "accounting_management/statement_management/search_statements";
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

	@Override
	@GetMapping(value="statement_management/search_approval_statements")
	public String search_approval_statements(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_approval_statements));
		model.addAttribute("req", req);
		service.search_approval_statements_service(model);
		return code.c(accounting_management, statement_management, search_approval_statements);
	}

	@Override
	@GetMapping(value="statement_management/make_statement")
	public String make_statement(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(make_statement));
		model.addAttribute("req",req);
		service.make_statement_service(model);
		return code.c(accounting_management, statement_management, make_statement);
	}

	@Override
	@GetMapping(value="statement_management/call_connected_id")
	public String call_connected_id(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(call_connected_id));
		model.addAttribute("req", req);
		service.call_connected_id_service(model);
		return code.c(accounting_management, statement_management, call_connected_id);
	}
	
	@Override
	@GetMapping(value="statement_management/call_connected_id_view")
	public String call_connected_id_view(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(call_connected_id_view));
		model.addAttribute("req",req);
		service.call_connected_id_view_service(model);
		return code.c(accounting_management, statement_management, call_connected_id_view);
	}

	@Override
	@RequestMapping(value="statement_management/make_statement_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String make_statement_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(make_statement));
		model.addAttribute("req",req);
		service.make_statement_pro_service(model);
		int typeCnt = Integer.parseInt(req.getParameter("typeCnt"));
		String url = "";
		if(typeCnt==4) {
			url=code.c(accounting_management, statement_management, approve_statement);
		}else {
			url= "/accounting_management/statement_management/search_statements";
		}
		return "redirect:"+ url;
	}

	@Override
	@GetMapping(value="account_management/search_account_list")
	public String search_account_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_account_list));
		model.addAttribute("req",req);
		service.search_account_list_service(model);
		return code.c(accounting_management, account_management, search_account_list);
	}

	@Override
	@GetMapping(value="account_management/add_account")
	public String add_account(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_account));
		model.addAttribute("req", req);
		service.add_account_service(model);
		return code.c(accounting_management, account_management, add_account);
	}

	@Override
	@GetMapping(value="account_management/add_account_dupCheck")
	public String add_account_dupCheck(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_account_dupCheck));
		model.addAttribute("req",req);
		service.add_account_dupCheck_service(model);
		return code.c(accounting_management, account_management, add_account_dupCheck);
	}

	@Override
	@PostMapping(value="account_management/add_account_pro")
	public String add_account_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_account));
		model.addAttribute("req",req);
		service.add_account_pro_service(model);
		return "redirect:" + code.c(accounting_management, account_management, search_account_list);
	}

	@Override
	@GetMapping(value="account_management/modify_account")
	public String modify_account(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_account));
		model.addAttribute("req",req);
		service.modify_account_service(model);
		return code.c(accounting_management, account_management, modify_account);
	}

	@Override
	@PostMapping(value="account_management/modify_account_pro")
	public String modify_account_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_account));
		model.addAttribute("req",req);
		service.modify_account_pro_service(model);
		return "redirect:"+ code.c(accounting_management, account_management, search_account_list);
	}

	@Override
	@GetMapping(value="financial_statements/search_balance_sheet")
	public String search_balance_sheet(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_balance_sheet));
		model.addAttribute("req",req);
		service.search_balance_sheet_service(model);
		return code.c(accounting_management, financial_statements, search_balance_sheet);
	}
	@Override
	@GetMapping(value="financial_statements/search_balance_sheet2")
	public String search_balnace_sheet2(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_balance_sheet));
		model.addAttribute("req",req);
		service.search_balance_sheet_service(model);
		return "accounting_management/financial_statements/search_balance_sheet2";
	}

	@Override
	@PostMapping(value="financial_statements/show_balance_sheet")
	public String show_balance_sheet(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(show_balance_sheet));
		model.addAttribute("req",req);
		service.show_balance_sheet_service(model);
		return code.c(accounting_management, financial_statements, show_balance_sheet);
	}

	@Override
	@GetMapping(value="financial_statements/search_profit_and_loss_statement")
	public String search_profit_and_loss_statement(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_profit_and_loss_statement));
		model.addAttribute("req",req);
		service.search_profit_and_loss_statement_service(model);
		return code.c(accounting_management, financial_statements, search_profit_and_loss_statement);
	}
	
	@Override
	@RequestMapping(value="financial_statements/show_profit_and_loss_statement", method = {RequestMethod.GET, RequestMethod.POST})
	public String show_profit_and_loss_statement(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(show_profit_and_loss_statement));
		model.addAttribute("req",req);
		service.show_profit_and_loss_statement_service(model);
		return code.c(accounting_management, financial_statements, show_profit_and_loss_statement);
	}

	@Override
	@GetMapping(value="financial_statements/search_statement_of_cash_flows")
	public String search_statement_of_cash_flows(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_statement_of_cash_flows));
		model.addAttribute("req",req);
		service.search_statement_of_cash_flows_service(model);
		return code.c(accounting_management, financial_statements, search_statement_of_cash_flows);
	}

	@Override
	@PostMapping(value="financial_statements/show_statement_of_cash_flows")
	public String show_statement_of_cash_flows(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(show_statement_of_cash_flows));
		model.addAttribute("req",req);
		service.show_statement_of_cash_flows_service(model);
		return code.c(accounting_management, financial_statements, show_statement_of_cash_flows);
	}

	@Override
	public String search_bond_debt(HttpServletRequest req, Model model) throws Exception {
		System.out.println();
		return null;
	}

	

	
	
	
}
