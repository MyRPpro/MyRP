package com.pro.myrp.persistence.account;

import java.sql.Date;
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
	
	public int update_bank_account_account_value(Map<String, Object> daoMap);
	
	/**
	 * 전표 id로 connected_id 가져오기 
	 * @param statement_id
	 * @return
	 */
	public String select_connected_id(String statement_id);
	
	/** 
	 * 전표 승인 > 승인할 전표의 계정이 계좌를 가지고 있어야하는 지 확인
	  *@param daoMap
	 * @return
	 */
	public int select_check_account_id_with_statement_id(Map<String, Object> daoMap);
	/**
	 * 전표 승인 > 승인할 전표가 가진 계정값이 계좌를 가지고있는지 확인
	 * @param daoMap
	 * @return
	 */
	public int select_check_excist(Map<String, Object> daoMap);
	
	public int update_bank_account_value_for_purchase(Map<String, Object> daoMap);
	public int select_account_id_check(Map<String, Object> daoMap);
	public int select_check_statement_type(Map<String, Object> daoMap);
	
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

	/**
	 * 전표생성 > connected_id 불러오기 - sales, purchase, salary
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_sales_statement();
	public ArrayList<JoinStatementDTO> select_purchase_statement();
	public ArrayList<JoinStatementDTO> select_salary_statement();
	public ArrayList<JoinStatementDTO> select_tax_statement();
	
	/**
	 * 전표 생성 > statement 에 값 집어넣기
	 * @return
	 */
	public int insert_statement(StatementVO vo);
	/**
	 * 전표 생성 > sales_statement, purchase_statement, salary_register_statement, tax_statement 에 값 집어넣기
	 * @param dto
	 * @return
	 */
	public int insert_connected_statement(JoinStatementDTO dto);

	/**
	 * 전표생성 > 같은 connected_id 가진 관련 전표 내용 가져오기
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_same_id_sales_statement(String sales_id);
	public ArrayList<JoinStatementDTO> select_same_id_purchase_statement(String purchase_id);
	public ArrayList<JoinStatementDTO> select_same_id_salary_statement(String salary_register_id);
	public JoinStatementDTO select_same_type_tax(String account_id);
	/**
	 * 전표생성 > 세금 전표 id 가져오기
	 * @return
	 */
	public String select_get_tax_statement_id();
	
	/**
	 * 게정관리 > 계정 목록 조회 > 계정 갯수 가져오기
	 * @return
	 */
	public int select_account_cnt();
	
	/**
	 * 계정관리 > 계정 목록 조회 > 계정 목록 가져오기
	 * @return
	 */
	public ArrayList<AccountVO> select_account_list(Map<String, Object> daoMap);

	/**
	 * 계정관리 > 계정 추가 > account_id 중복확인
	 * @param account_id
	 * @return
	 */
	public AccountVO select_account(String account_id);
	
	/**
	 * 계정관리 > 계정추가 처리
	 * @param vo
	 * @return
	 */
	public int insert_account(AccountVO vo);
	
	/**
	 * 계정관리 > 계정수정
	 * @param account_id
	 * @return
	 */
	public AccountVO select_ori_account(String account_id);

	/**
	 * 계정관리 > 계정수정 처리
	 * @param vo
	 * @return
	 */
	public int update_modify_account(AccountVO vo);
	
	/**
	 * 회계보고서 > 회사가 가진 전표의 모든 년  가져오기
	 */
	public ArrayList<JoinStatementDTO> get_statement_year();
	
	/**
	 * 회계보고서 > 재무상태표 관리
	 * @param daoMap
	 * @return
	 */
	public ArrayList<AccountVO> select_accounts();
	public Long select_accounts_for_quarter_sales(Map<Object, Object> daoMap);
	public Long select_accounts_for_quarter_purchase(Map<Object, Object> daoMap);
	public Long select_accounts_for_quarter_salary(Map<Object, Object> daoMap);
	public Long select_accounts_for_quarter_tax(Map<Object, Object> daoMap);
	
	/**
	 * 전표승인 > 매출원가 해주기
	 * @param oriPriceMap
	 * @return
	 */
	public int select_count_sales(Map<String, Object> oriPriceMap);
	public int select_purchase_unit_price(Map<String, Object> oriPriceMap);
	public int update_costs_of_goods_sold_account(Map<String, Object> oriPriceMap);

	public ArrayList<JoinStatementDTO> select_sales_id(Map<Object, Object> daoMap);
	
	/**
	 * 회계보고서 > 손익계산서 관리 
	 * @param daoMap
	 * @return
	 */
	public Long select_accounts_for_date_sales(Map<Object, Object> daoMap);
	public Long select_accounts_for_date_purchase(Map<Object, Object> daoMap);
	public Long select_accounts_for_date_salary(Map<Object, Object> daoMap);
	public Long select_accounts_for_date_tax(Map<Object, Object> daoMap);

	/**
	 * 회계보고서 >
	 * @param daoMap
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_cash_values(Map<Object,Object> daoMap);
	public String select_account_name_for_tax(String statement_id);
	public String select_account_name_for_all(String statement_id);
	
	/**
	 * 채권/채무 현황 > 모든 채권/채무 내역 조회
	 * @param daoMap
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_all_bond_debt_list(Map<Object, Object> daoMap);
	/**
	 * 채권/채무 현황 > 거래처별 채권/채무 내역 조회
	 * @param daoMap
	 * @return
	 */
	public ArrayList<JoinStatementDTO> select_bond_debt_list_by_company(Map<Object, Object> daoMap);
	
	public ArrayList<JoinStatementDTO> select_company_name();
}
