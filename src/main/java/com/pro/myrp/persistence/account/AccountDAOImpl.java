package com.pro.myrp.persistence.account;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.accounting_management.AccountVO;
import com.pro.myrp.domain.accounting_management.Bank_accountVO;
import com.pro.myrp.domain.accounting_management.JoinStatementDTO;
import com.pro.myrp.domain.accounting_management.StatementVO;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Inject
	private SqlSession sqlSession;
	
	//계좌수 구하기
	@Override
	public int select_bank_account_cnt() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_bank_account_cnt();
	}
	//계좌목록
	@Override
	public ArrayList<Bank_accountVO> select_bank_account_list(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_bank_account_list(daoMap);
	}
	
	//bank_account_id 불러오기
	@Override
	public ArrayList<AccountVO> select_bank_account_id() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_bank_account_id();
	}
	
	//계좌등록
	@Override
	public int insert_bank_account(Bank_accountVO vo) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.insert_bank_account(vo);
	}
	@Override
	public Bank_accountVO select_bank_account(String bank_account_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_bank_account(bank_account_id);
	}
	@Override
	public int update_bank_account(Bank_accountVO vo) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.update_bank_account(vo);
	}
	@Override
	public int select_statements_cnt() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_statements_cnt();
	}
	@Override
	public ArrayList<JoinStatementDTO> select_statements(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_statements(daoMap);
	}
	@Override
	public ArrayList<JoinStatementDTO> select_statement_detail(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_statement_detail(daoMap);
	}
	@Override
	public String select_detail_company_name(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_detail_company_name(daoMap);
	}
	@Override
	public int update_statement_approval_state(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.update_statement_approval_state(daoMap);
	}
	@Override
	public int update_account_account_value(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.update_account_account_value(daoMap);
	}
	@Override
	public String select_connected_id(String statement_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_connected_id(statement_id);
	}
	@Override
	public int update_statement_disapproval_state(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.update_statement_disapproval_state(daoMap);
	}
	@Override
	public int select_unapproval_statements_cnt() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_unapproval_statements_cnt();
	}
	@Override
	public ArrayList<JoinStatementDTO> select_unapproval_statements(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_unapproval_statements(daoMap);
	}
	@Override
	public int select_approval_statements_cnt() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_approval_statements_cnt();
	}
	@Override
	public ArrayList<JoinStatementDTO> select_approval_statements(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_approval_statements(daoMap);
	}
	@Override
	public ArrayList<JoinStatementDTO> select_sales_statement() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_sales_statement();
	}
	@Override
	public ArrayList<JoinStatementDTO> select_purchase_statement() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_purchase_statement();
	}
	@Override
	public ArrayList<JoinStatementDTO> select_salary_statement() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_salary_statement();
	}
	@Override
	public ArrayList<JoinStatementDTO> select_tax_statement() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_tax_statement();
	}
	
	@Override
	public int insert_statement(StatementVO vo) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.insert_statement(vo);
	}
	@Override
	public int insert_connected_statement(JoinStatementDTO dto) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.insert_connected_statement(dto);
	}
	@Override
	public ArrayList<JoinStatementDTO> select_same_id_sales_statement(String sales_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_same_id_sales_statement(sales_id);
	}
	@Override
	public ArrayList<JoinStatementDTO> select_same_id_purchase_statement(String purchase_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_same_id_purchase_statement(purchase_id);
	}
	@Override
	public ArrayList<JoinStatementDTO> select_same_id_salary_statement(String salary_register_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_same_id_salary_statement(salary_register_id);
	}
	@Override
	public JoinStatementDTO select_same_type_tax(String account_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_same_type_tax(account_id);
	}
	@Override
	public int select_check_account_id_with_statement_id(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_check_account_id_with_statement_id(daoMap);
	}
	@Override
	public int select_check_excist(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_check_excist(daoMap);
	}
	@Override
	public int update_bank_account_account_value(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.update_bank_account_account_value(daoMap);
	}
	@Override
	public String select_get_tax_statement_id() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_get_tax_statement_id();
	}
	@Override
	public int select_account_cnt() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_account_cnt();
	}
	@Override
	public ArrayList<AccountVO> select_account_list(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_account_list(daoMap);
	}
	@Override
	public AccountVO select_account(String account_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_account(account_id);
	}
	@Override
	public int insert_account(AccountVO vo) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.insert_account(vo);
	}
	@Override
	public AccountVO select_ori_account(String account_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_ori_account(account_id);
	}
	@Override
	public int update_modify_account(AccountVO vo) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.update_modify_account(vo);
	}
	@Override
	public ArrayList<JoinStatementDTO> get_statement_year() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.get_statement_year();
	}
	/**
	 * 분기별 조회를 위한 계정 불러오기
	 */
	@Override
	public Long select_accounts_for_quarter_sales(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_accounts_for_quarter_sales(daoMap);
	}
	@Override
	public Long select_accounts_for_quarter_purchase(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_accounts_for_quarter_purchase(daoMap);
	}
	@Override
	public Long select_accounts_for_quarter_salary(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_accounts_for_quarter_salary(daoMap);
	}
	@Override
	public Long select_accounts_for_quarter_tax(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_accounts_for_quarter_tax(daoMap);
	}
	@Override
	public ArrayList<AccountVO> select_accounts() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_accounts();
	}
	@Override
	public int select_count_sales(Map<String, Object> oriPriceMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_count_sales(oriPriceMap);
	}
	@Override
	public int select_purchase_unit_price(Map<String, Object> oriPriceMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_purchase_unit_price(oriPriceMap);
	}
	@Override
	public int update_costs_of_goods_sold_account(Map<String, Object> oriPriceMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.update_costs_of_goods_sold_account(oriPriceMap);
	}
	@Override
	public ArrayList<JoinStatementDTO> select_sales_id(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_sales_id(daoMap);
	}
	@Override
	public Long select_accounts_for_date_sales(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_accounts_for_date_sales(daoMap);
	}
	@Override
	public Long select_accounts_for_date_purchase(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return  dao.select_accounts_for_date_purchase(daoMap);
	}
	@Override
	public Long select_accounts_for_date_salary(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_accounts_for_date_salary(daoMap);
	}
	@Override
	public Long select_accounts_for_date_tax(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_accounts_for_date_tax(daoMap);
	}
	@Override
	public ArrayList<JoinStatementDTO> select_cash_values(Map<Object, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_cash_values(daoMap);
	}
	@Override
	public String select_account_name_for_tax(String statement_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_account_name_for_tax(statement_id);
	}
	@Override
	public String select_account_name_for_all(String statement_id) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_account_name_for_all(statement_id);
	}

	
	
	
	
	
}
