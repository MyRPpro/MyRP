package com.pro.myrp.persistence.account;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.accounting_management.Bank_accountVO;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int select_bank_account_cnt() {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_bank_account_cnt();
	}

	@Override
	public ArrayList<Bank_accountVO> select_bank_account_list(Map<String, Object> daoMap) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		return dao.select_bank_account_list(daoMap);
	}
	
}
