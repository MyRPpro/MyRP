package com.pro.myrp.service.account;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pro.myrp.persistence.account.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService {

	@Inject
	private AccountDAO dao;
}
