package com.pro.myrp.persistence.account;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.accounting_management.AccountVO;
import com.pro.myrp.domain.accounting_management.Bank_accountVO;

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
	
	
	
	
}
