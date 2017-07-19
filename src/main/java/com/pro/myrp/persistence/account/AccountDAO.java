package com.pro.myrp.persistence.account;

import java.util.ArrayList;
import java.util.Map;

import com.pro.myrp.domain.accounting_management.AccountVO;
import com.pro.myrp.domain.accounting_management.Bank_accountVO;
import com.pro.myrp.domain.accounting_management.JoinStatementDTO;
import com.pro.myrp.domain.accounting_management.StatementVO;
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
	 * 전표 승인 > 전표상태 바꿔주기
	 * @param daoMap
	 * @return
	 */
	public int update_statement_approval_state(Map<String, Object> daoMap);
	
	/**
	 * 전표 승인 > 계정 값 업데이트 해주기
	 * @param statement_id
	 * @return
	 */
	public int update_account_account_value(Map<String, Object> daoMap);
	
	/**
	 * 전표 id로 connected_id 가져오기 
	 * @param statement_id
	 * @return
	 */
	public String select_connected_id(String statement_id);
	/**
	 * 전표 승인 거절 > 전표상태 바꿔주기
	 * @param daoMap
	 * @return
	 */
	public int update_statement_disapproval_state(Map<String, Object> daoMap);
	
	/**
	 * 미승인 전표 개수
	 * @return
	 */
	public int select_unapproval_statements_cnt();
	/**
	 * 미승인 전표 조회
	 * @param daoMap
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_unapproval_statements(Map<String, Object> daoMap);
	
	/**
	 * 승인 전표 개수
	 * @return
	 */
	public int select_approval_statements_cnt();
	
	/**
	 * 승인 전표 조회
	 * @param daoMap
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_approval_statements(Map<String,Object> daoMap);
}
