package com.pro.myrp.controller.account;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.pro.myrp.service.account.AccountService;

@Controller
public class AccountControllerImpl implements AccountController {

	@Inject
	private AccountService service;
}
