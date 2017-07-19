package com.pro.myrp.persistence.account;

import java.util.ArrayList;
import java.util.Map;

import com.pro.myrp.domain.accounting_management.AccountVO;
import com.pro.myrp.domain.accounting_management.Bank_accountVO;
import com.pro.myrp.domain.accounting_management.JoinStatementDTO;
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
	
	/**
	 * 전표 총 개수
	 * @return
	 */
	public int select_statements_cnt();
	
	/**
	 * 전체 전표 목록
	 * @param daoMap
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_statements(Map<String, Object> daoMap);
	
	/**
	 * 전표 상세 내용
	 * @param statement_id
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_statement_detail(Map<String, Object> daoMap);
	
	/**
	 * 전표 상세 내용 > company_name가져오기 
	 * @param daoMap
	 * @return
	 */
	public String select_detail_company_name(Map<String, Object> daoMap);
	
	/**
	 * 전표 상세 내용 > sum 구해오기
	 * @param daoMap
	 * @return
	 */
	public int select_sum_statement(Map<String, Object> daoMap);
	/**
	 * 전표 승인 > 전표상태 바꿔주기
	 * @param daoMap
	 * @return
	 */
	/*public int update_statement_approval_state(String statement_id);
	
	*//**
	 * 전표 승인 > 계정 값 업데이트 해주기
	 * @param statement_id
	 * @return
	 *//*
	public int update_account_account_value(String statement_id);
	
	*//**
	 * 전표 승인 > 헤당하는 거래에 해당하는 전표개수 가져오기
	 * @param statement_id
	 * @return
	 *//*
	public int select_statement_cnt(String statement_id);
	*//**
	 * 전표 승인 > 해당하는 거래의 전표 코드 가져오기
	 * @param statement_id
	 * @return
	 *//*
	public ArrayList<StatementVO> select_statement_ids(String statement_id);*/
}
