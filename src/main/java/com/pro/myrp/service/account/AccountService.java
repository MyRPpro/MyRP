package com.pro.myrp.service.account;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface AccountService extends MyRPService {

	/**
	 * 계좌 등록 > 계좌 리스트 서비스
	 * @author 정원
	 * @param model
	 * @throws Exception
	 */
	public void bank_account_list_service(Model model) throws Exception;
}
