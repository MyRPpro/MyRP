package com.pro.myrp.persistence.sales;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.sales_management.SalesDTO;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int count_quick_serch_sales(String search_str) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.count_quick_serch_sales(search_str);
	}
	

	@Override
	public int select_sales_cnt() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_sales_cnt();
	}

	
	@Override
	public ArrayList<SalesDTO> select_sales_list(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_sales_list(daoMap);
	}


	@Override
	public ArrayList<SalesDTO> select_quick_serch_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_quick_serch_sales(daoMap);
	}


	@Override
	public ArrayList<SalesDTO> select_detail_sales(  Map<String, Object> daoMap ) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_detail_sales(daoMap);
	}


	@Override
	public int update_sales(SalesDTO dto) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.update_sales(dto);
	}


	@Override
	public ArrayList<SalesDTO> select_account() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_account();
	}


	@Override
	public ArrayList<SalesDTO> select_product() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_product();
	}


	@Override
	public ArrayList<SalesDTO> select_company() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_company();
	}


	@Override
	public ArrayList<SalesDTO> select_employee() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_employee();
	}


	
	
	
	
	@Override
	public ArrayList<SalesDTO> select_product_ids() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_product_ids();
	}


	@Override
	public ArrayList<SalesDTO> select_company_ids() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_company_ids();
	}


	@Override
	public ArrayList<SalesDTO> select_employee_ids() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_employee_ids();
	}


	@Override
	public int insert_reg_sales(SalesDTO dto) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.insert_reg_sales(dto);
	}


	@Override
	public ArrayList<SalesDTO> select_account_ids() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_account_ids();
	}


	@Override
	public int insert_reg_sales_statement(SalesDTO dto) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.insert_reg_sales_statement(dto);
	}


	@Override
	public String select_sales_id() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_sales_id();
	}


	@Override
	public String select_statement_id() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_statement_id();
	}


	@Override
	public ArrayList<SalesDTO> select_sales_order(String product_id) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_sales_order(product_id);
	}



	
	@Override
	public ArrayList<SalesDTO> select_detail_status_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_detail_status_sales(daoMap);
	}


	@Override
	public int count_search_status_sales(Map<String, String> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.count_search_status_sales(daoMap);
	}
	


	@Override
	public ArrayList<SalesDTO> select_serch_status_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_serch_status_sales(daoMap);
	}


	@Override
	public ArrayList<SalesDTO> select_all_status_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_all_status_sales(daoMap);
	}


	@Override
	public int count_option_status_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.count_option_status_sales(daoMap);
	}


	@Override
	public ArrayList<SalesDTO> select_serch_option_status_sales(Map<String, Object> optionMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_serch_option_status_sales(optionMap);
	}

		
	@Override
	public int update_req_storage_out(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.update_req_storage_out(daoMap);
	}


	

	

	@Override
	public int select_count_approve_sales() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_count_approve_sales();
	}


	@Override
	public ArrayList<SalesDTO> select_account_approve_serch_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_account_approve_serch_sales(daoMap);
	}


	@Override
	public int update_account_approve_serch_sales() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.update_account_approve_serch_sales();
	}


	
	@Override
	public int update_stock_out_serch_sales() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.update_stock_out_serch_sales();
	}


	
	@Override
	public ArrayList<SalesDTO> select_stock_out_serch_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_stock_out_serch_sales(daoMap);
	}


	@Override
	public int select_count_stock_out_sales() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_count_stock_out_sales();
	}


	@Override
	public int select_count_checkout_sales() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_count_checkout_sales();
	}


	@Override
	public ArrayList<SalesDTO> select_checkout_serch_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_checkout_serch_sales(daoMap);
	}


	@Override
	public ArrayList<SalesDTO> select_modify_sales(Map<String, Object> daoMap) {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_modify_sales(daoMap);
	}


	@Override
	public String select_account_price() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_account_price();
	}


	@Override
	public String select_account_tax() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_account_tax();
	}


	@Override
	public String select_account_sum() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_account_sum();
	}


	@Override
	public int select_strage_out() {
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		return dao.select_strage_out();
	}
	

	
	
}
