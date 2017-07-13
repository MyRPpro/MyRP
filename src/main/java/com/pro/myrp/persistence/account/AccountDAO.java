package com.pro.myrp.persistence.account;

import java.util.ArrayList;
import java.util.Map;

import com.pro.myrp.domain.accounting_management.Bank_accountVO;
import com.pro.myrp.persistence.MyRPDAO;

public interface AccountDAO extends MyRPDAO {
	
	/**
	 * 계좌 총 개수
	 * @return
	 */
	public int select_bank_account_cnt();
	
	/**
	 * 계좌 목록
	 * @return
	 */
	public ArrayList<Bank_accountVO> select_bank_account_list(Map<String, Object> daoMap);
	
}
