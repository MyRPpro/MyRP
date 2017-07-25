package com.pro.myrp.persistence.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.purchase_management.PurchaseDTO;

@Repository
public class purchaseDAOImpl implements purchaseDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int select_purchase_cnt() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_purchase_cnt();
	}

	@Override
	public ArrayList<PurchaseDTO> select_purchase_list(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_purchase_list(daoMap);
	}

	@Override
	public int update_purchase(PurchaseDTO dto) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.update_purchase(dto);
	}
	
	@Override
	public ArrayList<PurchaseDTO> select_quick_serch_purchase(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_quick_serch_purchase(daoMap);
	}

	@Override
	public int count_serch_purchase(String search_str) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.count_serch_purchase(search_str);
	}

	
	@Override
	public ArrayList<PurchaseDTO> select_product_ids() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_product_ids();
	}

	@Override
	public ArrayList<PurchaseDTO> select_company_ids() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_company_ids();
	}

	@Override
	public ArrayList<PurchaseDTO> select_employee_ids() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_employee_ids();
	}

	@Override
	public int insert_reg_purchase(PurchaseDTO dto) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.insert_reg_purchase(dto);
	}

	@Override
	public ArrayList<PurchaseDTO> select_account_ids() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_account_ids();
	}


	@Override
	public String select_purchase_id() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_purchase_id();
		
	}

	@Override
	public String select_statement_id() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_statement_id();
	}

	@Override
	public List<PurchaseDTO> select_purchase_order(String product_id) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_purchase_order(product_id);
	}

	@Override
	public int update_account_approve_purchase() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.update_account_approve_purchase();
	}

	@Override
	public int select_account_approve_purchase_cnt() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_account_approve_purchase_cnt();
	}

	@Override
	public int update_stock_in_purchase() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.update_stock_in_purchase();
	}

	@Override
	public int select_stock_in_purchase_cnt() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_stock_in_purchase_cnt();
	}

	@Override
	public int select_checkout_purchase_cnt() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_checkout_purchase_cnt();
	}

	@Override
	public int select_all_purchase_cnt() {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_all_purchase_cnt();
	}

	@Override
	public int select_search_purchase_cnt(String search_str) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_search_purchase_cnt(search_str);
	}

	@Override
	public ArrayList<PurchaseDTO> select_account_approve_purchase_list(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_account_approve_purchase_list(daoMap);
	}

	@Override
	public ArrayList<PurchaseDTO> select_stock_in_purchase_list(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_stock_in_purchase_list(daoMap);
	}

	@Override
	public ArrayList<PurchaseDTO> select_checkout_purchase_list(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_checkout_purchase_list(daoMap);
	}

	@Override
	public ArrayList<PurchaseDTO> select_purchase_All_list(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_purchase_All_list(daoMap);
	}

	@Override
	public ArrayList<PurchaseDTO> select_modify_purchase(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_modify_purchase(daoMap);
	}

	@Override
	public ArrayList<PurchaseDTO> select_detail_purchase(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.select_detail_purchase(daoMap);
	}

	@Override
	public int update_req_storage_in(Map<String, Object> daoMap) {
		purchaseDAO dao = sqlSession.getMapper(purchaseDAO.class);
		return dao.update_req_storage_in(daoMap);
	}

	
	




}
