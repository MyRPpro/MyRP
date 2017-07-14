package com.pro.myrp.persistence.account;

import java.util.ArrayList;
import java.util.Map;

import com.pro.myrp.domain.accounting_management.AccountVO;
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
	
	/**
	 * bank_account_id 불러오기
	 * @return
	 */
	public ArrayList<AccountVO> select_bank_account_id();
	
	/**
	 * 계좌 등록
	 * @author 정원
	 * @param vo
	 * @return
	 */
	public int insert_bank_account(Bank_accountVO vo);
	
	/**
	 * 계좌 수정 
	 * @param bank_account_id
	 * @return
	 */
	public Bank_accountVO select_bank_account(String bank_account_id);
	
	/**
	 * 계좌 수정 처리
	 * @param vo
	 * @return
	 */
	public int update_bank_account(Bank_accountVO vo);
}
